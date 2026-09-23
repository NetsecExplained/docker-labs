<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=galleries"><?php echo $lang['photo_galleries']; ?></a> &raquo; <?php echo $lang['new_gallery']; ?></h1>

<?php if(isset($errors)): ?>
<p class="caution"><?php echo $lang['error_headline']; ?></p>
<ul>
 <?php foreach($errors as $error): ?>
 <li><?php if(isset($lang[$error])) echo $lang[$error]; else echo $error; ?></li>
 <?php endforeach; ?>
</ul>
<?php endif; ?>

<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="galleries" />
  <p><label for="new_gallery_name"><?php echo $lang['new_gallery_name']; ?></label><br />
  <input id="new_gallery_name" type="text" name="new_gallery_name" value="<?php if(isset($new_gallery_name)) echo $new_gallery_name; ?>" size="25" /> <input type="submit" value="<?php echo $lang['submit_button_ok']; ?>" ></p>
 </div>
</form>
