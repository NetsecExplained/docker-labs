<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['menus']; ?></h1>

<ul class="options">
 <li><a href="<?php echo CMSHOME;?>?mode=menus&amp;action=new"><img src="<?php echo BASE_URL.CMS; ?>images/lightning_add.png" alt="" width="16" height="16" /><span><?php echo $lang['create_menu']; ?></span></a></li>
</ul>

<?php if(isset($menus)): ?>

<table class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <tr>
  <th><?php echo $lang['menu']; ?></th>
  <th>&nbsp;</th>
 </tr>
 <?php $i=0; foreach($menus as $menu): ?>
 <tr class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
  <td><?php echo $menu; ?></td>
  <td><a href="<?php echo CMSHOME;?>?mode=menus&amp;edit=<?php echo $menu; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a>&nbsp;&nbsp;<a href="<?php echo CMSHOME;?>?mode=menus&amp;delete=<?php echo $menu; ?>" onclick="return confirm_link('<?php echo rawurlencode($lang['delete_menu_confirm']); ?>',this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a>&nbsp;&nbsp;<?php if($menu==$settings['default_menu']): ?><img src="<?php echo BASE_URL.CMS; ?>images/default.png" alt="<?php echo $lang['default_menu']; ?>" title="<?php echo $lang['default_menu']; ?>" width="16" height="16" /><?php else: ?><a href="<?php echo CMSHOME;?>?mode=menus&amp;set_default=<?php echo $menu; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/default_inactive.png" alt="<?php echo $lang['set_default_menu']; ?>" title="<?php echo $lang['set_default_menu']; ?>" width="16" height="16" /></a><?php endif; ?></td>
 </tr>
 <?php ++$i; endforeach; ?>
</table>

<?php else: ?>

<p><?php echo $lang['no_menu']; ?></p>

<?php endif; ?>
