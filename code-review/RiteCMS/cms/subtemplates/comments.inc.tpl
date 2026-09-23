<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['comments']; ?></h1>

<div id="nav">
 <ul id="navlist">
  <li><a <?php if($type==0): ?>class="active" <?php endif; ?>href="<?php echo CMSHOME;?>?mode=comments&amp;type=0" style="width:140px;"><?php echo $lang['comments_page_c']; ?></a></li>
  <li><a <?php if($type==1): ?>class="active" <?php endif; ?>href="<?php echo CMSHOME;?>?mode=comments&amp;type=1" style="width:140px;"><?php echo $lang['comments_photo_c']; ?></a></li>
 </ul>
<p>&nbsp;</p>
</div>

<?php if(isset($comments)): ?>

<div id="edit-comments">

 <div id="itemnav">
  <form method="get" action="<?php echo CMSHOME;?>">
   <div>
    <input type="hidden" name="mode" value="comments" />
    <input type="hidden" name="type" value="<?php echo $type; ?>" />
    <select size="1" name="comment_id" onchange="this.form.submit();">
     <option value="0"><?php if($type==0) echo $lang['comments_all_pages']; else echo $lang['comments_all_photos']; ?></option>
     <?php foreach($items as $key => $val): ?>
     <option value="<?php echo $key; ?>"<?php if($key==$comment_id): ?> selected="selected"<?php endif; ?>><?php echo $val['title']; ?></option>
     <?php endforeach; ?>
    </select> <input type="image" name="" value="" src="<?php echo BASE_URL.CMS; ?>images/submit.png" alt="&raquo;" />
   </div>
  </form>
 </div>

 <div id="pagination">
  <?php if($pagination): ?>
  <?php if($pagination['previous']): ?> <a href="<?php echo CMSHOME;?>?mode=comments&amp;type=<?php echo $type; ?>&amp;comment_id=<?php echo $comment_id; ?>&amp;page=<?php echo $pagination['previous']; ?>">&laquo;</a> <?php endif; ?>
  <?php foreach($pagination['items'] as $item): ?>
  <?php if(empty($item)): ?> ..<?php elseif($item==$pagination['current']): ?> <span class="current"><?php echo $item; ?></span><?php else: ?> <a href="<?php echo CMSHOME;?>?mode=comments&amp;type=<?php echo $type; ?>&amp;comment_id=<?php echo $comment_id; ?>&amp;page=<?php echo $item; ?>"><?php echo $item; ?></a><?php endif; ?>
  <?php endforeach; ?>
  <?php if($pagination['next']): ?> <a href="<?php echo CMSHOME;?>?mode=comments&amp;type=<?php echo $type; ?>&amp;comment_id=<?php echo $comment_id; ?>&amp;page=<?php echo $pagination['next']; ?>">&raquo;</a><?php endif; ?>
  <?php endif; ?>
 </div>

</div>

<form id="entryeditform" method="post" action="<?php echo CMSHOME;?>">
 <div>
  <input type="hidden" name="mode" value="comments" />
  <table class="admin-table wide" cellspacing="1" cellpadding="5" border="0">
   <tr>
    <th>&nbsp;</th>
    <th><?php if($type==0) echo $lang['comments_page']; else echo $lang['comments_photo']; ?></th>
    <th><?php echo $lang['comments_time']; ?></th>
    <th><?php echo $lang['comments_name']; ?></th>
    <th><?php echo $lang['comments_comment']; ?></th>
    <th><?php echo $lang['comments_ip']; ?></th>
    <th colspan="<?php if($settings['akismet_key']!='' && $settings['akismet_entry_check']==1): ?>3<?php else: ?>2<?php endif; ?>">&nbsp;</th>
   </tr>
   <?php $i=0; foreach($comments as $comment): ?>
   <tr class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
    <td><input type="checkbox" name="checked[]" value="<?php echo $comment['id']; ?>" /></td>
    <td><?php if($type==1): ?><?php if(isset($items[$comment['comment_id']])): ?><a href="<?php echo BASE_URL.MEDIA_DIR.$items[$comment['comment_id']]['photo_normal']; ?>"><img src="<?php echo BASE_URL.MEDIA_DIR.$items[$comment['comment_id']]['photo_thumbnail']; ?>" title="<?php echo $items[$comment['comment_id']]['title']; ?>" alt="<?php echo $items[$comment['comment_id']]['title']; ?>" onclick="image_popup('<?php echo BASE_URL.MEDIA_DIR.$items[$comment['comment_id']]['photo_normal']; ?>'); return false" /></a><?php else: ?>-<?php endif; ?><?php else: ?><?php if(isset($items[$comment['comment_id']])): ?><a href="<?php echo BASE_URL.$items[$comment['comment_id']]['page']; ?>#comments"><?php echo $items[$comment['comment_id']]['title']; ?></a><?php else: ?>-<?php endif; ?><?php endif; ?></td>
    <td><?php echo strftime($lang['time_format'], $comment['time']); ?></td>
    <td><?php if(preg_match("/^[^@]+@.+\.\D{2,5}$/", $comment['email_hp'])) { ?><a href="mailto:<?php echo $comment['email_hp']; ?>"><?php echo $comment['name']; ?></a><?php } elseif($comment['email_hp']!='') { ?><a href="http://<?php echo $comment['email_hp']; ?>"><?php echo $comment['name']; ?></a><?php } else echo $comment['name']; ?></td>
    <td><?php if($comment['comment']=='' && $type==0): ?><em><?php echo $lang['pingback']; ?></em><?php else: echo $comment['comment']; endif; ?></td>
    <td><?php echo $comment['ip']; ?></td>
    <td><a href="<?php echo CMSHOME;?>?mode=comments&amp;type=<?php echo $type; ?>&amp;edit=<?php echo $comment['id']; ?>&amp;comment_id=<?php echo $comment_id; ?>&amp;page=<?php echo $page; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a></td>
    <td><a href="<?php echo CMSHOME;?>?mode=comments&type=<?php echo $type; ?>&amp;delete=<?php echo $comment['id']; ?>&amp;comment_id=<?php echo $comment_id; ?>&amp;page=<?php echo $page; ?>" onclick="<!--return confirm_link('<?php echo rawurlencode($lang['delete_this_comment_confirm']); ?>')-->"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
    <?php if($settings['akismet_key']!='' && $settings['akismet_entry_check']==1): ?>
    <td class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>"><a href="<?php echo CMSHOME;?>?mode=comments&type=<?php echo $type; ?>&amp;report_spam=<?php echo $comment['id']; ?>&amp;comment_id=<?php echo $comment_id; ?>&amp;page=<?php echo $page; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/exclamation.png" alt="<?php echo $lang['report_as_spam']; ?>" title="<?php echo $lang['report_as_spam']; ?>" width="16" height="16" /></a></td>
    <?php endif ?>
   </tr>
   <?php $i++; endforeach; ?>
  </table>

  <div id="edit-comments-bottom"><img style="margin-left:5px;" src="<?php echo BASE_URL.CMS; ?>images/checkall.png" alt="" width="24" height="20" /> <a href="#" onclick="checkall('entryeditform', true); return false;"><?php echo $lang['comments_checkall']; ?></a> / <a href="#" onclick="checkall('entryeditform', false); return false;"><?php echo $lang['comments_uncheckall']; ?></a> - <?php echo $lang['comments_del_checked']; ?> <input type="submit" name="delete_checked" value="<?php echo $lang['submit_button_ok']; ?>" /> -
  <?php if($comment_id==0): ?>
  <?php echo $lang['comments_delete_all']; ?> <input type="submit" name="delete_all_comments" value="<?php echo $lang['submit_button_ok']; ?>" />
  <?php else: ?>
  <?php if($type==0):
  #echo str_replace('[page]',stripslashes($comment['item']),$lang['delete_all_comments_page']);
  echo $lang['delete_all_comments_page'];
  else: echo $lang['delete_all_comments_photo'];
  endif; ?>
  <input type="submit" name="delete_all_comments_page" value="<?php echo $lang['submit_button_ok']; ?>">
  <input type="hidden" name="comment_id" value="<?php echo $comment_id; ?>" />
  <?php endif; ?>
  <input type="hidden" name="item" value="<?php echo $comment['item']; ?>" />
  <input type="hidden" name="type" value="<?php echo $type; ?>" />
  <input type="hidden" name="page" value="<?php echo $page; ?>" />
  </div>

 </div>
</form>

<?php else: ?>
<div id="edit-comments-bottom"><p><em><?php echo $lang['no_comments']; ?></em></p></div>
<?php endif; ?>

<?php if($type==1 && $settings['photos_commentable']==1): ?>
<p class="small"><?php echo $lang['photo_comments_enabled']; ?></p>
<?php elseif($type==1 && $settings['photos_commentable']==0): ?>
<p class="small"><?php echo $lang['photo_comments_disabled']; ?></p>
<?php endif; ?>
