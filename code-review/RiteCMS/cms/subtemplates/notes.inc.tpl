<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['notes']; ?></h1>

<ul class="options">
 <li><a href="<?php echo CMSHOME;?>?mode=notes&amp;action=new"><img src="<?php echo BASE_URL.CMS; ?>images/lightning_add.png" alt="" width="16" height="16" /><span><?php echo $lang['create_note_section']; ?></span></a></li>
</ul>

<?php if(isset($note_sections)): ?>

<table class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <tr>
  <th><?php echo $lang['note_section']; ?></th>
  <th colspan="2">&nbsp;</th>
 </tr>
 <?php $i=0; foreach($note_sections as $note_section): ?>
 <tr class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
  <td><?php echo $note_section; ?></td>
  <td><a href="<?php echo CMSHOME;?>?mode=notes&amp;edit=<?php echo $note_section; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a></td>
  <td><a href="<?php echo CMSHOME;?>?mode=notes&amp;delete=<?php echo $note_section; ?>" onclick="str='<?php echo rawurlencode($lang['delete_note_section_confirm']); ?>'; return confirm_link(str.replace('<?php echo rawurlencode('[note_section]'); ?>','<?php echo rawurlencode($note_section); ?>'),this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
 </tr>
 <?php $i++; endforeach; ?>
</table>

<?php else: ?>

<p><em><?php echo $lang['no_note_sections']; ?></em></p>

<?php endif; ?>
