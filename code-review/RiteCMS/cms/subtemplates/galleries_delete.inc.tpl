<h1><?php echo $lang['delete_gallery']; ?></h1>

<p><?php echo str_replace('[gallery]', $gallery, $lang['delete_gallery_confirm']); ?></p>

<form action="<?php echo CMSHOME;?>" method="post">
<div>
 <input type="hidden" name="mode" value="galleries" />
 <input type="hidden" name="delete_gallery" value="<?php echo $gallery; ?>" />
 <input type="submit" name="confirmed" value="<?php echo $lang['delete_gallery_submit']; ?>" />
</div>
</form>

