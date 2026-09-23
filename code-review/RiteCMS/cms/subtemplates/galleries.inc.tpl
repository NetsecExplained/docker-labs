<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['photo_galleries']; ?></h1>

<ul class="options">
 <li><a href="<?php echo CMSHOME;?>?mode=galleries&amp;action=new"><img src="<?php echo BASE_URL.CMS; ?>images/lightning_add.png" alt="" width="16" height="16" /><span><?php echo $lang['create_new_gallery']; ?></span></a></li>
</ul>

<?php if(isset($galleries)): ?>

<table class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <tr>
  <th><?php echo $lang['gallery']; ?></th>
  <th colspan="2">&nbsp;</th>
 </tr>
 <?php $i=0; foreach($galleries as $gallery): ?>
 <tr class="<?php if($i % 2 == 0) echo "a"; else echo "b"; ?>">
  <td><?php echo htmlspecialchars(stripslashes($gallery)); ?></td>
  <td><a href="<?php echo CMSHOME;?>?mode=galleries&amp;edit=<?php echo $gallery; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a></td>
  <td><a href="<?php echo CMSHOME;?>?mode=galleries&amp;delete_gallery=<?php echo $gallery; ?>" onclick="str='<?php echo rawurlencode($lang['delete_gallery_confirm']); ?>'; return confirm_link(str.replace('<?php echo rawurlencode('[gallery]'); ?>','<?php echo rawurlencode($gallery); ?>'),this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
 </tr>
 <?php $i++; endforeach; ?>
</table>

<?php else: ?>

<p><em><?php echo $lang['no_gallery']; ?></em></p>

<?php endif; ?>
