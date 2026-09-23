<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['page_overview']; ?></h1>

<?php if(isset($pages)): ?>
<table class="admin-table wide" cellspacing="1" cellpadding="5" border="0">
 <tr>
  <th><a href="<?php echo CMSHOME;?>?mode=pages&amp;cpage=<?php echo $cpage;?>&amp;order=page&amp;descasc=<?php if ($descasc=="ASC" && $order=="page") echo "DESC"; else echo "ASC"; ?>"><?php echo $lang['page_name_marking']; ?></a><?php if ($order=="page" && $descasc=="ASC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/asc.gif" alt="[asc]" width="5" height="9" /><?php } elseif ($order=="page" && $descasc=="DESC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/desc.gif" alt="[desc]" width="5" height="9" /><?php } ?></th>
  <th><a href="<?php echo CMSHOME;?>?mode=pages&amp;cpage=<?php echo $cpage;?>&amp;order=title&amp;descasc=<?php if ($descasc=="ASC" && $order=="title") echo "DESC"; else echo "ASC"; ?>"><?php echo $lang['title_marking']; ?></a><?php if ($order=="title" && $descasc=="ASC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/asc.gif" alt="[asc]" width="5" height="9" /><?php } elseif ($order=="title" && $descasc=="DESC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/desc.gif" alt="[desc]" width="5" height="9" /><?php } ?></th>
  <th><a href="<?php echo CMSHOME;?>?mode=pages&amp;cpage=<?php echo $cpage;?>&amp;order=time&amp;descasc=<?php if ($descasc=="ASC" && $order=="time") echo "DESC"; else echo "ASC"; ?>"><?php echo $lang['created_marking']; ?></a><?php if ($order=="time" && $descasc=="ASC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/asc.gif" alt="[asc]" width="5" height="9" /><?php } elseif ($order=="time" && $descasc=="DESC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/desc.gif" alt="[desc]" width="5" height="9" /><?php } ?></th>
  <th><a href="<?php echo CMSHOME;?>?mode=pages&amp;cpage=<?php echo $cpage;?>&amp;order=last_modified&amp;descasc=<?php if ($descasc=="ASC" && $order=="last_modified") echo "DESC"; else echo "ASC"; ?>"><?php echo $lang['last_modified_marking']; ?></a><?php if ($order=="last_modified" && $descasc=="ASC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/asc.gif" alt="[asc]" width="5" height="9" /><?php } elseif ($order=="last_modified" && $descasc=="DESC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/desc.gif" alt="[desc]" width="5" height="9" /><?php } ?></th>
  <?php if($settings['count_views']): ?>
  <th><a href="<?php echo CMSHOME;?>?mode=pages&amp;cpage=<?php echo $cpage;?>&amp;order=views&amp;descasc=<?php if ($descasc=="ASC" && $order=="views") echo "DESC"; else echo "ASC"; ?>"><?php echo $lang['views_marking']; ?></a><?php if ($order=="views" && $descasc=="ASC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/asc.gif" alt="[asc]" width="5" height="9" /><?php } elseif ($order=="views" && $descasc=="DESC") { ?>&nbsp;<img src="<?php echo BASE_URL.CMS; ?>images/desc.gif" alt="[desc]" width="5" height="9" /><?php } ?></th>
  <?php endif; ?>
  <th colspan="2">&nbsp;</th>
 </tr>
 <?php $i=0; $total_views=0; foreach($pages as $page): ?>
 <tr class="<?php if($i % 2 == 0) echo "a"; else echo "b"; ?>">
  <td><?php if($page['status']>0) { ?><a href="<?php echo BASE_URL.$page['page']; ?>"><?php if($settings['index_page']==$page['page']) { ?><b><?php } echo $page['page']; if($settings['index_page']==$page['page']) { ?></b><?php } ?></a><?php } else echo $page['page']; ?></td>
  <td><?php echo $page['title']; ?></td>
  <td><?php echo strftime($lang['time_format'],$page['time']); if(isset($users[$page['author']])) { ?> <span class="smallx">(<?php echo $users[$page['author']]; ?>)</span><?php } ?></td>
  <td><?php echo strftime($lang['time_format'],$page['last_modified']); if(isset($users[$page['last_modified_by']])) { ?> <span class="smallx">(<?php echo $users[$page['last_modified_by']]; ?>)</span><?php } ?></td>
  <?php if($settings['count_views']): ?>
  <td><?php echo $page['views']; $total_views=$total_views+$page['views']; ?></td>
  <?php endif; ?>
  <?php if($page['edit_permission']): ?>
  <td><a href="<?php echo CMSHOME;?>?mode=edit&amp;id=<?php echo $page['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a></td>
  <td><a href="<?php echo CMSHOME;?>?mode=pages&amp;delete_page=<?php echo $page['id']; ?>" onclick="str='<?php echo rawurlencode($lang['delete_page_confirm']); ?>'; return confirm_link(str.replace('<?php echo rawurlencode('[page]'); ?>','<?php echo rawurlencode($page['page']); ?>'),this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
  <?php else: ?>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <?php endif; ?>
 </tr>
 <?php $i++; endforeach; ?>
 <tr><td><?php echo 'Total articles:'.$totalarticles;?></td><td colspan="4"><?php 
$tpp=ceil($totalarticles/$app)+1;
for ($pp=1;$pp<$tpp;$pp++){echo '<a href="'.CMSHOME.'?mode=pages&amp;cpage='.$pp.'">&nbsp;['.$pp.']&nbsp;</a>';}
?></td><td colspan="2"><?php print_r($cpage);?></td></tr>
 <?php if($settings['count_views']): ?>
 <tr>
  <td class="<?php if($i % 2 == 0) echo "a"; else echo "b"; ?>" colspan="4" style="text-align:right;"><?php echo str_replace('[time]',strftime($lang['time_format'],$settings['counter_last_resetted']),$lang['total_views']); ?></td>
  <td class="<?php if($i % 2 == 0) echo "a"; else echo "b"; ?>" ><b><?php echo $total_views; ?></b></td>
  <td class="<?php if($i % 2 == 0) echo "a"; else echo "b"; ?>" colspan="2"><?php if($_SESSION[$settings['session_prefix'].'user_type']==1) { ?><span class="small"><a href="<?php echo basename($_SERVER['PHP_SELF']); ?>?mode=pages&amp;reset_views=true"><?php echo $lang['reset_views']; ?></a></span><?php } else { ?>&nbsp;<?php } ?></td>
 </tr>
 <?php endif; ?>
</table>
<?php else: ?>
<p><?php echo $lang['no_pages']; ?></p>
<?php endif; ?>
