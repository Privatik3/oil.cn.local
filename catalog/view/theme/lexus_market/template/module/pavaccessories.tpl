<?php 
/******************************************************
 * @package Pav categories Accessores for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/?>
<?php

	$span = 12/$cols; 
	$id = rand(1,9)+rand();	
	//echo "<pre>"; print_r(array_chunk( $categories, $itemsperpage)); die;
	$objlang = $this->registry->get('language');

?>
<div class="box box-categories-accessoires <?php echo $module_class; ?>">
	<div class="box-heading">
		<?php if($show_title) {?>
		<span><?php echo $module_title;?></span>
		<?php } ?>
	</div>
	<div class="box-items slide" id="box-accessoires-<?php echo $id;?>">
		<?php if( count($categories) > $itemsperpage ) { ?>
		<div class="carousel-controls">
			<a class="carousel-control left" href="#box-accessoires-<?php echo$id;?>"   data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#box-accessoires-<?php echo $id;?>"  data-slide="next">&rsaquo;</a>
		</div>
		<?php } ?>
		<div class="carousel-inner ">
			<?php $pages = array_chunk( $categories, $itemsperpage); ?>
			<?php foreach ($pages as  $k => $tcategories ) { ?>
			<div class="item <?php if($k==0) {?>active<?php } ?>">
				<?php foreach( $tcategories as $i => $category ) {  $i=$i+1;?>
				<?php if( $i%$cols == 1 ) { ?>
				<div class="row">
				<?php } ?>
					<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-12">
						<div class="accessories-wrapper">
						<div class="pull-left">
							<?php if (!empty($category['parent']['image'])): ?>
								<div><img alt="img" src="<?php echo $model_tool_image->resize($category['parent']['image'], 160, 222, "w"); ?>"/></div>
							<?php endif ?>
						</div>
						<div class="">
							<div class="box-heading"><a href="<?php echo $category['parent']['href']; ?>"><?php echo $category['parent']['name']; ?></a></div>
							<div class="haschild">
								<ul>
								<?php $j = 0; foreach ($category['haschild'] as $item):$j++;?>
											<li><a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?><i class="fa fa-square"></i></a></li>
								<?php if($j == $numbersubcat) break; endforeach ?>
								</ul>
								<?php if (count($category['haschild']) > 5 ): ?>
								<a href="<?php echo $category['parent']['href']; ?>"><?php echo $objlang->get('view_all'); ?></a>
								<?php endif ?>
							</div>
						</div>
						
						</div>
					</div>
				<?php if( $i%$cols == 0 || $i==count($tcategories) ) { ?>
				</div>
				<?php } ?>
				<?php } //end foreach?>
			</div>
			<?php } //end foreach?>
			
		</div>
	</div>
	
</div>