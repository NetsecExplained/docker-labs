<!DOCTYPE html>
<html lang="<?php echo $lang['lang']; ?>" dir="<?php echo $lang['dir']; ?>">
<head>
<meta http-equiv="content-type" content="text/html; charset=<?php echo $lang['charset']; ?>" />
<title><?php echo $settings['website_title']; ?> - <?php echo $photo_data['title']; ?></title>
<meta name="robots" content="index, follow" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="<?php echo BASE_URL; ?>templates/photo.css" media="all" />
<link rel="shortcut icon" href="<?php echo BASE_URL; ?>templates/images/favicon.ico" />
<script src="<?php echo BASE_URL; ?>js/main.js" type="text/javascript"></script>
<?php if($admin): ?>
<script src="<?php echo BASE_URL; ?>js/admin.js" type="text/javascript"></script>
<?php endif; ?>
</head>
<body>

<div id="photonavwrapper">
<div id="photonav" style="width:<?php echo $photo_data['width']+2; ?>px;">
<div class="left"><?php echo truncate($photo_data['title'],15); ?> (<?php echo $photo_data['photo_number']; ?>/<?php echo $photo_data['total_photos']; ?>)</div>
<div class="middle"><?php if($photo_data['previous_photo']): ?><a href="<?php echo BASE_URL . PAGE; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $photo_data['previous_photo']; ?>"><img id="prev" src="<?php echo BASE_URL; ?>templates/images/plain.png" title="<?php echo $lang['previous_photo']; ?>" alt="[&laquo;]" width="16" height="16" /></a>&nbsp;&nbsp;<?php endif; ?><?php if($photo_data['photo_size']==0 && isset($photo_data['photo_large_available'])): ?><a href="<?php echo BASE_URL . PAGE; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $photo_data['id']; ?>,1"><img id="enlarge" src="<?php echo BASE_URL; ?>templates/images/plain.png" alt="[+]" title="<?php echo $lang['enlarge_photo']; ?>" width="16" height="16" /></a>&nbsp;&nbsp;<?php elseif($photo_data['photo_size']==1): ?><a href="<?php echo BASE_URL . PAGE; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $photo_data['id']; ?>"><img id="reduce" src="<?php echo BASE_URL; ?>templates/images/plain.png" alt="[-]" title="<?php echo $lang['reduce_photo']; ?>" width="16" height="16" /></a>&nbsp;&nbsp;<?php endif; ?><?php if($photo_data['next_photo']): ?><a href="<?php echo BASE_URL . PAGE; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $photo_data['next_photo']; ?>"><img id="next" src="<?php echo BASE_URL; ?>templates/images/plain.png" title="<?php echo $lang['next_photo']; ?>"  alt="[&raquo;]" width="16" height="16" /></a><?php endif; ?></div>
<div class="right"><a class="icon" href="<?php echo BASE_URL . PAGE; if(isset($page_addition)) echo $page_addition; ?>" title="<?php echo $lang['back_title']; ?>"><img src="<?php echo BASE_URL; ?>templates/images/close.png" alt="" width="16" height="16" /><span><?php echo $lang['back_link']; ?></span></a></div>
</div>
</div>

<div id="photocontent" style="width:<?php echo $photo_data['width']+2; ?>px;">
<?php if($photo_data['type']=='flash'): ?>
<!--[if IE]>
<object	id="flash" type="application/x-shockwave-flash" data="<?php echo BASE_URL . MEDIA_DIR . $photo_data['photo']; ?>" width="<?php echo $photo_data['width']; ?>" height="<?php echo $photo_data['height']; ?>">
<param name="movie" value="<?php echo BASE_URL . MEDIA_DIR . $photo_data['photo']; ?>" />
</object>
<![endif]-->
<!--[if !IE]>-->
<object	id="flash" type="application/x-shockwave-flash" data="<?php echo BASE_URL . MEDIA_DIR . $photo_data['photo']; ?>" width="<?php echo $photo_data['width']; ?>" height="<?php echo $photo_data['height']; ?>"><param name="movie" value="<?php echo BASE_URL; ?>images/<?php echo $photo_data['photo']; ?>" />
</object>
<!--<![endif]-->
<?php elseif($photo_data['type']=='flv'): ?>
<!--[if IE]>
<object	id="flash" type="application/x-shockwave-flash" data="<?php echo BASE_URL; ?>cms/modules/flowplayer/flowplayer.swf" width="<?php echo $photo_data['width']; ?>" height="<?php echo $photo_data['height']; ?>">
<param name="movie" value="<?php echo BASE_URL; ?>cms/modules/flowplayer/flowplayer.swf" />

<param name="flashvars" value='config={"clip":"<?php echo BASE_URL . MEDIA_DIR . $photo_data['photo']; ?>"}' /> 

</object>
<![endif]-->
<!--[if !IE]>-->
<object	id="flash" type="application/x-shockwave-flash" data="<?php echo BASE_URL; ?>cms/modules/flowplayer/flowplayer.swf" width="<?php echo $photo_data['width']; ?>" height="<?php echo $photo_data['height']; ?>">
<param name="allowfullscreen" value="true" />
<param name="flashvars" value="config={'clip':{'url':'<?php echo BASE_URL . MEDIA_DIR . $photo_data['photo']; ?>','autoPlay':false,'autoBuffering':true},'plugins':{'controls':{'url':'<?php echo BASE_URL; ?>cms/modules/flowplayer/flowplayer.controls.swf'}},'play':{'replayLabel':''}}" />
</object>
<!--<![endif]-->
<?php else: ?><?php if(isset($photo_data['next_photo'])): ?><a href="<?php echo BASE_URL . PAGE; ?>,<?php echo IMAGE_IDENTIFIER; ?>,<?php echo $photo_data['next_photo']; ?>"><?php endif; ?><img id="photo" src="<?php echo BASE_URL . MEDIA_DIR . $photo_data['photo']; ?>" alt="<?php echo $photo_data['title']; ?>" width="<?php echo $photo_data['width']; ?>" height="<?php echo $photo_data['height']; ?>" />
<?php if(isset($photo_data['next_photo'])): ?>
</a>
<?php endif; ?>
<?php endif; ?>

<?php if($photo_data['title']): ?><h2 id="title"><?php echo $photo_data['title']; ?></h2><?php endif; ?>
<?php if($photo_data['subtitle']): ?><p id="subtitle"><?php echo $photo_data['subtitle']; ?></p><?php endif; ?>
<?php if($photo_data['description']): ?><?php echo $photo_data['description']; ?><?php endif; ?>

<?php if($settings['photos_commentable']==1) include(BASE_PATH.'templates/subtemplates/photo_comments.inc.tpl'); ?>

</div>

<?php if(empty($photo_data['photo'])): ?>
<p style="text-align:center;font-weight:bold;color:red;">Template inappropriate for this kind of content!</p>
<?php endif; ?>
</body>
</html>
