<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a><?php if($user_type==1): ?> &raquo; <a href="<?php echo CMSHOME;?>?mode=users"><?php echo $lang['users']; ?></a><?php endif; ?> &raquo; <?php echo $lang['edit_userdata']; ?></h1></h1>

<?php include('errors.inc.tpl'); ?>

<?php if(isset($userdata) || $user_type==0): ?>

<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="users" />

  <?php if($user_type==1): ?>
<input type="hidden" name="token_id" value="<?php echo md5(session_id().TOKEN_SALT); ?>" />
  <input type="hidden" name="id" value="<?php echo $userdata['id']; ?>" />
  <p><label for="name"><?php echo $lang['edit_userdata_name']; ?></label><br />
  <input type="text" name="name" id="name" value="<?php echo $userdata['name']; ?>" size="25" /></p>
  <p><label for="new_pw"><?php echo $lang['change_pw_new']; ?></label><br />
  <input type="password" name="new_pw" id="new_pw" value="" size="25" /> <span class="smallx"><?php echo $lang['change_pw_note']; ?></span></p>
  <p><label for="new_pw_r"><?php echo $lang['change_pw_new_conf']; ?></label><br />
  <input type="password" name="new_pw_r" id="new_pw_r" value="" size="25" /> <span class="smallx"><?php echo $lang['change_pw_note']; ?></span></p>
  <p><?php echo $lang['edit_userdata_type']; ?><br />
  <input id="type_0" type="radio" name="type" value="0"<?php if($userdata['type']==0): ?> checked="checked"<?php endif; ?> /><label for="type_0"><?php echo $lang['type_0']; ?></label><br />
  <input id="type_1" type="radio" name="type" value="1"<?php if($userdata['type']==1): ?> checked="checked"<?php endif; ?> /><label for="type_1"><?php echo $lang['type_1']; ?></label></p>

  <?php else: ?>

  <p><?php echo $lang['change_pw_old']; ?><br />
  <input type="password" name="old_pw" value="" size="25" /></p>
  <p><?php echo $lang['change_pw_new']; ?><br />
  <input type="password" name="new_pw" value="" size="25" /></p>
  <p><?php echo $lang['change_pw_new_conf']; ?><br />
  <input type="password" name="new_pw_r" value="" size="25" /></p>

  <?php endif; ?>

  <p><input type="submit" name="edit_user_submitted" value="<?php echo $lang['submit_button_ok']; ?>" /></p>
 </div>
</form>

<?php else: ?>
<p class="caution"><?php echo $lang['invalid_request']; ?></p>
<?php endif; ?>
