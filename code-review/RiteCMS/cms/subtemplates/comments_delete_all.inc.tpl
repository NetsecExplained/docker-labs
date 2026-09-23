<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=comments"><?php echo $lang['comments']; ?></a> &raquo; <?php echo $lang['delete_comments']; ?></h1>

<?php if($type==0): ?>
<p><?php echo $lang['delete_all_page_comments']; ?></p>
<?php else: ?>
<p><?php echo $lang['delete_all_photo_comments']; ?></p>
<?php endif ?>

<form action="<?php echo CMSHOME;?>" method="post">
 <div>
  <input type="hidden" name="mode" value="comments" />
  <input type="hidden" name="type" value="<?php echo $type; ?>" />
  <input type="submit" name="delete_all_comments_confirmed" value="<?php echo $lang['delete_all_comments_subm']; ?>" />
 </div>
</form>
