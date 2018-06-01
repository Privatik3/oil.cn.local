<?php
/******************************************************
 * @package:   Pav Accessories module for Opencart 2.0.x
 * @version:   2.0
 * @author:    http://www.pavothemes.com
 * @copyright: Copyright (C) Feb 2014 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @License :  GNU General Public License version 2
*******************************************************/
echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-pavaccessories" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a class="btn btn-success" data-toggle="tooltip" title="<?php echo $button_save_stay; ?>" onclick="$('#action').val('save_stay');$('#form').submit();"><?php echo $button_save_stay; ?></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div><!-- End div#page-header -->
  <div id="page-content" class="container-fluid">
    <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
  <?php if (isset($success) && !empty($success)) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $subheading; ?></h3>
      </div>
      <div class="panel-body">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
				<input type="hidden" name="pavaccessories_module[action]" id="action" value=""/>
             <!-- Nav tabs -->
                <div class="row">
                  <ul class="nav nav-tabs" role="tablist">
                    <li <?php if( $selectedid ==0 ) { ?>class="active" <?php } ?>> <a href="<?php echo $link; ?>"> <span class="fa fa-plus"></span> <?php echo $olang->get('button_module_add');?></a></li>
                    <?php $i=1; foreach( $moduletabs as $key => $module ){ ?>
                    <li role="presentation" <?php if( $module['module_id']==$selectedid ) {?>class="active"<?php } ?>>
                      <a href="<?php echo $link; ?>&module_id=<?php echo $module['module_id']?>" aria-controls="bannermodule-<?php echo $key; ?>"  >
                        <span class="fa fa-pencil"></span> <?php echo $module['name']?>
                       </a>
                      </li>
                    <?php $i++ ;} ?>
                  </ul>
                </div>
                <!-- Tab panes -->
				<div class="row">
					<div class="col-sm-12">
						<div class="tab-content">
							<?php $module_row = 1; ?>
							<?php foreach ($modules as $module) { ?>
								<?php if( $selectedid ){ ?>
				               		<div class="pull-right">
				                      <a href="<?php echo $action;?>&delete=1" class="remove btn btn-danger" ><span><i class="fa fa-remove"></i> Delete This</span></a>
				                    </div>
			                    <?php } ?>
				               <div  id="tab-module<?php echo $module_row; ?>">
									<table class="table table-bordered">
										<tr>
						                  <td class="col-sm-2"><?php echo $objlang->get('entry_name'); ?></td>
						                  <td class="col-sm-10"><input class="form-control" style="width:55%;" name="pavaccessories_module[<?php echo $module_row; ?>][name]" value="<?php echo isset($module['name'])?$module['name']:''; ?>"/></td>
						                </tr>
						                <tr>
						                    <td class="col-sm-2"><?php echo $objlang->get('entry_status'); ?></td>
						                    <td class="col-sm-10"><select name="pavaccessories_module[<?php echo $module_row; ?>][status]" class="form-control" style="width:15%;">
						                      <?php if ( isset($module['status']) && $module['status'] ) { ?>
						                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						                      <option value="0"><?php echo $text_disabled; ?></option>
						                      <?php } else { ?>
						                      <option value="1"><?php echo $text_enabled; ?></option>
						                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						                      <?php } ?>
						                    </select></td>
						                  </tr>
										<tr>
											<td class="col-sm-2 control-label"><?php echo $entry_module_title; ?></td>
												<td class="col-sm-10">
												<ul class="nav nav-tabs" id="language<?php echo $module_row; ?>">
								                    <?php foreach ($languages as $language) { ?>
								                    <li><a href="#tab-module<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								                    <?php } ?>
							                	</ul>
							                	<div class="tab-content">
													<?php foreach ($languages as $language) { ?>
														<div class="tab-pane" id="tab-module<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>">
														<input name="pavaccessories_module[<?php echo $module_row; ?>][module_title][<?php echo $language['language_id']; ?>]" id="module_title-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" value="<?php echo isset($module['module_title'][$language['language_id']]) ? $module['module_title'][$language['language_id']] : ''; ?>" class="form-control" style="width:55%;">
														</div>
													<?php } ?>
												</div>
											</td>
										</tr>
										<tr>
											<td class="col-sm-2"><?php echo $objlang->get('entry_show_title'); ?></td>
											<td class="col-sm-10">
												<select name="pavaccessories_module[<?php echo $module_row; ?>][show_title]" class="form-control" style="width:15%;">
													<option value="1"><?php echo $objlang->get('text_enabled'); ?></option>
													<option value="0"><?php echo $objlang->get('text_disabled'); ?></option>
												</select>
											</td>
										</tr>

										<tr>
							                <td class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></td>
							                <td class="col-sm-10">
							                  <input type="text" name="category-<?php echo $module_row;?>" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control"/>
							                  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
							                    <?php if (isset($module['categories_tmp'])): ?>
							                    <?php foreach ($module['categories_tmp'] as $category) { ?>
							                    <div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
							                      <input type="hidden" name="pavaccessories_module[<?php echo $module_row; ?>][categories][]" value="<?php echo $category['category_id']; ?>" />
							                    </div>
							                    <?php } ?>
							                    <?php endif; ?>
							                  </div>
							                </td>
							             </tr>

										<tr>
											 <td class="col-sm-2 control-label" for="input-item<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_item; ?></td>
											<td class="col-sm-10">
												<input type="text" name="pavaccessories_module[<?php echo $module_row; ?>][itemsperpage]" value="<?php echo isset($module['itemsperpage'])?$module['itemsperpage']:'6'; ?>" class="form-control" style="width:15%;" /> -
												<input type="text" name="pavaccessories_module[<?php echo $module_row; ?>][cols]" value="<?php echo isset($module['cols'])?$module['cols']:'3'; ?>" class="form-control" style="width:15%;"/> -
												<input type="text" name="pavaccessories_module[<?php echo $module_row; ?>][limit]" value="<?php echo isset($module['limit'])?$module['limit']:'12'; ?>" class="form-control" style="width:15%;"/>
											</td>
										</tr>

										<tr>
											<td class="col-sm-2 control-label" for="input-number-cat<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_number_category; ?></td>
											<td class="col-sm-10">
												<input type="text" name="pavaccessories_module[<?php echo $module_row; ?>][numbersubcat]" value="<?php echo isset($module['numbersubcat'])?$module['numbersubcat']:'5'; ?>" class="form-control" style="width:15%;" />
											</td>
										</tr>
										<tr>
											<td class="col-sm-2 control-label" for="input-module-class<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_module_class; ?></td>
											<td class="col-sm-10"><input type="text" name="pavaccessories_module[<?php echo $module_row; ?>][module_class]" value="prefixclass" class="form-control" style="width:55%;" /></td>

										</tr>
									</table>
								</div>	
							</div>
				<?php $module_row++; ?>
				<?php } ?>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
	autoComplete(<?php echo $module_row; ?>);
<?php $module_row++; ?>
<?php } ?>

function autoComplete(id) {
	$('input[name=\'category-' + id + '\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['category_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'category-' + id + '\']').val('');

			$('#product-category' + item['value']).remove();

			$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="pavaccessories_module['+ id +'][categories][]" value="' + item['value'] + '" /></div>');
		}
	});

	$('#product-category').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
}
//--></script>

<script type="text/javascript"><!--
	$('#module li:first-child a').tab('show');
	<?php $module_row = 1; ?> 
	<?php foreach ($modules as $module) { ?>
		$('#language<?php echo $module_row; ?> li:first-child a').tab('show');
		<?php $module_row++; ?>
	<?php } ?>
//--></script></div>

<?php echo $footer; ?>
