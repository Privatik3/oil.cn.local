<?php 


	$objlang = $this->registry->get('language');
	$ourl = $this->registry->get('url'); 
	
	$model_catalog_product = $this->registry->get("model_catalog_product");
	$product_images = $model_catalog_product->getProductImages( $product['product_id'] );

	$model_tool_image = $this->registry->get("model_tool_image");

	$config = $this->registry->get("config");

?>
<div class="product-block item-default">
<!-- Start thumb img-->
	<?php if (!empty($product_images)): ?>
	<div class="thumb_more_info" data-rel="<?php echo $product['product_id'];?>">
		<div class="view_block">
			<div class="thumbs_list thumbs_list_<?php echo $product['product_id'];?>">
				<ul class="thumbs_list_frame">
					<li class="first">
						<a href="javascript:void(0);">
							<img alt="" src="<?php echo $product['thumb']; ?>" width="73" height="35" data-rel="<?php echo $product['thumb'];?>" class="pav-hover-image"/>
						</a>
					</li>
					<?php foreach ($product_images as $item):?>
					
					<li>
						<a href="javascript:void(0);">
							<?php if(isset($type_product) && ($type_product == 'special')) {?>
							<img alt="" src="<?php echo $model_tool_image->resize($item['image'], 75, 35); ?>" data-rel="<?php echo $model_tool_image->resize($item['image'], $width, $height); ?>" class="pav-hover-image"/>
							<?php } else { ?>
							<img alt="" src="<?php echo $model_tool_image->resize($item['image'], 75, 35); ?>" data-rel="<?php echo $model_tool_image->resize($item['image'], $config->get('config_image_product_width'), $config->get('config_image_product_height')); ?>" class="pav-hover-image"/>
							<?php } ?>
						</a>
					</li>
					<?php endforeach ?>
				</ul>
			</div>
		</div>

		<?php  if(count($product_images) > 3):?>
		<a class="view_scroll_left view_scroll_left_<?php echo $product['product_id'];?>" data-rel="<?php echo $product['product_id'];?>" href="javascript:void(0);"><em class="fa fa-chevron-up"></em></a>
		<a class="view_scroll_right view_scroll_right_<?php echo $product['product_id'];?>" data-rel="<?php echo $product['product_id'];?>" href="javascript:void(0);"><em class="fa fa-chevron-down"></em></a>
		<?php endif; ?>
	</div>
	<?php endif ?>
	<!-- End thumb img-->
	<?php if ($product['thumb']) {    ?>
	<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
	<div class="image">
  	<?php if( $product['special'] ) {   ?>
	<span class="product-label-special"><span><?php echo $objlang->get( 'text_sale' ); ?></span></span>
	<?php } ?>
		<a class="product_image" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
	</div>
	<?php } ?>
	
	<div class="product-meta">
		<div class="product-price">
			<?php if ($product['price']) { ?>
			<div class="price">
				<?php if (!$product['special']) {  ?>
					<span class="special-price"><?php echo $product['price']; ?></span>
					<?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
					<?php } ?>
				<?php } else { ?>
					<span class="price-new"><?php echo $product['special']; ?></span>
					<span class="price-old"><?php echo $product['price']; ?></span> 
					<?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
					<?php } ?>
				<?php } ?>
			</div>
			<?php } ?>
		 	  <?php if ( isset( $product['rating']) ) { ?>
	          <div class="rating">
	            <?php for ($is = 1; $is <= 5; $is++) { ?>
	            <?php if ($product['rating'] < $is) { ?>
	            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
	            <?php } else { ?>
	            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
	            <?php } ?>
	            <?php } ?>
	          </div>
	          <?php } ?>
		</div>
			
		<div class="product-detail">
			<?php if( isset($product['description']) ){ ?> 
			<div class="description"><?php echo utf8_substr( strip_tags($product['description']),0,58);?>...</div>
			<?php } ?>
			<div class="product-hover">
				<div class="addcart">
					<a onclick="cart.addcart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span><i class="fa fa-plus-circle"></i></a>
				</div>
				<div class="box-button">
					<div class="wishlist"><a data-tooltip="<?php echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.addwishlist('<?php echo $product['product_id']; ?>');"><span><?php echo $objlang->get("button_wishlist"); ?></span><i class="fa fa-heart"></i></a></div>
					<div class="compare"><a data-tooltip="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.addcompare('<?php echo $product['product_id']; ?>');"><span><?php echo $objlang->get("button_compare"); ?></span><i class="fa fa-refresh"></i></a></div>
					<?php if ($quickview) { ?>
					<div class="quick-view"><a data-tooltip="<?php echo $objlang->get('quick_view'); ?>" class="pav-colorbox iframe-link cboxElement" href="index.php?route=themecontrol/product&amp;product_id=<?php echo $product['product_id']; ?>">
					<span><?php echo $objlang->get('quick_view'); ?></span><i class="fa fa-eye"></i></a></div>						
					<?php } ?>
				</div>
			</div>	
		</div>			
	</div>

</div>





