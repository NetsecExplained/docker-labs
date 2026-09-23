<?php if(isset($included_pages)): ?>
<div class="overview">

<?php $columns=2; for($i=0;$i<$included_pages_number;$i=$i+$columns): ?>
<?php for($ii=$i;$ii<$i+$columns;++$ii): ?>
<div class="product">
<?php if(isset($included_pages[$ii])): ?>
<?php if($included_pages[$ii]['teaser_img']): ?>
<a href="<?php echo BASE_URL.$included_pages[$ii]['page']; ?>"><img class="teaser" src="<?php echo BASE_URL.MEDIA_DIR.$included_pages[$ii]['teaser_img']; ?>" alt="<?php echo $included_pages[$ii]['teaser_headline']; ?>" width="<?php echo $included_pages[$ii]['teaser_img_width']; ?>" height="<?php echo $included_pages[$ii]['teaser_img_height']; ?>" /></a>
<?php endif; ?>
<h2 class="teaser"><a href="<?php echo BASE_URL.$included_pages[$ii]['page']; ?>"><?php echo $included_pages[$ii]['teaser_headline']; ?></a></h2>
<p class="teaser"><?php echo $included_pages[$ii]['teaser']; ?></p>
<?php else: ?>
&nbsp;
<?php endif; ?>
</div>
<?php endfor; ?>
<?php endfor; ?>

</div>
<?php endif; ?>
