<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=notes"><?php echo $lang['notes']; ?></a> &raquo; <?php echo $note_section; ?></h1>

<ul class="options">
 <li><a href="<?php echo CMSHOME;?>?mode=notes&amp;add_note=<?php echo $note_section; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/note_add.png" alt="" width="16" height="16" /><span><?php echo $lang['add_note']; ?></span></a></li>
</ul>

<?php if(isset($notes)): ?>

<table id="sortable" class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <thead>
  <tr>
   <th colspan="4"><?php echo $note_section; ?></th>
  </tr>
 </thead>
 <tbody id="items">
  <?php $i=0; foreach($notes as $note): ?>
  <tr id="id_<?php echo $note['id']; ?>" class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
   <td style="cursor:move;">
    <h3><?php echo stripslashes($note['title']); ?></h3>
    <p><?php echo $note['text']; ?></p>
   </td>
   <td><a href="<?php echo CMSHOME;?>?mode=notes&amp;edit_note=<?php echo $note['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a></td>
   <td><a href="<?php echo CMSHOME;?>?mode=notes&amp;delete_note=<?php echo $note['id']; ?>" onclick="return confirm_link('<?php echo rawurlencode($lang['delete_note_confirm']); ?>')"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
   <td><a href="<?php echo CMSHOME;?>?mode=notes&amp;move_up=<?php echo $note['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/arrow_up.png" alt="<?php echo $lang['move_up']; ?>" title="<?php echo $lang['move_up']; ?>" width="16" height="16" /></a><a href="<?php echo CMSHOME;?>?mode=notes&amp;move_down=<?php echo $note['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/arrow_down.png" alt="<?php echo $lang['move_up']; ?>" title="<?php echo $lang['move_up']; ?>" width="16" height="16" /></a></td>
  </tr>
 <?php $i++; endforeach; ?>
 </tbody>
</table>

<script type="text/javascript">Sortable.create('items', { tag:'tr', onUpdate : updateNotesOrder });</script>

<?php else: ?>

<p><em><?php echo $lang['no_notes']; ?></em></p>

<?php endif; ?>
