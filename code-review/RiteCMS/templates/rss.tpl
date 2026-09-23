<?php echo '<?xml version="1.0" encoding="'.$lang['charset'].'" ?>'; ?>
<?php if(isset($wfw) && $wfw): ?>
<rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:wfw="http://wellformedweb.org/CommentAPI/">
<?php else: ?>
<rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/">
<?php endif; ?>
<channel>
<title><?php echo $title; ?></title>
<link><?php echo BASE_URL; ?></link>
<description><?php echo $description; ?></description>
<language><?php echo $lang['lang']; ?></language>
<?php if(isset($rss_items)): foreach($rss_items as $item): ?>
<item>
<title><?php echo $item['title'] ?></title>
<content:encoded><![CDATA[<?php if(isset($item['teaser_img'])): ?><img src="<?php echo BASE_URL.MEDIA_DIR.$item['teaser_img']; ?>" alt="<?php echo $item['title']; ?>" width="<?php echo $item['teaser_img_width']; ?>" height="<?php echo $item['teaser_img_height']; ?>" /><?php endif; ?><?php echo $item['content'] ?>]]></content:encoded>
<link><?php echo $item['link'] ?></link>
<pubDate><?php echo $item['pubdate'] ?></pubDate>
<?php if(isset($item['category']) && $item['category']): ?>
<category><?php echo $item['category']; ?></category>
<?php endif; ?>
<?php if(isset($item['commentrss'])): ?>
<wfw:commentRss><?php echo $item['commentrss'] ?></wfw:commentRss>
<?php endif; ?>
</item>
<?php endforeach; endif; ?>
</channel>
</rss>
