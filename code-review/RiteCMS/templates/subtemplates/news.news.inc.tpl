<?php if($news): ?>
<?php foreach($news as $item): ?>
<div class="news">
<?php if(isset($item['teaser_img'])): ?>
<a href="<?php echo BASE_URL.$item['page']; ?>"><img class="float-left" src="<?php echo BASE_URL.MEDIA_DIR.$item['teaser_img']; ?>" alt="<?php echo $item['teaser_headline']; ?>" width="<?php echo $item['teaser_img_width']; ?>" height="<?php echo $item['teaser_img_height']; ?>" /></a>
<?php endif; ?>
<h2><a href="<?php echo BASE_URL.$item['page']; ?>"><?php echo $item['teaser_headline']; ?></a><?php if($item['category'] && empty($current_category)): ?> <span class="category">(<a href="<?php echo BASE_URL.PAGE.','.CATEGORY_IDENTIFIER.$item['category_urlencoded']; ?>"><?php echo $item['category']; ?></a>)</span><?php endif; ?></h2>
<p class="time"><?php echo $lang['news_time'][$item['id']]; ?></p>
<?php if(isset($item['teaser'])) echo $item['teaser']; ?>
<?php if($item['more'] || isset($item['comments']) && $item['comments']>0): ?>
<p class="link"><?php if(isset($item['comments']) && $item['comments']>0): ?><a href="<?php echo BASE_URL.$item['page']; ?>#comments" class="comments">(<?php echo $lang['number_of_comments'][$item['id']]; ?>)</a><?php endif; ?></p>
<?php endif; ?>
</div>
<?php endforeach; ?>

<?php if($pagination): ?>
<!--<p><?php echo $lang['pagination']; ?></p>-->
<ul class="pagination">
<?php if($pagination['previous']): ?><li><a href="<?php echo BASE_URL . PAGE; if($pagination['previous']>1||$current_category): ?>,<?php if($current_category) echo CATEGORY_IDENTIFIER.$current_category_urlencoded; ?><?php if($pagination['previous']>1): ?>,<?php echo $pagination['previous']; endif; endif; ?>">&laquo;</a><?php endif; ?></li><?php foreach($pagination['items'] as $item): ?><?php if(empty($item)): ?><li>..</li><?php elseif($item==$pagination['current']): ?><li><span class="current"><?php echo $item; ?></span></li><?php else: ?><li><a href="<?php echo BASE_URL . PAGE; if($item>1||$current_category): ?>,<?php if($current_category) echo CATEGORY_IDENTIFIER.$current_category_urlencoded; ?><?php if($item>1): ?>,<?php echo $item; endif; endif; ?>"><?php echo $item; ?></a><?php endif; ?></li><?php endforeach; ?><?php if($pagination['next']): ?><li><a href="<?php echo BASE_URL . PAGE; ?>,<?php if($current_category) echo CATEGORY_IDENTIFIER.$current_category_urlencoded; ?><?php if($pagination['next']>1): ?>,<?php echo $pagination['next']; ?><?php endif; ?>">&raquo;</a><?php endif; ?></li>
</ul>
<?php endif; ?>

<?php else: ?>

<?php endif; ?>
