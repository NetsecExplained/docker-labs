<h1><a href="<?php echo CMSHOME;?>"><?php echo $lang['administration']; ?></a> &raquo; <a href="<?php echo CMSHOME;?>?mode=comments"><?php echo $lang['comments']; ?></a> &raquo; <?php echo $lang['delete_comments']; ?></h1>

<p><?php echo str_replace('[item]',$item,$lang['delete_all_comm_page_conf']); ?></p>

<form action="<?php echo basename($_SERVER['PHP_SELF']); ?>" method="post">
 <div>
  <input type="hidden" name="mode" value="comments" />
  <input type="hidden" name="type" value="<?php echo $type; ?>" />
  <input type="hidden" name="comment_id" value="<?php echo $comment_id; ?>" />
  <input type="submit" name="delete_all_comments_page_confirmed" value="<?php echo $lang['delete_all_comments_subm']; ?>" />
 </div>
</form>
