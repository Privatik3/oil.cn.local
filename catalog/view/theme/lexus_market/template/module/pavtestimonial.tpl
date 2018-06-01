<?php 
$objlang = $this->registry->get('language');
?>
<?php if( count($testimonials) ) { ?>
	<?php $id = rand(1,10)+rand();?>
   <div id="pavtestimonial<?php echo $id;?>" class="carousel slide pavtestimonial">
		<div class="box">
			<div class="box-heading"><span class="headding-title"><?php echo $objlang->get('text_testimonial');?></span></div>
		</div>
		<?php if( count($testimonials) > 1 ){ ?>
		<div class="carousel-controls">		
			<a class="carousel-control left" href="#pavtestimonial<?php echo $id;?>" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#pavtestimonial<?php echo $id;?>" data-slide="next">&rsaquo;</a>
		</div>
		<?php } ?>		
		<div class="carousel-inner">
			 <?php foreach ($testimonials as $i => $testimonial) {  ?>
				<div class="item <?php if($i==0) {?>active<?php } ?>">
	 				<div class="testimonial-item">
						<?php if(  $testimonial['description'] ) { ?>
						<div class="testimonial">
							<div><?php echo $testimonial['description']; ?></div>
						</div>
						<?php } ?>
						<div class="profile">
							<div>
								<img  alt="<?php echo strip_tags($testimonial['profile']); ?>" src="<?php echo $testimonial['thumb']; ?>" class="img-circle"/>
								<?php if(  $testimonial['profile'] ) { ?>
							
								<?php echo $testimonial['profile']; ?>
						
								<?php } ?>
								<?php if( $testimonial['video_link']) { ?>
								<a class="colorbox-t" href="<?php echo $testimonial['video_link'];?>"><?php echo $this->language->get('text_watch_video_testimonial');?></a>
								<?php } ?>
							</div>
						</div>
					</div>
				</div>
			<?php } ?>
		</div>
	 		

    </div>
	<?php if( count($testimonials) > 1 ){ ?>
	<script type="text/javascript">
	<!--
		$('#pavtestimonial<?php echo $id;?>').carousel({interval:<?php echo ( $auto_play_mode?$interval:'false') ;?>,auto:<?php echo $auto_play;?>,pause:'hover'});
	-->
	</script>
	<?php } ?>
<?php } ?>
