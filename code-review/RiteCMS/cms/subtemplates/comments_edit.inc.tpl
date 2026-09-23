<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=comments"><?php echo $lang['comments']; ?></a> &raquo; <?php echo $lang['edit_comment']; ?></h1>

<form method="post" action="<?php echo CMSHOME;?>">
 <div>
  <input type="hidden" name="mode" value="comments" />
  <input type="hidden" name="type" value="<?php echo $type; ?>" />
  <input type="hidden" name="id" value="<?php echo $comment['id']; ?>" />
  <input type="hidden" name="comment_id" value="<?php echo $comment_id; ?>" />
  <input type="hidden" name="page" value="<?php echo $page; ?>" />
  <textarea name="comment" cols="60" rows="10"><?php echo $comment['comment']; ?></textarea>

  <p><?php echo $lang['comments_name_m']; ?><br />
  <input type="text" name="name" value="<?php echo $comment['name']; ?>" size="30" /></p>

  <p><?php echo $lang['comments_email_hp_m']; ?><br />
  <input type="text" name="email_hp" value="<?php echo $comment['email_hp']; ?>" size="30" /></p>

  <p><input type="submit" name="edit_submit" value="<?php echo $lang['submit_button_ok']; ?>" /></p>

 </div>
</form>

