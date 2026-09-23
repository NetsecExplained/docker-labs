<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['settings']; ?></h1>

<?php if(isset($saved)): ?>
<p class="ok"><?php echo $lang['settings_saved']; ?></p>
<?php endif;?>

<form action="<?php echo BASE_URL.CMSHOME;?>" method="post">
<div>
<input type="hidden" name="mode" value="settings" />
<table class="admin-table" cellspacing="1" cellpadding="5" border="0">
<tr>
<td class="c"><label for="website_title"><b><?php echo $lang['settings_website_title']; ?></b></label></td>
<td class="d"><input id="website_title" type="text" name="website_title" value="<?php echo htmlspecialchars(stripslashes($settings['website_title'])); ?>" size="35" /></td>
</tr>

<tr>
<td class="c"><label for="website_subtitle"><b><?php echo $lang['settings_website_subtitle']; ?></b></label></td>
<td class="d"><input id="website_subtitle" type="text" name="website_subtitle" value="<?php echo htmlspecialchars(stripslashes($settings['website_subtitle'])); ?>" size="35" /></td>
</tr>
<tr>
<td class="c"><label for="website_footnote_1"><b><?php echo $lang['settings_website_footnote_1']; ?></b></label></td>
<td class="d"><input id="website_footnote_1" type="text" name="website_footnote_1" value="<?php echo htmlspecialchars(stripslashes($settings['website_footnote_1'])); ?>" size="35" /></td>
</tr>
<tr>
<td class="c"><label for="website_footnote_2"><b><?php echo $lang['settings_website_footnote_2']; ?></b></label></td>
<td class="d"><input id="website_footnote_2" type="text" name="website_footnote_2" value="<?php echo htmlspecialchars(stripslashes($settings['website_footnote_2'])); ?>" size="35" /></td>
</tr>

<tr>
<td class="c"><label for="email"><b><?php echo $lang['settings_email']; ?></b></label></td>
<td class="d"><input id="email" type="text" name="email" value="<?php echo htmlspecialchars(stripslashes($settings['email'])); ?>" size="35" /></td>
</tr>
<tr>
<td class="c"><label for="index_page"><b><?php echo $lang['settings_index_page']; ?></b></label></td>
<td class="d"><select id="index_page" name="index_page" size="1"><?php
foreach($pages as $current_page)
 {
  ?><option value="<?php echo $current_page['page']; ?>"<?php if($settings['index_page']==$current_page['page']) { ?> selected="selected"<?php } ?>><?php echo $current_page['page']; ?></option><?php
 }
?></select>
</tr>
<tr>
<td class="c"><label for="error_page"><b><?php echo $lang['settings_error_page']; ?></b></label></td>
<td class="d"><select id="error_page" name="error_page" size="1"><?php
foreach($pages as $current_page)
 {
  ?><option value="<?php echo $current_page['page']; ?>"<?php if($settings['error_page']==$current_page['page']) { ?> selected="selected"<?php } ?>><?php echo $current_page['page']; ?></option><?php
 }
?></select>
</tr>
<tr>
<td class="c"><label for="admin_language_file"><b><?php echo $lang['admin_language_file']; ?></b></label></td>
<td class="d"><select id="admin_language_file" name="admin_language_file" size="1">
<?php foreach($admin_language_files as $admin_language_file): ?>
<option value="<?php echo $admin_language_file['file']; ?>"<?php if($settings['admin_language_file']==$admin_language_file['file']): ?> selected="selected"<?php endif ?>><?php echo $admin_language_file['name']; ?></option>
<?php endforeach; ?>
</select>
</td>
</tr>
<tr>
<td class="c"><label for="default_page_language_file"><b><?php echo $lang['default_page_language_file']; ?></b></label></td>
<td class="d"><select id="default_page_language_file" name="default_page_language_file" size="1">
<?php foreach($page_language_files as $page_language_file): ?>
<option value="<?php echo $page_language_file['file']; ?>"<?php if($settings['default_page_language_file']==$page_language_file['file']): ?> selected="selected"<?php endif ?>><?php echo $page_language_file['name']; ?></option>
<?php endforeach; ?>
</select>
</td>
</tr>

<?php if(isset($wysiwyg_editor_available)): ?>
<tr>
<td class="c"><b><?php echo $lang['wysiwyg_editor']; ?></b></td>
<td class="d"><input id="wysiwyg_editor" type="checkbox" name="wysiwyg_editor" value="1"<?php if($settings['wysiwyg_editor']): ?> checked="checked"<?php endif; ?>><label for="wysiwyg_editor"><?php echo $lang['wysiwyg_editor_enabled']; ?></label>
</td>
</tr>
<?php endif; ?>

<tr>
<td class="c"><b><?php echo $lang['settings_caching']; ?></b></td>
<td class="d"><input id="caching" type="checkbox" name="caching" value="1"<?php if($settings['caching']==1) { ?> checked="checked"<?php } ?>><label for="caching"><?php echo $lang['settings_caching_enabled']; ?></label></td>
</tr>
<tr>
<td class="c">&nbsp;</td>
<td class="d" style="text-align:right;"><input type="submit" name="settings_submitted" value="<?php echo $lang['submit_button_ok']; ?>" /></td>
</tr>
</table>
</form>
<p><a href="<?php echo CMSHOME;?>?mode=settings&amp;action=advanced_settings">&raquo; <?php echo $lang['advanced_settings']; ?></a></p><?php
