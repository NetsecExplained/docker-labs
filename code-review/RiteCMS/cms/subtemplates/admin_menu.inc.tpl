<div id="admin">
<div class="left"><a href="<?php echo BASE_URL; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/home.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_home']; ?></span></a><?php if($admin): ?> &nbsp;<a href="<?php echo BASE_URL.CMSHOME; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/cog.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_admin']; ?></span></a> &nbsp;<a href="<?php echo BASE_URL.CMSHOME; ?>?mode=pages"><img src="<?php echo BASE_URL.CMS; ?>images/pages.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_page_overview']; ?></span></a> &nbsp;<a href="<?php echo BASE_URL.CMSHOME; ?>?mode=edit"><img src="<?php echo BASE_URL.CMS; ?>images/create_page.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_new_page']; ?></span></a><?php endif; ?></div>
<div class="right">&nbsp;
<?php if(defined('PAGE') && $authorized_to_edit): ?>
<a href="<?php echo BASE_URL.CMSHOME; ?>?mode=edit&amp;id=<?php echo $id; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_edit_page']; ?></span></a> &nbsp;<a href="<?php echo BASE_URL.CMSHOME; ?>?mode=pages&amp;delete_page=<?php echo $id; ?>" onclick="return confirm_link('<?php echo rawurlencode($lang['admin_menu_delete_page_conf']); ?>',this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_delete_page']; ?></span></a> &nbsp;
<?php endif; ?>
<?php if($admin): ?>
<a href="<?php echo BASE_URL.CMSHOME; ?>?mode=logout"><img src="<?php echo BASE_URL.CMS; ?>images/logout.png" alt="" width="16" height="16" /><span><?php echo $lang['admin_menu_logout']; ?></span></a>
<?php endif; ?>
</div>
</div>
