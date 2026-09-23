<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['filemanager']; ?></h1>

<form action="<?php echo basename($_SERVER['PHP_SELF']); ?>" method="get">
 <div>
  <input type="hidden" name="mode" value="filemanager" />
  <?php echo $lang['directory']; ?> <select size="1" name="directory" onchange="this.form.submit();">
  <option value="<?php echo $media_dir ?>"<?php if($directory==$media_dir): ?> selected="selected"<?php endif; ?>><?php echo $media_dir ?></option>
  <option value="<?php echo $file_dir ?>"<?php if($directory==$file_dir): ?> selected="selected"<?php endif; ?>><?php echo $file_dir ?></option>
  </select> <input type="image" name="" value="" src="<?php echo BASE_URL.CMS; ?>images/submit.png" alt="&raquo;" />
</div>
</form>

<ul class="options">
<li><a href="<?php echo CMSHOME;?>?mode=filemanager&amp;action=upload&amp;directory=<?php echo $directory; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/upload.png" alt="" width="16" height="16" /><span><?php echo $lang['upload_file_link']; ?></span></a></li>
</ul>

<?php if(isset($files)): ?>

<table class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <tr>
  <th><?php echo $lang['file']; ?></th>
  <?php if(isset($mime_content_type)): ?><th><?php echo $lang['file_type']; ?></th><?php endif; ?>
  <th><?php echo $lang['file_size']; ?></th>
  <th><?php echo $lang['file_date']; ?></th>
  <th>&nbsp;</th>
 </tr>

<?php $i=0; foreach($files as $file): ?>

<tr class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
 <td class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>"><a href="../<?php echo $directory; ?>/<?php echo $file['filename']; ?>"><?php echo $file['filename']; ?></a></td>
 <?php if(isset($mime_content_type)): ?><td class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>"><?php echo $file['mime_content_type']; ?></td><?php endif; ?>
 <td><?php echo $file['size']; ?></td>
 <td><?php echo $file['last_modified']; ?></td>
 <td><a href="<?php echo CMSHOME;?>?mode=filemanager&amp;directory=<?php echo $directory; ?>&amp;delete=<?php echo $file['filename']; ?>" onclick="str='<?php echo rawurlencode($lang['delete_file_confirm']); ?>'; return confirm_link(str.replace('<?php echo rawurlencode('[file]'); ?>','<?php echo rawurlencode($file['filename']); ?>'),this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
</tr>

<?php ++$i; endforeach ?>

</table>

<?php else: ?>

<p><i><?php echo $lang['no_files']; ?></i></p>

<?php endif; ?>
