<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=galleries"><?php echo $lang['photo_galleries']; ?></a> &raquo; <?php echo str_replace('[gallery]',$gallery,$lang['edit_gallery']); ?></h1>

<ul class="options">
 <li><a href="<?php echo CMSHOME;?>?mode=galleries&amp;new_photo=<?php echo $gallery; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/photo_add.png" alt="" width="16" height="16" /><span><?php echo $lang['add_photo']; ?></span></a></li>
</ul>

<?php if(isset($items)): ?>

<table id="sortable" class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <thead>
  <tr>
   <th><?php echo $lang['photo']; ?></th>
   <th><?php echo $lang['photo_title']; ?></th>
   <th><?php echo $lang['photo_subtitle']; ?></th>
   <th><?php echo $lang['photo_description']; ?></th>
   <th colspan="2">&nbsp;</th>
   <th style="width:32px;">&nbsp;</th>
  </tr>
 </thead>
 <tbody id="items">
  <?php $i=0; foreach($items as $item): ?>
  <tr id="id_<?php echo $item['id']; ?>" class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>" style="cursor:move;">
   <td><!--<a href="<?php echo BASE_URL.MEDIA_DIR.$item['photo_normal']; ?>">--><img id="photo<?php echo $item['id']; ?>" src="<?php echo BASE_URL.MEDIA_DIR.$item['photo_thumbnail']; ?>" alt="<?php echo $item['title']; ?>" ondblclick="image_popup('<?php echo BASE_URL.MEDIA_DIR.$item['photo_normal']; ?>')" /><!--</a>--></td>
   <td><?php echo $item['title']; ?></td>
   <td><?php echo $item['subtitle']; ?></td>
   <td><?php echo $item['description']; ?></td>
   <td><a href="<?php echo CMSHOME;?>?mode=galleries&amp;edit_photo=<?php echo $item['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" class="controll" /></a></td>
   <td><a href="<?php echo CMSHOME;?>?mode=galleries&amp;delete_photo=<?php echo $item['id']; ?>" onclick="str='<?php echo rawurlencode($lang['delete_photo_confirm']); ?>'; return confirm_link(str.replace('<?php echo rawurlencode('[photo]'); ?>','<?php echo rawurlencode(stripslashes($item['title'])); ?>'))"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" class="controll" /></a></td>
   <td><a href="<?php echo CMSHOME;?>?mode=galleries&amp;move_up_photo=<?php echo $item['id']; ?>#photo<?php echo $item['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/arrow_up.png" alt="<?php echo $lang['move_up']; ?>" title="<?php echo $lang['move_up']; ?>" width="16" height="16" class="controll" /></a><a href="<?php echo CMSHOME;?>?mode=galleries&amp;move_down_photo=<?php echo $item['id']; ?>#photo<?php echo $item['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/arrow_down.png" alt="<?php echo $lang['move_down']; ?>" title="<?php echo $lang['move_down']; ?>" width="16" height="16" class="controll" /></a></td>
  </tr>
  <?php $i++; endforeach ?>
 </tbody>
</table>

<ul class="options">
 <li><a href="<?php echo CMSHOME;?>?mode=galleries&amp;new_photo=<?php echo $gallery; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/photo_add.png" alt="" width="16" height="16" /><span><?php echo $lang['add_photo']; ?></span></a></li>
 <li><a href="<?php echo CMSHOME;?>?mode=galleries&amp;gallery_properties=<?php echo $gallery; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/cog.png" alt="" width="16" height="16" /><span><?php echo $lang['gallery_properties']; ?></span></a></li>
</ul>

<?php else: ?>

<p><em><?php echo $lang['no_photo']; ?></em></p>

<?php endif; ?>
