<?php if(isset($photos)): ?>
<table cellspacing="5" cellpadding="5" border="0">

<?php for($i=0;$i<$number_of_photos;$i=$i+$photos_per_row): ?>
<tr>

<?php for($n=$i;$n<$i+$photos_per_row;++$n): ?>
<td>
<?php if(isset($photos[$n])): ?>
<a href="<?php echo BASE_URL . $page; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $photos[$n]['id']; ?>"><img src="<?php echo BASE_URL.MEDIA_DIR.$photos[$n]['photo_thumbnail']; ?>" title="<?php echo $photos[$n]['title']; ?>" alt="<?php echo $photos[$n]['title']; ?>" width="<?php echo $photos[$n]['width']; ?>" height="<?php echo $photos[$n]['height']; ?>" /></a><br />
<small><?php echo truncate($photos[$n]['title'],15); ?></small>
<?php else: ?>
&nbsp;
<?php endif; ?>

</td>
<?php endfor; ?>

</tr>
<?php endfor; ?>

</table>

<?php endif; ?>
