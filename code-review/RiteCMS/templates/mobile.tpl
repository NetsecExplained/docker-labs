<!DOCTYPE html>
<html lang="<?php echo $lang['lang']; ?>" dir="<?php echo $lang['dir']; ?>">
<head>
<meta http-equiv="content-type" content="text/html; charset=<?php echo $lang['charset']; ?>" />
<meta name="robots" content="<?php if($status>1): ?>index, follow<?php else: ?>noindex, noarchive<?php endif; ?>" />
<meta name="description" content="<?php if($description) echo $description; else echo $settings['default_description']; ?>" />
<meta name="keywords" content="<?php if($keywords) echo $keywords; else echo $settings['default_keywords']; ?>" />
<meta name="generator" content="RiteCMS <?php echo $settings['version']; ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?php echo $settings['website_title']; if($page_title): ?> - <?php echo $page_title; elseif($title): ?> - <?php echo $title; endif; ?></title>
<link rel="stylesheet" type="text/css" href="<?php echo BASE_URL; ?>templates/mobile.css" media="all"  />
<?php if($settings['rss_feed']): ?>
<link rel="alternate" type="application/rss+xml" title="RSS" href="<?php echo BASE_URL.$settings['rss_feed']; ?>" />
<?php endif; ?>
<link rel="shortcut icon" href="<?php echo BASE_URL; ?>templates/images/favicon.png" />
<?php if(isset($pingback)): ?>
<link rel="pingback" href="<?php echo $pingback; ?>" />
<?php endif; ?>
<script src="<?php echo BASE_URL; ?>cms/js/main.js" type="text/javascript"></script>
<?php if(isset($contains_thumbnails) && $settings['lightbox_enabled']): ?>
<script src="<?php echo BASE_URL; ?>js/mylightbox.js" type="text/javascript"></script>
<?php endif; ?>
<?php if($admin): ?>
<script src="<?php echo BASE_URL; ?>cms/js/admin.js" type="text/javascript"></script>
<?php endif; ?>
<?php if(isset($inline_css)) {echo "<style type=\"text/css\">\n".$inline_css."\n</style>\n";} ?>
</head>
<body>
<?php if($admin) include(BASE_PATH.'cms/subtemplates/admin_menu.inc.tpl'); ?>
<div id="logo"><img src="/templates/images/ritecms36.png"></div>
<?php if($menu_1 && isset($menus[$menu_1])): ?>
<div id="navwrapper">
<div id="nav">
<ul>
<?php foreach($menus[$menu_1] as $item): ?><li><a href="<?php echo $item['link']; ?>.m" title="<?php echo $item['title']; ?>"<?php if($item['accesskey']!=''): ?> accesskey="<?php echo $item['accesskey']; ?>"<?php endif; ?><?php if(!empty($item['section']) && $item['section']==$section[0]): ?> id="current"<?php endif; ?>><?php echo $item['name']; ?></a>
<?php if(!empty($item['submenu'])){
        $menu_sub=$item['submenu'];
        if(isset($menus[$menu_sub])) {
        echo '<ul>';
            foreach($menus[$menu_sub] as $item): ?>
            <li><a href="<?php echo $item['link']; ?>.m" title="<?php echo $item['title']; ?>"><?php echo $item['name']; ?></a></li><?php endforeach; 
            echo '</ul>';
            }
    } ?>
</li><?php endforeach; ?>
</ul>
</div></div>
<?php endif; ?>

<div id="mainwrapper">
<?php if($headline): ?><h1 class="headermain"><?php echo $headline; ?></h1><?php endif; ?>
<?php if($page_info): ?><p id="pageinfo"><?php echo $page_info; ?></p><?php endif; ?>
<?php if($sidebar_1): ?>
<div class="topimg">
<?php echo $sidebar_1; ?>
</div>
<?php endif; ?>
<?php if($gcb_1 && isset($gcb[$gcb_1])) echo '<div id="headline">'.$gcb[$gcb_1].'</div>'; ?>
<div id="main">
<div id="content">
<?php if($category): ?>
<p id="category"><?php echo $category; ?></p>
<?php elseif(isset($current_category) && $current_category): ?>
<p id="category"><?php echo $current_category; ?> <a class="close-category" href="<?php echo BASE_URL.PAGE; ?>" title="<?php echo $lang['all_categories']; ?>"><span>[x]</span></a></p>
<?php endif; ?>

<?php if($breadcrumbs): ?>
<p id="breadcrumbs">&bull; <?php foreach($breadcrumbs as $breadcrumb): ?><a href="<?php echo BASE_URL.$breadcrumb['page']; ?>"><?php echo $breadcrumb['title']; ?></a> &raquo; <?php endforeach; ?><?php if($title) echo $title; ?></p>
<?php endif; ?>
<?php if($display_time): ?><p id="time"><?php echo $lang['page_time']; ?></p><?php endif; ?>
<?php if(empty($hide_content)) echo $content; ?>
<?php /* this demonstrates the inclusion of news (delete if not required): */ ?>
<?php if(isset($include_news)): ?>
<?php foreach($include_news as $include_news_item): ?>
<p class="time"><?php echo $lang['include_news_time'][$include_news_item['id']]; ?></p>
<h3><?php if($include_news_item['link']): ?><a href="<?php echo $include_news_item['link']; ?>"><?php echo $include_news_item['title']; ?></a><?php else: ?><?php echo $include_news_item['title']; ?><?php endif; ?></h3>
<?php if($include_news_item['teaser']) : ?><p><?php echo $include_news_item['teaser']; ?></p><?php endif; ?>
<?php endforeach; ?>
<?php endif; ?>
<?php if(isset($subtemplate)) include(BASE_PATH.'templates/subtemplates/'.$subtemplate); ?>
</div>
</div>
</div>

<div id="bottomwrapper">
<div id="bottom">
<p class="left"><?php echo $settings['website_footnote_1']; ?></p>
<p class="right"><?php echo $settings['website_footnote_2']; ?></p>
</div>
<p class="powered"><?php echo $settings['website_footnote_3']; ?></p>
</div>


<?php /* this demonstrates how to implement global content blocks (delete if not required): */ ?>

<?php if($gcb_2 && isset($gcb[$gcb_2])) echo $gcb[$gcb_2]; ?>
<?php if($gcb_3 && isset($gcb[$gcb_3])) echo $gcb[$gcb_3]; ?>

<?php /* this demonstrates how to integrate a second menu/submenu (delete if not required): */ ?>
<?php if($menu_2 && isset($menus[$menu_2])): ?>
<ul>
<?php foreach($menus[$menu_2] as $item): ?><li><a href="<?php echo $item['link']; ?>" title="<?php echo $item['title']; ?>"<?php if($item['accesskey']!=''): ?> accesskey="<?php echo $item['accesskey']; ?>"<?php endif; ?><?php if(!empty($item['section']) && $item['section']==$section[1]): ?> id="current"<?php endif; ?>><?php echo $item['name']; ?></a></li><?php endforeach; ?>
</ul>
<?php endif; ?>

<?php if($sidebar_1): 
//loopcount: how many rounds to loop through
//ti: milliseconds for looping through the next image
?>
<script>
let slideIndex = 1;let tc=1;const loopcount=2;const ti=3600;timer=autoSlides();
</script>
<?php endif; ?>
</body>
</html>
