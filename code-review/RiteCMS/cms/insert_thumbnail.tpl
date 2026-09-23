<!DOCTYPE html>
<html lang="<?php echo $lang['lang']; ?>" dir="<?php echo $lang['dir']; ?>">
<head>
<meta http-equiv="content-type" content="text/html; charset=<?php echo $lang['charset']; ?>" />
<title><?php /*echo $settings['website_title']; ?> - <?php echo $lang['administration']; */ ?><?php echo $lang['insert_thumbnail']; ?></title>
<style type="text/css">
<!--
body         { color:#000; background:#fff; margin:0; padding:10px; font-family:verdana, arial, sans-serif; font-size:100.1%; }
h1           { font-size:1.3em; }
p            { font-size:0.82em; line-height:1.45em; max-width:55em; }
select.list  { width:100%; }
-->
</style>
<script src="<?php echo BASE_URL.CMS; ?>js/admin.js" type="text/javascript"></script>
</head>
<body>

<?php if(isset($galleries)): ?>

<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="thumbnail" />
  <?php if(isset($form)): ?><input type="hidden" name="form" value="<?php echo $form; ?>" /><?php endif; ?>
  <?php if(isset($field)): ?><input type="hidden" name="field" value="<?php echo $field; ?>" /><?php endif; ?>
  <p><select name="gallery" size="1" onchange="this.form.submit();">
   <option value=""><?php echo $lang['thumbnail_select_gallery']; ?></option>
   <?php foreach($galleries as $gallery): ?>
   <option value="<?php echo $gallery; ?>"<?php if(isset($selected_gallery) && $selected_gallery==$gallery): ?> selected="selected"<?php endif; ?>><?php echo $gallery; ?></option>
   <?php endforeach; ?>
  </select> <input type="submit" value="&raquo;"></p>
 </div>
</form>

<?php if(isset($items)): ?>
<form id="images" action="" method="">
 <div>
  <input type="hidden" name="mode" value="thumbnail" />
   <select style="width:100%;" name="image" name="gallery" size="12">
    <?php foreach($items as $item): ?>
    <option value="<?php echo $item['id']; ?>" ondblclick="image_popup('<?php echo BASE_URL; ?>images/<?php echo $item['photo_thumbnail']; ?>')"><?php echo $item['title']; ?></option>
    <?php endforeach; ?>
   </select>
   <?php if(isset($image_classes)): ?>
   <p><?php echo $lang['insert_image_class']; ?><br />
   <select name="image_class" size="1">
    <option value=""></option>
    <?php foreach($image_classes as $image_class): ?>
    <option value="<?php echo $image_class; ?>"<?php if($image_class==$settings['default_thumbnail_class']): ?> selected="selected"<?php endif; ?>><?php echo $image_class; ?></option>
    <?php endforeach; ?>
   </select></p>
   <?php endif; ?>
   <?php if(isset($form) && isset($field)): ?>
   <p><input type="button" value="<?php echo $lang['insert_thumbnail_button']; ?>" onclick="if(document.forms['images'].elements['image_class'].value!='') class='|'+document.forms['images'].elements['image_class'].value; else class=''; opener.insert('<?php echo htmlspecialchars(stripslashes($form)); ?>','<?php echo htmlspecialchars(stripslashes($field)); ?>','[thumbnail:'+document.forms['images'].elements['image'].value+class+']'); window.close();">
   <input type="button" value="<?php echo $lang['insert_gallery_button']; ?>" onclick="opener.insert('<?php echo htmlspecialchars(stripslashes($form)); ?>','<?php echo htmlspecialchars(stripslashes($field)); ?>','[gallery:<?php echo $_POST['gallery']; ?>]'); window.close();"></p>
   <?php endif; ?>
 </div>
</form>
<?php endif; ?>

<?php else: ?>

<p><?php echo $lang['no_gallery']; ?></p>

<?php endif; ?>

</body>
</html>
