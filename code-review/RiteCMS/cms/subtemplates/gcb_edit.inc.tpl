<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=gcb"><?php echo $lang['gcb']; ?></a> &raquo; <?php if(isset($gcb['id'])): echo $lang['edit_gcb']; else: echo $lang['add_gcb']; endif; ?></h1>

<?php include('errors.inc.tpl'); ?>

<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="gcb" />
  <?php if(isset($gcb['id'])): ?>
  <input type="hidden" name="id" value="<?php echo $gcb['id']; ?>" />
  <?php endif; ?>
  <table cellspacing="0" cellpadding="5" border="0">
   <tr>
    <td class="edit"><strong><?php echo $lang['edit_gcb_title']; ?></strong></td>
    <td class="edit"><input type="text" name="title" value="<?php if(isset($gcb['title'])) echo $gcb['title']; ?>" size="40" /></td>
   </tr>
   <tr>
    <td class="edit"><strong><?php echo $lang['edit_gcb_content']; ?></strong></td>
    <td class="edit"><textarea name="content" cols="70" rows="20"><?php if(isset($gcb['content'])) echo $gcb['content']; ?></textarea><br />
    <span class="small"><input id="content_formatting" type="checkbox" name="content_formatting" value="1"<?php if(isset($gcb['content_formatting']) && $gcb['content_formatting']==1): ?> checked="checked"<?php endif; ?> /> <label for="content_formatting"><?php echo $lang['edit_gcb_formatting']; ?></label></span></td>
   </tr>
   <tr>
    <td class="edit">&nbsp;</td>
    <td class="edit"><input type="submit" name="edit_gcb_submit" value="<?php echo $lang['submit_button_ok']; ?>" /></td>
   </tr>
  </table>
 </div>
</form>
