<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=settings"><?php echo $lang['settings']; ?></a> &raquo; <?php echo $lang['advanced_settings']; ?></h1>

<?php include('errors.inc.tpl'); ?>

<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="settings" />
  <table class="admin-table" cellspacing="1" cellpadding="5" border="0">
   <!--<tr>
    <th><?php echo $lang['settings_name']; ?></th>
    <th><?php echo $lang['settings_value']; ?></th>
    <th>&nbsp;</th>
   </tr>-->     
  <?php foreach($settings_sorted as $key=>$val){ ?>    
  <tr>
    <td class="c"><label for="<?php echo $key; ?>"><?php echo $key; ?></label></td>
    <td class="d"><input type="text" id="<?php echo $key; ?>" name="<?php echo $key; ?>" value="<?php echo $val; ?>" size="25" /></td>
    <td class="d"><a href="<?php echo CMSHOME;?>?mode=settings&amp;delete=<?php echo $key; ?>" onclick="return confirm_link('<?php echo rawurlencode($lang['delete_setting_confirm']); ?>',this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
   </tr>
   <?php } /*end foreach */ ?>
   <tr>
    <td class="c">&nbsp;</td>
    <td class="d" style="text-align:right;"><input type="submit" name="settings_submitted" value="<?php echo $lang['submit_button_ok']; ?>" /></td>
    <td class="d">&nbsp;</td>
   </tr>
  </table>
 </div>
</form>

<h3><?php echo $lang['add_new_setting_var']; ?></h3>
<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="settings" />
  <table class="admin-table" cellspacing="1" cellpadding="5" border="0">
   <tr>
    <th><?php echo $lang['settings_name']; ?></th>
    <th><?php echo $lang['settings_value']; ?></th>
   </tr>
   <tr>
    <td class="d"><input type="text" name="name" value="" size="25"/></td>
    <td class="d"><input type="text" name="value" value="" size="25" /></td>
   </tr>
   <tr>
    <td class="d" colspan="2" style="text-align:right;"><input type="submit" name="new_var_submitted" value="<?php echo $lang['submit_button_ok']; ?>" /></td>
   </tr>
  </table>
 </div>
</form>
