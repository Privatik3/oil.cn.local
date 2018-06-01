<?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>

<div class="product-block item-default">
	<?php if ($product['thumb']) {    ?>
	<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
	<div class="image">
  	<?php if( $product['special'] ) {   ?>
	<span class="product-label-special"><span><?php echo $objlang->get( 'text_sale' ); ?></span></span>
	<?php } ?>
		<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
	</div>
	<?php } ?>
	
	<div class="product-meta">
		<div class="product-price">
			<?php if ($product['price']) { ?>
			<div class="price">
				<?php if (!$product['special']) {  ?>
					<span class="special-price"><?php echo $product['price']; ?></span>
				<?php } else { ?>
					<span class="price-new"><?php echo $product['special']; ?></span>
					<span class="price-old"><?php echo $product['price']; ?></span> 
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
				<?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
				<div class="addcart">
					<a onclick="cart.addcart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span><i class="fa fa-plus-circle"></i></a>
				</div>
				<?php } ?>
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





