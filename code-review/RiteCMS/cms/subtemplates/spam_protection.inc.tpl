<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['spam_protection']; ?></h1>

<?php include('errors.inc.tpl'); ?>

<?php if(isset($saved)): ?>
<p class="ok"><?php echo $lang['spam_protection_saved']; ?></p>
<?php endif; ?>

<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="spam_protection" />
  <table class="admin-table" border="0" cellpadding="5" cellspacing="1">
   <tr>
    <td class="c" style="width:30%"><strong><?php echo $lang['not_accepted_words']; ?></strong><br /><span class="small"><?php echo $lang['not_accepted_words_desc']; ?></span></td>
    <td class="b"><textarea name="not_accepted_words" cols="35" rows="7"><?php if(isset($not_accepted_words)) echo stripslashes($not_accepted_words);  ?></textarea></td>
   </tr>
   <tr>
    <td class="c"><strong><?php echo $lang['banned_ips']; ?></strong><br /><span class="small"><?php echo $lang['banned_ips_desc']; ?></span></td>
    <td class="b"><textarea name="banned_ips" cols="35" rows="7"><?php if(isset($banned_ips)) echo stripslashes($banned_ips);  ?></textarea></td>
   </tr>
   <tr>
    <td class="c"><strong><?php echo $lang['banned_user_agents']; ?></strong><br /><span class="small"><?php echo $lang['banned_user_agents_desc']; ?></span></td>
    <td class="b"><textarea name="banned_user_agents" cols="35" rows="7"><?php if(isset($banned_user_agents)) echo stripslashes($banned_user_agents);  ?></textarea></td>
   </tr>
   <tr>
    <td class="c" style="width:30%"><strong><?php echo $lang['akismet']; ?></strong><br /><span class="small"><?php echo $lang['akismet_desc']; ?></span></td>
    <td class="b"><?php echo $lang['akismet_key']; ?><br />
    <input type="text" name="akismet_key" value="<?php echo $akismet_key; ?>" size="25" /><br />
    <input id="akismet_entry_check" type="checkbox" name="akismet_entry_check"<?php if(isset($akismet_entry_check) && $akismet_entry_check==1): ?> checked="checked"<?php endif; ?> /><label for="akismet_entry_check"><?php echo $lang['akismet_entry_check']; ?></label><br />
    <input id="akismet_mail_check" type="checkbox" name="akismet_mail_check"<?php if(isset($akismet_mail_check) && $akismet_mail_check==1): ?> checked="checked"<?php endif; ?> /><label for="akismet_mail_check"><?php echo $lang['akismet_mail_check']; ?></label></td>
   </tr>
   
    <tr>
    <td class="c" style="width:30%"><strong><?php echo $lang['recaptcha']; ?></strong><br /><span class="small"><?php echo $lang['recaptcha_desc']; ?></span></td>
    <td class="b"><?php echo $lang['recaptcha_key_public']; ?><br />
    <input type="text" name="recaptcha_key_public" value="<?php echo $recaptcha_key_public; ?>" size="80" /><br />
    <?php echo $lang['recaptcha_key_private']; ?><br />
    <input type="text" name="recaptcha_key_private" value="<?php echo $recaptcha_key_private; ?>" size="80" /><br />
    <input id="recaptcha_entry_check" type="checkbox" name="recaptcha_entry_check"<?php if(isset($recaptcha_entry_check) && $recaptcha_entry_check==1): ?> checked="checked"<?php endif; ?> /><label for="recaptcha_entry_check"><?php echo $lang['recaptcha_entry_check']; ?></label><br />
    <input id="recaptcha_mail_check" type="checkbox" name="recaptcha_mail_check"<?php if(isset($recaptcha_mail_check) && $recaptcha_mail_check==1): ?> checked="checked"<?php endif; ?> /><label for="recaptcha_mail_check"><?php echo $lang['recaptcha_mail_check']; ?></label></td>
   </tr>
   
   
   <tr>
    <td class="c">&nbsp;</td>
    <td class="b"><input type="submit" name="spam_protection_submit" value="<?php echo $lang['spam_protection_submit']; ?>" /></td>
   </tr>
  </table>
</div>
</form>
