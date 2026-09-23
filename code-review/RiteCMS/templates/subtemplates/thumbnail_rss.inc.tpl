<?php if(isset($thumbnail)): ?>
<a href="<?php echo BASE_URL.$page; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $thumbnail['id']; ?>"><img src="<?php echo BASE_URL.MEDIA_DIR.$thumbnail['image']; ?>" title="<?php echo $thumbnail['title']; ?>" alt="<?php echo $thumbnail['title']; ?>" width="<?php echo $thumbnail['width']; ?>" height="<?php echo $thumbnail['height']; ?>" /></a>
<?php else: ?>
<span class="missing">[ missing image ]</span>
<?php endif; ?>
