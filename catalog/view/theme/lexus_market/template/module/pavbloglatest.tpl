<?php 
	$span = 12/$cols;
?>

<?php if( !empty($blogs) ) { ?>
<div class="box pavblog-latest">
	<div class="box-heading arrow"><span class="headding-title"><?php echo $heading_title; ?></span></div>
	<div class="box-content" >
		<div id="blog-carousel" class="box-products slide" data-ride="carousel">
		  <!-- Wrapper for slides -->
			<div class="carousel-controls">
						<a class="carousel-control left" href="#blog-carousel"   data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#blog-carousel"  data-slide="next">&rsaquo;</a>
			</div>

			<div class="carousel-inner">
			  <?php $i=0; foreach( $blogs as $blog ) { $i=$i+1;?>
					<div class="item <?php echo ($i==1)?'active':''?>">
						<div class="blog-item col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-12">
							<div class="blog-header pull-left">
								<?php if( $blog['thumb']  )  { ?>
								<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
								<?php } ?>
							</div>
							<div class="blog-body">
								<h4 class="blog-title">
									<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
								</h4>								
								<div class="description">
										<?php $blog['description'] = strip_tags($blog['description']); ?>
										<?php echo utf8_substr( $blog['description'],0, 200 );?>...
								</div>
								<a href="<?php echo $blog['link'];?>" class="readmore"><?php echo $objlang->get('text_readmore');?></a>
							</div>	
						</div>
					</div>
			  <?php } ?>  
			</div>
			
		</div>
	</div>
 </div>
<?php } ?>

<script type="text/javascript"><!--
 $('#blog-carousel').carousel({interval:false});
--></script>