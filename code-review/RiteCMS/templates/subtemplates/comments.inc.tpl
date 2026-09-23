<div id="comments">

<h3><?php echo $lang['comment_headline']; ?></h3>

<?php if(isset($edit_data)): ?>
<form id="commentform" method="post" action="<?php echo $BASE_URL . PAGE; ?>#comments">
<div>
<input type="hidden" name="current_page" value="<?php echo $edit_data['current_page']; ?>" />
<input type="hidden" name="id" value="<?php echo $edit_data['id']; ?>" />
<p><label for="comment_text"><strong><?php echo $lang['comment_edit_text']; ?></strong></label><br />
<textarea id="comment_text" name="comment_text" cols="63" rows="10"><?php echo $edit_data['comment']; ?></textarea></p>
<p class="userdata"><label for="name"><?php echo $lang['comment_input_name']; ?></label><br />
<input type="text" id="name" name="name" value="<?php echo $edit_data['name']; ?>" size="30" /></p>
<p class="userdata"><label for="email_hp"><?php echo $lang['comment_input_email_hp']; ?></label><br />
<input type="text" id="email_hp" name="email_hp" value="<?php echo $edit_data['email_hp']; ?>" size="30" /></p>
<p><input name="edit_save" type="submit" value="<?php echo $lang['comment_input_submit']; ?>" /></p>
</div>
</form>

<?php else: ?>

<?php if($comments): ?>
<?php foreach($comments as $comment): ?>
<div class="comment" id="comment-<?php echo $comment['id']; ?>">
<p class="author"><?php echo $comment['nr']; ?>. <?php if(isset($comment['hp'])): ?><a href="<?php echo $comment['hp']; ?>"><strong><?php echo $comment['name']; ?></strong></a><?php elseif(isset($comment['email'])): ?><a href="mailto:<?php echo $comment['email']; ?>"><strong><?php echo $comment['name']; ?></strong></a><?php else: ?><strong><?php echo $comment['name']; ?></strong><?php endif; ?>, <?php echo $lang['comment_time'][$comment['id']]; ?>:<?php if($admin): ?> <span class="smallx">(<?php echo $comment['ip']; ?>)</span><?php endif; ?></p>
<p class="text"><?php echo $comment['comment']; ?></p>
<?php if($admin): ?>
<p class="admin"><a href="<?php echo BASE_URL . PAGE; ?>,<?php echo $current_page; ?>,edit,<?php echo $comment['id']; ?>#comments"><img src="<?php echo BASE_URL; ?>templates/images/edit_link.png" width="15" height="10" alt="" /><?php echo $lang['comment_edit_link']; ?></a> &nbsp;<a href="<?php echo BASE_URL . PAGE; ?>,<?php echo $current_page; ?>,delete,<?php echo $comment['id']; ?>" onclick="return confirm_link('<?php echo rawurlencode($lang['comment_delete_confirm']); ?>',this,1)"><img src="<?php echo BASE_URL; ?>templates/images/delete_link.png" width="13" height="9" alt="" /><?php echo $lang['comment_delete_link']; ?></a></p>
<?php endif; ?>
</div>
<?php endforeach ?>
<?php else: ?>
<p class="no-comments"><em><?php echo $lang['comment_no_comments']; ?></em></p>
<?php endif; ?>

<?php if($pagination): ?>
<p class="pagination"><?php echo $lang['comments_pagination_info']; ?> [
<?php if($pagination['previous']): ?> <a href="<?php echo BASE_URL . PAGE; if($pagination['previous']>1): ?>,<?php echo $pagination['previous']; endif; ?>#comments">&laquo;</a> <?php endif; ?>
<?php foreach($pagination['items'] as $item): ?>
<?php if(empty($item)): ?> ..<?php elseif($item==$pagination['current']): ?> <span class="current"><?php echo $item; ?></span><?php else: ?> <a href="<?php echo BASE_URL . PAGE; if($item>1): ?>,<?php echo $item; endif; ?>#comments"><?php echo $item; ?></a><?php endif; ?>
<?php endforeach; ?>
<?php if($pagination['next']): ?> <a href="<?php echo BASE_URL . PAGE; ?>,<?php echo $pagination['next']; ?>#comments">&raquo;</a><?php endif; ?>
 ]</p>
<?php endif; ?>

<?php if($errors): ?>
<p id="errors" class="caution"><?php echo $lang['error_headline']; ?></p>
<ul>
 <?php foreach($errors as $error): ?>
 <li><?php if(isset($lang[$error])) echo $lang[$error]; else echo $error; ?></li>
 <?php endforeach; ?>
</ul>
<script type="text/javascript">/* <![CDATA[ */ location.hash='errors'; /* ]]> */</script>
<?php endif; ?>

<?php if(empty($comments_closed)): ?>

<?php if(isset($preview) && empty($errors)): ?>
<h4 id="preview"><?php echo $lang['comment_preview_hl']; ?></h4>
<div class="preview">
<p class="author"><?php if(isset($preview['hp'])): ?><a href="<?php echo $preview['hp']; ?>"><strong><?php echo $preview['name']; ?></strong></a><?php elseif(isset($preview['email'])): ?><a href="mailto:<?php echo $preview['email']; ?>"><strong><?php echo $preview['name']; ?></strong></a><?php else: ?><strong><?php echo $preview['name']; ?></strong><?php endif; ?>, <?php echo $lang['comment_time']['preview']; ?>:</p>
<p class="text"><?php echo $preview['comment_text']; ?></p>
</div>
<script type="text/javascript">/* <![CDATA[ */ location.hash='preview'; /* ]]> */</script>
<?php endif; ?>

<form id="commentform" method="post" action="<?php echo $BASE_URL . PAGE; ?>">
<div>
<?php if($form_session_data): ?><input type="hidden" name="<?php echo $form_session_data['name']; ?>" value="<?php echo $form_session_data['id']; ?>" /><?php endif; ?>
<p><label for="comment_text"><strong><?php echo $lang['comment_input_text']; ?></strong></label><br />
<textarea id="comment_text" name="comment_text" cols="63" rows="10"><?php echo $form_values['comment_text']; ?></textarea></p>
<p class="userdata"><label for="name"><?php echo $lang['comment_input_name']; ?></label><br />
<input type="text" id="name" name="name" value="<?php echo $form_values['name']; ?>" size="30" maxlength="30" /></p>
<p class="userdata"><label for="email_hp"><?php echo $lang['comment_input_email_hp']; ?></label><br />
<input type="text" id="email_hp" name="email_hp" value="<?php echo $form_values['email_hp']; ?>" size="30" maxlength="100" /> <small><?php echo $lang['comment_note_email']; ?></small>
<?php if(isset($settings['securimage_comments']) && $settings['securimage_comments']==1): ?>
	<p id="captchaimg"><label for="captcha"><?php echo $lang['formmailer_label_captcha']; ?></label><br>
		<img id="captcha" src="/cms/modules/securimage/securimage_show.php" alt="CAPTCHA Image" /></p>
     <p><label for="captcha_answer"><?php echo $lang['formmailer_label_answer']; ?></label><input type="text" name="captcha_code" size="10" maxlength="6" /><a href="#" onclick="document.getElementById('captcha').src='cms/modules/securimage/securimage_show.php?'+Math.random(); return false"><img class="refreshcap" src="<?php echo BASE_URL; ?>cms/modules/securimage/images/refresh.png" alt="change image" title="click to refresh image"></a></p>
<?php endif; ?>
</p>

<p><input name="save" type="submit" value="<?php echo $lang['comment_input_submit']; ?>"<?php if(!$form_session): ?> disabled="disabled"<?php endif; ?> /> <input name="preview" type="submit" value="<?php echo $lang['comment_input_preview']; ?>" /></p>
</div>
</form>
<p id="show_commentform" style="display:none;"><a href="#commentform" onclick="show_comment_form(); return false" class="addcomment"><?php echo $lang['comments_add_comment']; ?></a></p>
<?php if(empty($preview) && empty($errors)): ?>
<script type="text/javascript">/* <![CDATA[ */ hide_comment_form(); /* ]]> */</script>
<?php endif; ?>

<?php endif; ?>

<?php endif; ?>

<?php if($pingbacks): ?>
<h3 id="pingbacks"><?php echo $lang['pingback_headline']; ?></h3>
<ol id="pingback-list">
<?php foreach($pingbacks as $pingback): ?>
<li><a href="<?php echo $pingback['hp']; ?>"><?php echo $pingback['name']; ?></a><!-- (<?php echo $lang['comment_time'][$pingback['id']]; ?>)-->
<?php if($admin): ?>
<br /><span class="small"><a href="<?php echo BASE_URL . PAGE; ?>,<?php echo $current_page; ?>,edit,<?php echo $pingback['id']; ?>#comments"><img src="<?php echo BASE_URL; ?>templates/images/edit_link.png" width="15" height="10" alt="" /><?php echo $lang['comment_edit_link']; ?></a> &nbsp;<a href="<?php echo BASE_URL . PAGE; ?>,<?php echo $current_page; ?>,delete,<?php echo $pingback['id']; ?>" onclick="return confirm_link('<?php echo rawurlencode($lang['comment_delete_confirm']); ?>',this,1)"><img src="<?php echo BASE_URL; ?>templates/images/delete_link.png" width="13" height="9" alt="" /><?php echo $lang['comment_delete_link']; ?></a></span>
<?php endif; ?>
</li>
<?php endforeach; ?>
</ol>
<?php endif; ?>

<?php if(isset($comments_closed)): ?>
<p id="closed"><em><?php echo $lang['comments_closed']; ?></em><?php if($admin): ?> &nbsp;<a href="<?php echo BASE_URL . PAGE; ?>,openclose" class="opencomments"><?php echo $lang['comments_open']; ?></a><?php endif; ?></p>
<?php endif; ?>

<?php if($admin && empty($comments_closed)): ?>
<p id="close"><a href="<?php echo BASE_URL . PAGE; ?>,openclose" class="closecomments"><?php echo $lang['comments_close']; ?></a></p>
<?php endif; ?>
</div>
