<?php if(isset($errors)): ?>
<p class="caution"><?php echo $lang['error_headline']; ?></p>
<ul>
 <?php foreach($errors as $error): ?>
 <li><?php if(isset($lang[$error])) echo $lang[$error]; else echo $error; ?></li>
 <?php endforeach; ?>
</ul>
<?php endif; ?>
