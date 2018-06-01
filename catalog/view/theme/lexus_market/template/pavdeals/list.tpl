<?php
	$span = floor(12/$cols);
	$olang = $this->registry->get('language'); 

	$config = $this->registry->get('config');
	$themeConfig = (array)$config->get('themecontrol');
	$theme = $config->get('config_template');

	$listingConfig = array(
		'quickview'                          => 1,
		'product_layout'					 => 'default',
	);
	$listingConfig     = array_merge($listingConfig, $themeConfig );
	$quickview          = $listingConfig['quickview'];

	if( isset($_COOKIE[$theme.'_productlayout']) && $listingConfig['enable_paneltool'] && $_COOKIE[$theme.'_productlayout'] ){
		$listingConfig['product_layout'] = trim($_COOKIE[$theme.'_productlayout']);
	}
	
	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'default';
	}
?>
<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row"><?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
		<div id="content" class="<?php echo $class; ?> box productdeals"><?php echo $content_top; ?>
			<h3 class="hidden"><?php echo $objlang->get('deal_option'); ?></h3>
			<!-- Deal Option -->
			<div class="">
				<ul class="box-heading nav nav-tabs">
					<?php foreach ($head_titles as $item): ?>
					<?php if ($item['active']): ?>
					<li class="active"><a href="<?php echo $item['href'];?>"><?php echo $item['text'];?></a></li>
					<?php else: ?>
					<li><a href="<?php echo $item['href'];?>"><?php echo $item['text'];?></a></li>
					<?php endif; ?>
					<?php endforeach; ?>
				</ul>
			</div>

			<!-- Fillter Product -->
			<?php if (count($products) > 0): ?>
			<div class="product-filter clearfix">
				<div class="display">
					<span><?php echo $olang->get('text_display'); ?></span>
					<div class="btn-group">
						<button type="button" id="list-view" class="btn btn-switch fa fa-th-list" data-toggle="tooltip" title="<?php echo $objlang->get("button_list"); ?>"></button>
						<button type="button" id="grid-view" class="btn btn-switch fa fa-th-large" data-toggle="tooltip" title="<?php echo $objlang->get("button_grid"); ?>"></button>
					</div>
				</div>

				<div class="sort">
					<label class="control-label" for="input-sort"><?php echo $objlang->get('text_sort'); ?></label>
					<select id="input-sort" onchange="location = this.value;">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>

				

				<div class="limit">
					<label class="control-label" for="input-limit"><?php echo $objlang->get('text_limit'); ?></label>
					<select id="input-limit" onchange="location = this.value;">
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				<!--end limit-->
				<div class="category">
					<label class="control-label" for="input-category"><?php echo $objlang->get('text_category'); ?></label>
					<select id="input-category"  name="category_id" onchange="location = this.value;">
						<option value="<?php echo $href_default;?>"><?php echo $objlang->get("text_category_all"); ?></option>
						<?php foreach ($categories as $category_1) { ?>
						<?php if ($category_1['category_id'] == $category_id) { ?>
						<option value="<?php echo $category_1['href']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></option>
						<?php } ?>
						<?php foreach ($category_1['children'] as $category_2) { ?>
						<?php if ($category_2['child_id'] == $category_id) { ?>
						<option value="<?php echo $category_2['href']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_2['href']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
						<?php } ?>

						<?php if (isset($category_2['children'])) { ?>
						<?php foreach ($category_2['children'] as $category_3) { ?>
						<?php if ($category_3['child_id'] == $category_id) { ?>
						<option value="<?php echo $category_3['href']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_3['href']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } ?>
						<?php } //endforeach categories_2?>
						<?php } //endif endforeach categories_2?>

						<?php } //endforeach categories_1?>
						<?php } //endforeach categories_0?>
					</select>
				</div>
				<!--end category-->
			</div>
			<?php endif; ?>

			<!-- List Product -->
			<?php if (count($products) > 0): ?>
			<div class="box productdeals">
				<div class="box-content" >
					<div class="">
						<?php foreach( $products as $i => $product ):  $i=$i+1;?>
						<?php if( $i%$cols == 1 || $cols == 1): ?><div class="row box-product"><?php endif; ?>

							<div class="product-cols product-layout  col-sm-<?php echo $span;?> col-xs-12">
								<?php require( $productLayout );  ?>								
							</div>

						<?php if($i%$cols == 0): ?>
						</div>
						<?php endif; ?>
						<?php endforeach; ?>
					</div><!--end product-grid-->

				</div><!--end box-content-->


			</div><!-- end div content list product -->

			<!-- pagination -->
			<div class="paging clearfix">
				<div class="pull-left"><?php echo $pagination; ?></div>
				<div class="pull-right"><?php echo $results; ?></div>
			</div>
			<?php endif; ?>

			<div class="row">
				<?php if (empty($products)): ?>
				<div class="col-sm-6 text-left"><?php echo $objlang->get('text_not_empty');?></div>
				<div class="col-sm-6 text-right">
					<div class="buttons">
						<div class="pull-right"><a href="<?php echo $objurl->link('common/home'); ?>" class="btn btn-primary"><?php echo $objlang->get('button_continue'); ?></a></div>
					</div>
				</div>
				<?php endif; ?>
			</div>

			<?php echo $content_bottom; ?>
		</div><!-- end div #content -->
		<?php echo $column_right; ?>
	</div><!-- end div .row -->
</div></div><!-- end div .container -->
<?php echo $footer; ?>
