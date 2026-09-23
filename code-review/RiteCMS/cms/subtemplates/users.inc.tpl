<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <?php echo $lang['users']; ?></h1>

<?php include('errors.inc.tpl'); ?>

<?php if($user_type==1): ?>
<ul class="options">
 <li><a href="<?php echo CMSHOME;?>?mode=users&amp;action=new"><img src="<?php echo BASE_URL.CMS; ?>images/user_add.png" alt="" width="16" height="16" /><span><?php echo $lang['create_user_account']; ?></span></a></li>
</ul>
<?php endif; ?>

<?php if(isset($users)): ?>

<table class="admin-table" cellspacing="1" cellpadding="5" border="0">
 <tr>
  <th><?php echo $lang['user_name']; ?></th>
  <th><?php echo $lang['user_type']; ?></th>
  <th><?php echo $lang['last_login']; ?></th>
  <th<?php if($user_type==1): ?> colspan="2"<?php endif; ?>>&nbsp;</th>
 </tr>
 <?php $i=0; foreach($users as $user): ?>
 <tr class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>">
  <td><?php echo htmlspecialchars(stripslashes($user['name'])); ?></td>
  <td><?php if($user['type']==0) echo $lang['type_0']; elseif($user['type']==1) echo $lang['type_1']?></td>
  <td><?php if($user['last_login']) echo strftime($lang['time_format'],$user['last_login']); ?></td>
  <td><?php if($user_type==1 || $user_id==$user['id']): ?><a href="<?php echo CMSHOME;?>?mode=users&amp;edit=<?php echo $user['id']; ?>"><img src="<?php echo BASE_URL.CMS; ?>images/edit.png" alt="<?php echo $lang['edit']; ?>" title="<?php echo $lang['edit']; ?>" width="16" height="16" /></a><?php else: ?>&nbsp;<?php endif; ?></td>
  <?php if($user_type==1): ?><td class="<?php if($i%2==0): ?>a<?php else: ?>b<?php endif; ?>"><a href="<?php echo CMSHOME;?>?mode=users&amp;delete=<?php echo $user['id']; ?>&amp;token_id=<?php echo md5(session_id().TOKEN_SALT);?>" onclick="str='<?php echo rawurlencode($lang['delete_user_confirm']); ?>'; return confirm_link(str.replace('<?php echo rawurlencode('[name]'); ?>','<?php echo rawurlencode($user['name']); ?>'),this)"><img src="<?php echo BASE_URL.CMS; ?>images/delete.png" alt="<?php echo $lang['delete']; ?>" title="<?php echo $lang['delete']; ?>" width="16" height="16" /></a></td><?php endif; ?>
 </tr>
 <?php $i++; endforeach; ?>
</table>

<?php else: ?>

<p><?php echo $lang['no_users']; ?></p>

<?php endif; ?>
