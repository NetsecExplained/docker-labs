<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=notes"><?php echo $lang['notes']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=notes&amp;edit=<?php echo $note['note_section']; ?>"><?php echo $note['note_section']; ?></a> &raquo; <?php if(isset($note['id'])): echo $lang['edit_note']; else: echo $lang['add_note']; endif; ?></h1>

<?php include('errors.inc.tpl'); ?>

<form action="<?php echo CMSHOME;?>" method="post" name="notesform">
 <div>
  <input type="hidden" name="mode" value="notes" />
  <?php if(isset($note['id'])): ?>
  <input type="hidden" name="id" value="<?php echo $note['id']; ?>" />
  <?php endif; ?>
  <input type="hidden" name="note_section" value="<?php echo $note['note_section']; ?>" />
  <table cellspacing="0" cellpadding="5" border="0">
   <tr>
    <td class="edit"><b><?php echo $lang['edit_note_title']; ?></b></td>
    <td class="edit"><input type="text" name="title" value="<?php if(isset($note['title'])) echo $note['title']; ?>" size="50" /></td>
   </tr>
<!--
   <tr>
    <td class="edit"><b><?php echo $lang['edit_note_teaser']; ?></b></td>
    <td class="edit"><textarea name="teaser" cols="55" rows="3"><?php if(isset($note['teaser'])) echo $note['teaser']; ?></textarea><br />
   </tr>
-->
   <tr>
    <td class="edit"><b><?php echo $lang['edit_note_text']; ?></b></td>
    <td class="edit"><textarea name="text" cols="55" rows="13"><?php if(isset($note['text'])) echo $note['text']; ?></textarea><br />
    <span class="small"><input id="text_formatting" type="checkbox" name="text_formatting" value="1"<?php if(isset($note['text_formatting']) && $note['text_formatting']==1): ?> checked="checked"<?php endif; ?> /><label for="text_formatting"><?php echo $lang['edit_formatting']; ?></label></span></td>
   </tr>
   <tr>
    <td class="edit"><b><?php echo $lang['edit_note_link']; ?></b></td>
    <td class="edit"><input type="text" name="link" value="<?php if(isset($note['link'])) echo $note['link']; ?>" size="50" /></td>
   </tr>
   <tr>
   <tr>
    <td><b><?php echo $lang['edit_note_date_marking']; ?></b></td>
    <td><input type="text" name="time" value="<?php if(isset($note['time'])) echo $note['time']; ?>" size="20" /> <small><?php echo $lang['edit_time_format']; ?></small></td>
    <td>&nbsp;</td>
   </tr>
   <tr>
    <td class="edit">&nbsp;</td>
    <td class="edit"><input type="submit" name="edit_note_submit" value="<?php echo $lang['submit_button_ok']; ?>" /></td>
   </tr>
  </table>
 </div>
</form>
