<!DOCTYPE html>
<html lang="<?php echo $lang['lang']; ?>" dir="<?php echo $lang['dir']; ?>">
<head>
<meta http-equiv="content-type" content="text/html; charset=<?php echo $lang['charset']; ?>" />
<title><?php /*echo $settings['website_title']; ?> - <?php echo $lang['administration']; */ ?><?php echo $lang['insert_image']; ?></title>
<style type="text/css">
<!--
body         { color:#000; background:#fff; margin:0; padding:10px; font-family:verdana, arial, sans-serif; font-size:100.1%; }
h1           { font-size:1.3em; }
p,td         { font-size:0.82em; line-height:1.45em; max-width:55em; }
-->
</style>
<script src="<?php echo BASE_URL; ?>js/admin.js" type="text/javascript"></script>
<script type="text/javascript">/* <![CDATA[ */
function width_height()
 {
  if(document.forms['images'].elements['width'].value!=''&&document.forms['images'].elements['height'].value!='') width_height='|'+document.forms['images'].elements['width'].value+'|'+document.forms['images'].elements['height'].value;
  else width_height='';
  return width_height; 
 }
/* ]]> */</script>
</head>
<body>

<?php if(isset($images)): ?>

<form id="images" action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="image" />
  <?php if(isset($form)): ?><input type="hidden" name="form" value="<?php echo $form; ?>" /><?php endif; ?>
  <?php if(isset($field)): ?><input type="hidden" name="field" value="<?php echo $field; ?>" /><?php endif; ?>
  <?php if(isset($insert_mode)): ?><input type="hidden" name="insert_mode" value="<?php echo $insert_mode; ?>" /><?php endif; ?>
  <select name="image" size="20" style="width:100%;">
  <?php foreach($images as $image): ?>
  <option value="<?php echo $image; ?>" ondblclick="image_popup('<?php echo BASE_URL.MEDIA_DIR.$image; ?>')"><?php echo $image; ?></option>
  <?php endforeach; ?>
  </select>

  <?php if(isset($form) && isset($field)): ?>
  <?php if(empty($insert_mode)): ?>
  <p><input type="button" value="<?php echo $lang['select_image_button']; ?>" onclick="if(document.forms['images'].elements['image'].value!='') { opener.document.forms['<?php echo htmlspecialchars(stripslashes($form)); ?>'].elements['<?php echo htmlspecialchars(stripslashes($field)); ?>'].value=document.forms['images'].elements['image'].value; window.close(); }"></p>
  <?php else: ?>
  <table style="margin-top:10px;" border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td><span class="small"><?php echo $lang['insert_image_class']; ?></span></td>
    <td><span class="small"><?php echo $lang['insert_image_alt']; ?></span></td>
    <td><span class="small"><?php echo $lang['insert_image_width_height']; ?></span></td>
    <td>&nbsp;</td>
   </tr>
   <tr>
    <td><select name="image_class" size="1">
    <option value=""></option>
    <?php foreach($image_classes as $image_class): ?>
    <option value="<?php echo $image_class; ?>"<?php if($image_class==$settings['default_thumbnail_class']): ?> selected="selected"<?php endif; ?>><?php echo $image_class; ?></option>
    <?php endforeach; ?>
    </select>&nbsp;</td>
    <td><input type="text" name="alt" value="<?php echo $lang['default_image_alt']; ?>" size="10" />&nbsp;</td>
    <td><input type="text" name="width" value="" size="3" />/<input type="text" name="height" value="" size="3" />&nbsp;</td>
    <td><input type="button" value="<?php echo $lang['select_image_button']; ?>" onclick="if(document.forms['images'].elements['image'].value!='') { opener.insert('<?php echo htmlspecialchars(stripslashes($form)); ?>','<?php echo htmlspecialchars(stripslashes($field)); ?>','[image:'+document.forms['images'].elements['image'].value+'|'+document.forms['images'].elements['image_class'].value+'|'+document.forms['images'].elements['alt'].value+width_height()+']'); window.close(); }"></td>
   </tr>
  </table>
  <?php endif; ?>
  <?php endif; ?>
 </div>
</form>

<?php else: ?>
<p><em><?php echo $lang['no_images']; ?></em></p>
<?php endif; ?>

</body>
</html>
