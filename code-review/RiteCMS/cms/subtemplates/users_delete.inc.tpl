<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=users"><?php echo $lang['users']; ?></a> &raquo; <?php echo $lang['delete_user']; ?></h1>

<?php if(isset($userdata)): ?>

<p><?php echo str_replace('[name]',$userdata['name'],$lang['delete_user_confirm']); ?></p>

<form action="<?php basename($_SERVER['PHP_SELF']); ?>" method="post">
 <div>
 <input type="hidden" name="token_id" value="<?php echo md5(session_id().TOKEN_SALT); ?>" />
  <input type="hidden" name="mode" value="users" />
  <input type="hidden" name="delete" value="<?php echo $userdata['id']; ?>" />
  <input type="submit" name="confirmed" value="<?php echo $lang['delete_user_submit']; ?>" />
 </div>
</form>

<?php else: ?>

<p class="caution"><?php echo $lang['invalid_request']; ?></p>

<?php endif; ?>

