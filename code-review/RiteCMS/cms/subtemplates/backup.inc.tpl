<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['backup']; ?></h1>

<div class="admin_note"><img src="<?php echo BASE_URL.CMS; ?>images/exclamation.png" alt="" width="16" height="16" /><?php echo $lang['backup_note'];?></div>

<ul class="options">
<li><a href="<?php echo CMSHOME;?>?mode=backup&amp;action=copy"><img src="<?php echo BASE_URL.CMS; ?>images/shield.png" alt="" width="16" height="16" /><span><?php echo $lang['backup']; ?></span></a></li>
</ul>

<?php if(isset($files)): ?>

<table class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <tr>
  <th><?php echo $lang['file']; ?></th>
  <th><?php echo $lang['file_size']; ?></th>
  <th><?php echo $lang['file_date']; ?></th>
<th>&nbsp;</th>
 </tr>

<?php $i=0; foreach($files as $file): ?>

<tr class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
 <td class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>"><a href="<?php echo DATA_DIR.$file['filename']; ?>"><?php echo $file['filename']; ?></a></td>
 <td><?php echo $file['size']; ?></td>
 <td><?php echo $file['last_modified']; ?></td>
 <td><a href="<?php echo CMSHOME;?>?mode=backup&amp;delete=<?php echo $file['filename']; ?>" onclick="str='<?php echo rawurlencode($lang['delete_file_confirm']); ?>'; return confirm_link(str.replace('<?php echo rawurlencode('[file]'); ?>','<?php echo rawurlencode($file['filename']); ?>'),this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
</tr>

<?php ++$i; endforeach ?>

</table>

<?php endif; ?>
