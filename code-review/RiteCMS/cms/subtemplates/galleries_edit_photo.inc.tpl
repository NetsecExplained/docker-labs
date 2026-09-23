<?php if(isset($invalid_photo)): ?>

<p class="caution"><?php echo $lang['invalid_photo']; ?></p>

<?php else: ?>

<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=galleries"><?php echo $lang['photo_galleries']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=galleries&amp;edit=<?php echo $photo_data['gallery']; ?>"><?php echo str_replace('[gallery]',$photo_data['gallery'],$lang['edit_gallery']); ?></a> &raquo; <?php if(isset($photo_data['id'])) echo $lang['edit_photo']; else echo $lang['new_photo']; ?></h1>

<?php include('errors.inc.tpl'); ?>

<form id="edit_photo" action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="galleries" />
  <?php if(isset($photo_data['id'])): ?>
  <input type="hidden" name="id" value="<?php echo $photo_data['id']; ?>" />
  <?php endif; ?>
  <?php if(isset($photo_data['gallery'])): ?>
  <input type="hidden" name="gallery" value="<?php echo $photo_data['gallery']; ?>" />
  <?php endif; ?>
  <table cellspacing="0" cellpadding="5" border="0">
   <tr>
    <td class="edit"><b><?php echo $lang['edit_photo_thumbnail']; ?></b></td>
    <td class="edit"><input type="text" name="photo_thumbnail" value="<?php if(isset($photo_data['photo_thumbnail'])) echo $photo_data['photo_thumbnail']; ?>" size="50" />&nbsp; <span class="small">[ <a href="#" onclick="insert_image('edit_photo','photo_thumbnail',0); return false"><?php echo $lang['select_image']; ?></a> ]</span></td>
   </tr>
   <tr>
    <td class="edit"><b><?php echo $lang['edit_photo_normal']; ?></b></td>
    <td class="edit"><input type="text" name="photo_normal" value="<?php if(isset($photo_data['photo_normal'])) echo $photo_data['photo_normal']; ?>" size="50" />&nbsp; <span class="small">[ <a href="#" onclick="insert_image('edit_photo','photo_normal',0); return false"><?php echo $lang['select_image']; ?></a> ]</span> &nbsp; <span class="small"><input class="small" type="text" name="width" value="<?php if(isset($photo_data['width'])) echo $photo_data['width']; ?>" size="2" /> * <input class="small" type="text" name="height" value="<?php if(isset($photo_data['height'])) echo $photo_data['height']; ?>" size="2" /> px</span><span class="smallx"> <?php echo $lang['edit_photo_size_flash']; ?></span></td>
   </tr>
   <tr>
    <td class="edit"><b><?php echo $lang['edit_photo_large']; ?></b></td>
    <td class="edit"><input type="text" name="photo_large" value="<?php if(isset($photo_data['photo_large'])) echo $photo_data['photo_large']; ?>" size="50" />&nbsp; <span class="small">[ <a href="#" onclick="insert_image('edit_photo','photo_large',0); return false"><?php echo $lang['select_image']; ?></a> ]</span> &nbsp; <span class="small"><input class="small" type="text" name="large_width" value="<?php if(isset($photo_data['large_width'])) echo $photo_data['large_width']; ?>" size="2" /> * <input class="small" type="text" name="large_height" value="<?php if(isset($photo_data['large_height'])) echo $photo_data['large_height']; ?>" size="2" /> px</span><span class="smallx"> <?php echo $lang['edit_photo_size_flash']; ?></span></td>
   </tr>
   <tr>
    <td class="edit"><b><?php echo $lang['edit_photo_title']; ?></b></td>
    <td class="edit"><input type="text" name="title" value="<?php if(isset($photo_data['title'])) echo $photo_data['title']; ?>" size="50" /></td>
   </tr>
   <tr>
    <td class="edit"><b><?php echo $lang['edit_photo_subtitle']; ?></b></td>
    <td class="edit"><input type="text" name="subtitle" value="<?php if(isset($photo_data['subtitle'])) echo $photo_data['subtitle']; ?>" size="50" /></td>
   </tr>
   <tr>
    <td class="edit"><b><?php echo $lang['edit_photo_description']; ?></b></td>
    <td class="edit"><textarea name="description" cols="55" rows="13"><?php if(isset($photo_data['description'])) echo $photo_data['description']; ?></textarea><br />
    <span class="small"><input id="description_formatting" type="checkbox" name="description_formatting" value="1"<?php if(isset($photo_data['description_formatting']) && $photo_data['description_formatting']==1): ?> checked="checked"<?php endif; ?> /><label for="description_formatting"><?php echo $lang['edit_formatting']; ?></label></span></td>
   </tr>
   <tr>
    <td class="edit">&nbsp;</td>
    <td class="edit"><input type="submit" name="edit_photo_submitted" value="<?php echo $lang['submit_button_ok']; ?>" /></td>
   </tr>
  </table>
 </div>
</form>

<?php endif; ?>
