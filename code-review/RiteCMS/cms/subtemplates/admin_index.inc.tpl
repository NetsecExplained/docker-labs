<h1><?php echo $lang['administration']; ?></h1>

<?php if(isset($msg)): ?>
<p class="ok"><?php if(isset($lang[$msg])) echo $lang[$msg]; else echo $msg; ?></p>
<?php endif;?>

<ul class="options">
<?php if($user_type==1): ?><li><a href="<?php echo CMSHOME;?>?mode=settings"><img src="<?php echo BASE_URL.CMS; ?>images/cog.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_settings']; ?></span></a></li><?php endif; ?>
<?php if($user_type==1): ?><li><a href="<?php echo CMSHOME;?>?mode=menus"><img src="<?php echo BASE_URL.CMS; ?>images/page_link.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_edit_menus']; ?></span></a></li><?php endif; ?>
<li><a href="<?php echo CMSHOME;?>?mode=galleries"><img src="<?php echo BASE_URL.CMS; ?>images/galleries.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_edit_galleries']; ?></span></a></li>
<li><a href="<?php echo CMSHOME;?>?mode=filemanager"><img src="<?php echo BASE_URL.CMS; ?>images/folder.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_filemanager']; ?></span></a></li>
<li><a href="<?php echo CMSHOME;?>?mode=comments"><img src="<?php echo BASE_URL.CMS; ?>images/comments.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_edit_comments']; ?></span></a></li>
<li><a href="<?php echo CMSHOME;?>?mode=notes"><img src="<?php echo BASE_URL.CMS; ?>images/note.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_edit_notes']; ?></span></a></li>
<?php if($settings['global_content_blocks']): ?><li><a href="<?php echo CMSHOME;?>?mode=gcb"><img src="<?php echo BASE_URL.CMS; ?>images/gcb.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_edit_gcb']; ?></span></a></li><?php endif; ?>
<?php if($user_type==1): ?><li><a href="<?php echo CMSHOME;?>?mode=spam_protection"><img src="<?php echo BASE_URL.CMS; ?>images/shield.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_spam_protection']; ?></span></a></li><?php endif; ?>
<li><a href="<?php echo CMSHOME;?>?mode=users"><img src="<?php echo BASE_URL.CMS; ?>images/user.png" alt="" width="16" height="16" /><span><?php if($user_type==1) echo $lang['admin_menu_user_administr']; else echo $lang['admin_menu_edit_userdata']; ?></span></a></li>
<?php if($settings['caching']): ?><li><a href="<?php echo CMSHOME;?>?clear_cache=true"><img src="<?php echo BASE_URL.CMS; ?>images/refresh.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_clear_cache']; ?></span></a></li><?php endif; ?>
<?php if($user_type==1): ?><li><a href="<?php echo CMSHOME;?>?mode=backup"><img src="<?php echo BASE_URL.CMS; ?>images/shield.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_backup']; ?></span></a></li><?php endif; ?>


</ul>
