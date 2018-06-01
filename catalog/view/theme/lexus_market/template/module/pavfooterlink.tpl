<?php if($status) { ?>
	<div class="box">
		<div class="box-heading">
			<span>
				<?php echo $text_title; ?>
			</span>
		</div>
	</div>
	<?php if($group==99) { ?>
	<ul class="list">
		<?php foreach ($links as $link) { ?>
		<li><i class="<?php echo $link['icon']; ?>">&nbsp;</i><a href="<?php echo $link['href']; ?>"> <?php echo $link['title']; ?></a></li>
		<?php } ?>
	</ul>
	<?php } else { // contact footer?>
	<ul class="list">
		<?php foreach ($links as $link) { ?>
		<li><a href="<?php echo $link['href']; ?>"><?php echo $link['title']; ?></a></li>
		<?php } ?>
	</ul>
	<?php } ?>
<?php } ?>