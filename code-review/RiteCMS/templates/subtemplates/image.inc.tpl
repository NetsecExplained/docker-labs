<?php if(isset($image)): ?>
<?php if($image['type']=='flash'): ?>
<!--[if IE]>
<object	id="flash" type="application/x-shockwave-flash" data="<?php echo BASE_URL.MEDIA_DIR.$image['image']; ?>" width="<?php echo $image['width']; ?>" height="<?php echo $image['height']; ?>">
<param name="movie" value="<?php echo BASE_URL.MEDIA_DIR.$image['image']; ?>" />
<?php echo $image['alt']; ?>
</object>
<![endif]-->
<!--[if !IE]>-->
<object	id="flash" type="application/x-shockwave-flash" data="<?php echo BASE_URL.MEDIA_DIR.$image['image']; ?>" width="<?php echo $image['width']; ?>" height="<?php echo $image['height']; ?>"><param name="movie" value="<?php echo BASE_URL.MEDIA_DIR.$image['image']; ?>" />
<?php echo $image['alt']; ?>
</object>
<!--<![endif]-->
<?php elseif($image['type']=='flv'): ?>
<!--[if IE]>
<object	id="flash" type="application/x-shockwave-flash" data="<?php echo BASE_URL; ?>cms/modules/flowplayer/flowplayer.swf" width="<?php echo $image['width']; ?>" height="<?php echo $image['height']; ?>">
<param name="movie" value="<?php echo BASE_URL; ?>cms/modules/flowplayer/flowplayer.swf" />
<param name="flashvars" value='config={"clip":"<?php echo BASE_URL.MEDIA_DIR.$image['image']; ?>"}' /> 
<?php echo $image['alt']; ?>
</object>
<![endif]-->
<!--[if !IE]>-->
<object	id="flash" type="application/x-shockwave-flash" data="<?php echo BASE_URL; ?>cms/modules/flowplayer/flowplayer.swf" width="<?php echo $image['width']; ?>" height="<?php echo $image['height']; ?>">
<param name="allowfullscreen" value="true" />
<param name="flashvars" value="config={'clip':{'url':'<?php echo BASE_URL.MEDIA_DIR.$image['image']; ?>','autoPlay':false,'autoBuffering':true},'plugins':{'controls':{'url':'<?php echo BASE_URL; ?>cms/modules/flowplayer/flowplayer.controls.swf'}},'play':{'replayLabel':''}}" />
<?php echo $image['alt']; ?>
</object>
<!--<![endif]-->
<?php else: ?>
<img <?php if(isset($image['class'])): ?> class="<?php echo $image['class']; ?>" <?php endif; ?>src="<?php echo BASE_URL.MEDIA_DIR.$image['image']; ?>" title="<?php echo $image['alt']; ?>" alt="<?php echo $image['alt']; ?>" width="<?php echo $image['width']; ?>" height="<?php echo $image['height']; ?>" />
<?php endif; ?>
<?php else: ?>
<span class="missing">[ missing image ]</span>
<?php endif; ?>
