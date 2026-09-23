<?php if(isset($thumbnail)): ?>
<?php if($settings['lightbox_enabled']): ?>
<a rel="lightbox" href="<?php echo BASE_URL . MEDIA_DIR. $thumbnail['photo']; ?>"><img <?php if(isset($thumbnail['class'])): ?> class="<?php echo $thumbnail['class']; ?>" <?php endif; ?>src="<?php echo BASE_URL.MEDIA_DIR.$thumbnail['image']; ?>" title="<?php echo $thumbnail['subtitle']; ?>" alt="<?php echo $thumbnail['title']; ?>" width="<?php echo $thumbnail['width']; ?>" height="<?php echo $thumbnail['height']; ?>" /></a>
<?php else: ?>
<a href="<?php echo BASE_URL.$page; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $thumbnail['id']; ?>"><img <?php if(isset($thumbnail['class'])): ?> class="<?php echo $thumbnail['class']; ?>" <?php endif; ?>src="<?php echo BASE_URL.MEDIA_DIR.$thumbnail['image']; ?>" title="<?php echo $thumbnail['title']; ?>" alt="<?php echo $thumbnail['title']; ?>" width="<?php echo $thumbnail['width']; ?>" height="<?php echo $thumbnail['height']; ?>" /></a>
<?php endif; ?>
<?php else: ?>
<span class="missing">[ missing image ]</span>
<?php endif; ?>
