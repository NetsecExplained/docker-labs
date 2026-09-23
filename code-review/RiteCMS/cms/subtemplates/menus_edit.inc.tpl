<?php if(isset($edit_item)): ?>
<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=menus"><?php echo $lang['menus']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=menus&amp;edit=<?php echo $menu; ?>"><?php echo str_replace('[menu]', $menu, $lang['edit_menu_hl']); ?></a> &raquo; <?php echo $lang['edit_menu_item']; ?></h1>
<?php else: ?>
<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=menus"><?php echo $lang['menus']; ?></a> &raquo; <?php echo str_replace('[menu]', $menu, $lang['edit_menu_hl']); ?></h1>
<?php endif; ?>

<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="menus" />
  <input type="hidden" name="menu" value="<?php echo $menu; ?>" />
  <?php if(isset($edit_item)): ?><input type="hidden" name="edit_item" value="<?php echo $edit_item; ?>" /><?php endif; ?>
  <table<?php if(!isset($edit_item)): ?> id="sortable"<?php endif; ?> class="admin-table wide" cellspacing="1" cellpadding="5" border="0">
   <thead>
    <tr id="row_0">
     <th><?php echo $lang['menu_item_name']; ?></th>
     <th><?php echo $lang['menu_item_title']; ?></th>
     <th><?php echo $lang['menu_item_link']; ?></th>
     <th><?php echo $lang['menu_item_section']; ?></th>
     <th><?php echo $lang['menu_item_accesskey']; ?></th>
     <th><?php echo $lang['menu_item_submenu']; ?></th>
     <th>&nbsp;</th>
    </tr>
   </thead>
   <tbody id="items">
    <?php if(isset($edit_item)): ?>
    <?php $i=0; if(isset($items)): foreach($items as $item): ?>
    <tr id="row_<?php echo $item['id']; ?>" class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
     <td><?php if($item['id']==$edit_item): ?><input type="text" name="name" value="<?php echo $item['name']; ?>" size="10" style="width:100%;" /><?php else: ?><?php echo $item['name']; ?><?php endif; ?></td>
     <td><?php if($item['id']==$edit_item): ?><input type="text" name="title" value="<?php echo $item['title']; ?>" size="10" style="width:100%;" /><?php else: ?><?php echo $item['title']; ?><?php endif; ?></td>
     <td><?php if($item['id']==$edit_item): ?><input type="text" name="link" value="<?php echo $item['link']; ?>" size="10" style="width:100%;" /><?php else: ?><?php echo $item['link']; ?><?php endif; ?></td>
     <td><?php if($item['id']==$edit_item): ?><input type="text" name="section" value="<?php echo $item['section']; ?>" size="10" style="width:100%;" /><?php else: ?><?php echo $item['section']; ?><?php endif; ?></td>
     <td><?php if($item['id']==$edit_item): ?><input type="text" name="accesskey" value="<?php echo $item['accesskey']; ?>" size="10" style="width:100%;" /><?php else: ?><?php echo $item['accesskey']; ?><?php endif; ?></td>
    <td><?php if($item['id']==$edit_item): ?><input type="text" name="submenu" value="<?php echo $item['submenu']; ?>" size="10" style="width:100%;" /><?php else: ?><?php echo $item['submenu']; ?><?php endif; ?></td>
     <td><?php if($item['id']==$edit_item): ?><input type="submit" name="edit_menu_item_submitted" value="<?php echo $lang['submit_button_ok']; ?>" /><?php else: ?>&nbsp;<?php endif; ?></td>
    </tr>
    <?php ++$i; endforeach; endif; ?>
    
    <?php else: ?>

    <?php $i=0; if(isset($items)): foreach($items as $item): ?>
    <tr id="id_<?php echo $item['id']; ?>" class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
     <td style="cursor:move;"><?php echo $item['name']; ?></td>
     <td style="cursor:move;"><?php echo $item['title']; ?></td>
     <td style="cursor:move;"><?php echo $item['link']; ?></td>
     <td style="cursor:move;"><?php echo $item['section']; ?></td>
     <td style="cursor:move;"><?php echo $item['accesskey']; ?></td>
     <td style="cursor:move;"><?php echo $item['submenu']; ?></td>
     <td><a href="<?php echo CMSHOME;?>?mode=menus&amp;action=edit_menu_item&amp;id=<?php echo $item['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a>&nbsp;&nbsp;<a href="<?php echo CMSHOME;?>?mode=menus&amp;action=delete_menu_item&amp;id=<?php echo $item['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a>&nbsp;&nbsp;<a href="<?php echo CMSHOME;?>?mode=menus&amp;move_up=<?php echo $item['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/arrow_up.png" alt="<?php echo $lang['move_up']; ?>" title="<?php echo $lang['move_up']; ?>" width="16" height="16" /></a><a href="<?php echo CMSHOME;?>?mode=menus&amp;move_down=<?php echo $item['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/arrow_down.png" alt="<?php echo $lang['move_down']; ?>" title="<?php echo $lang['move_down']; ?>" width="16" height="16" /></a></td>
    </tr>
    <?php ++$i; endforeach; endif; ?>
    <tr class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?> nodrag">
     <td><input type="text" name="name" value="" size="10" style="width:100%;" /></td>
     <td><input type="text" name="title" value="" size="10" style="width:100%;" /></td>
     <td><input type="text" name="link" value="" size="10" style="width:100%;" /></td>
     <td><input type="text" name="section" value="" size="10" style="width:100%;" /></td>
     <td><input type="text" name="accesskey" value="" size="3" style="width:100%;" /></td>
     <td><input type="text" name="submenu" value="" size="3" style="width:100%;" /></td>
     <td colspan="3"><input type="submit" name="new_menu_item" value="<?php echo $lang['add_menu_item_submit']; ?>" /></td>
    </tr>

    <?php endif; ?>

   </tbody>
  </table>
 </div>
</form>
<?php if(empty($edit_item)): ?>
<script type="text/javascript">Sortable.create('items', { tag:'tr', onUpdate : updateMenuOrder });</script>
<?php endif; ?>
