<h1><?php echo $lang['login']; ?></h1>
<?php if(isset($_GET['msg'])): ?>
<p class="caution"><?php echo $lang['login_failed']; ?></p>
<?php endif; ?>

<form action="<?php echo CMSHOME;?>" method="post">
<div>
<p><label for="login"><?php echo $lang['login_username']; ?></label><br /><input id="login" type="text" name="username" /></p>
<p><label for="pw"><?php echo $lang['login_password']; ?></label><br /><input id="pw" type="password" name="userpw" /></p>
<p><input type="submit" value="<?php echo $lang['login_submit']; ?>" /></p>
</div>
</form>

