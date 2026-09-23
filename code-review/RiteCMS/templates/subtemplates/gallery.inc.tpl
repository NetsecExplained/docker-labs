<?php if(isset($photos)): ?>
<table class="thumbtable<?php if(!empty($content)): ?> below<?php endif; ?>" cellspacing="0" cellpadding="0" border="0">

<?php for($i=0;$i<$number_of_photos;$i=$i+$photos_per_row): ?>
<tr>
<?php for($n=$i;$n<$i+$photos_per_row;++$n): ?>
<td<?php if($n==$i): ?> class="first"<?php elseif($n==$i+$photos_per_row-1): ?> class="last"<?php endif; ?>>
<?php if(isset($photos[$n])): ?>
<?php if($settings['lightbox_enabled']): ?>
<a rel="lightbox" href="<?php echo BASE_URL . MEDIA_DIR. $photos[$n]['photo_normal']; ?>"><img class="thumbnail" src="<?php echo BASE_URL.MEDIA_DIR.$photos[$n]['photo_thumbnail']; ?>" title="<?php echo $photos[$n]['subtitle']; ?>" alt="<?php echo $photos[$n]['title']; ?>" width="<?php echo $photos[$n]['width']; ?>" height="<?php echo $photos[$n]['height']; ?>" /></a>
<?php else: ?>
<a href="<?php echo BASE_URL . $page; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $photos[$n]['id']; ?>"><img class="thumbnail" src="<?php echo BASE_URL.MEDIA_DIR.$photos[$n]['photo_thumbnail']; ?>" title="<?php echo $photos[$n]['title']; ?>" alt="<?php echo $photos[$n]['title']; ?>" width="<?php echo $photos[$n]['width']; ?>" height="<?php echo $photos[$n]['height']; ?>" /></a>
<?php endif; ?>
<p><?php echo truncate($photos[$n]['title'],15); ?></p>
<?php else: ?>
&nbsp;
<?php endif; ?>

</td>
<?php endfor; ?>

</tr>
<?php endfor; ?>

</table>

<?php else: ?>
<p><em>No photo in this gallery</em><p>
<?php endif; ?>
