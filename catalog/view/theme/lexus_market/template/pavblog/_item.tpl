<div class="blog-item">
<div class="row">
		<?php if( $blog['thumb'] && $cat_show_image )  { ?>
			<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
				<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>">
			</div>
		<?php } ?>

	<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
	<?php if( $cat_show_title ) { ?>
		<div class="blog-header">
		<h3 class="blog-title">	<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h3>
		</div>
	<?php } ?>
	<div class="blog-meta">
		<ul>
		<?php if( $cat_show_created ) { ?>
		<li class="created">
			<span class="fa fa-clock-o">   <?php echo $objlang->get("text_created");?> :</span>
			<?php echo date("d-M-Y",strtotime($blog['created']));?>
		</li>
		<?php } ?>
		<?php if( $cat_show_author ) { ?>
		<li class="author"><span class="fa fa-pencil">   <?php echo $objlang->get("text_write_by");?></span> <?php echo $blog['author'];?></li>
		<?php } ?>
		<?php if( $cat_show_category ) { ?>
		<li class="publishin">
			<span class="fa fa-user">   <?php echo $objlang->get("text_published_in");?></span>
			<a href="<?php echo $blog['category_link'];?>" title="<?php echo $blog['category_title'];?>"><?php echo $blog['category_title'];?></a>
		</li>
		<?php } ?>
		
			<?php if( $blog_show_hits ) { ?>
		<li class="hits"><span class="fa fa-eye-open">   <?php echo $objlang->get("text_hits");?></span> <?php echo $blog['hits'];?></li>
		<?php } ?>
			<?php if( $blog_show_comment_counter ) { ?>
		<li class="comment_count"><span class="fa fa-comments">   <?php echo $objlang->get("text_comment_count");?></span> <?php echo $blog['comment_count'];?></li>
		<?php } ?>
		</ul>
	</div>
	
		<?php if( $cat_show_description ) {?>
		<div class="description">
			<?php echo $blog['description'];?>
		</div>
		<?php } ?>
		<?php if( $cat_show_readmore ) { ?>
		<div class="blog-readmore"><a href="<?php echo $blog['link'];?>" class="button btn btn-default"><?php echo $objlang->get('text_readmore');?></a></div>
		<?php } ?>
	</div>	
</div>
</div>