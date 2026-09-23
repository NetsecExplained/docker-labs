<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['gcb']; ?></h1>

<ul class="options">
 <li><a href="<?php echo CMSHOME;?>?mode=gcb&amp;add_gcb=true"><img src="<?php echo BASE_URL.CMS; ?>images/gcb_add.png" alt="" width="16" height="16" /><span><?php echo $lang['add_gcb']; ?></span></a></li>
</ul>

<?php if(isset($gcbs)): ?>

<table class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <tr>
  <th><?php echo $lang['gcb_id']; ?></th>
  <th><?php echo $lang['gcb_title']; ?></th>
  <th><?php echo $lang['gcb_content']; ?></th>
  <th colspan="2">&nbsp;</th>
 </tr>
 <?php $i=0; foreach($gcbs as $gcb): ?>
 <tr class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
  <td><?php echo $gcb['id']; ?></td>
  <td><?php echo $gcb['title']; ?></td>
  <td><?php echo $gcb['content']; ?></td>
  <td><a href="<?php echo CMSHOME;?>?mode=gcb&amp;edit=<?php echo $gcb['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a></td>
  <td><a href="<?php echo CMSHOME;?>?mode=gcb&amp;delete=<?php echo $gcb['id']; ?>" onclick="str='<?php echo rawurlencode($lang['delete_gcb_confirm']); ?>'; return confirm_link(str.replace('<?php echo rawurlencode('[title]'); ?>','<?php echo rawurlencode($gcb['title']); ?>'),this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td>
 </tr>
 <?php $i++; endforeach; ?>
</table>

<?php else: ?>

<p><em><?php echo $lang['no_gcb']; ?></em></p>

<?php endif; ?>
