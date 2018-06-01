<?php if ( $mode =="flybot") { $id='recently-viewed'.rand();?>
<?php if (count($products) > 0) { ?>
<div class="box  pavrecentlyviewed" id="<?php echo $id; ?>">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
			<div class="box-product product-block ">
      <?php foreach ($products as $product) { ?>
      <div class="product-item">
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="product-detail">
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <div class="cart hidden"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
        </div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
<?php } ?>
<script type="text/javascript">
  $(document).ready( function(){ 
    $("#<?php echo $id;?>").appendTo( 'body' ).removeClass('hide');
  });
</script>
<?php } ?>