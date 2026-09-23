<form action="<?php echo BASE_URL.PAGE; ?>" method="post">
<p><input type="text" name="q" value="<?php if(isset($q)) echo $q; ?>" size="30" maxlength="200" /> <input type="submit" name="" value="<?php echo $lang['search_submit']; ?>" /></p>
</form>

<?php if(isset($results)): ?>
<p><strong><?php echo $lang['search_number_of_results']; ?></strong>

<ul id="search">
<?php foreach($results as $result): ?>
<li><a href="<?php echo BASE_URL.$result['page']; ?>"><?php echo $result['title']; ?></a><?php if($result['type']==1): ?> <span class="smallx">- <?php echo $lang['search_photo']; ?></span><?php endif; ?><?php if($result['description']): ?> <span class="smallx">- <?php echo $result['description']; ?></span><?php endif; ?></li>
<?php endforeach; ?>
</ul>

<?php if($pagination): ?>
<!--<p><?php echo $lang['pagination']; ?>-->
<ul class="pagination">
<?php if($pagination['previous']): ?><li><a href="<?php echo BASE_URL . PAGE; ?>,,<?php echo $q_encoded; if($pagination['previous']>1): ?>,<?php echo $pagination['previous']; endif; ?>">&laquo;</a></li><?php endif; ?>
<?php foreach($pagination['items'] as $item): ?>
<?php if(empty($item)): ?><li>..</li><?php elseif($item==$pagination['current']): ?><li><span class="current"><?php echo $item; ?></span></li><?php else: ?><li><a href="<?php echo BASE_URL . PAGE; ?>,,<?php echo $q_encoded; if($item>1): ?>,<?php echo $item; endif; ?>"><?php echo $item; ?></a></li><?php endif; ?>
<?php endforeach; ?>
<?php if($pagination['next']): ?><li><a href="<?php echo BASE_URL . PAGE; ?>,,<?php echo $q_encoded; ?>,<?php echo $pagination['next']; ?>">&raquo;</a></li><?php endif; ?>
</ul>
<?php endif; ?>

<?php endif; ?>

<?php if(isset($q) && empty($results)): ?>
<p><em><?php echo $lang['search_no_results']; ?></em></p>
<?php endif; ?>
