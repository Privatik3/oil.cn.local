<?php 
	echo $header; 
	echo $column_left;
?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save"><i class="fa fa-save"></i></button>
				<a class="btn btn-danger" href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"><i class="fa fa-reply"></i></a>
			</div>
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
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
			<?php echo $error_warning; ?>
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
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
			</div>
			<div class="panel-body">
				<?php if(!empty($module_id)) { ?>
				<div class="action pull-right">
					<a onclick="confirm('Are you sure?') ? location.href='<?php echo $delete; ?>' : false;" data-toggle="tooltip" title="" class="btn btn-danger btn-sm" data-original-title="Delete"><i class="fa fa-remove"> Delete</i></a>
				</div>
				<?php } ?>
				<ul class="nav nav-tabs" role="tablist">
					<?php if ($extensions) { ?>
					<?php foreach ($extensions as $extension) { ?>
					<?php $actived = (empty($module_id))?"class='active'":''; ?>
					<li <?php echo $actived; ?>><a href="<?php echo $extension['edit']; ?>" ><i class="fa fa-plus-circle"></i> <?php echo $extension['name']; ?></a></li>
					<?php $i=0; foreach ($extension['module'] as $m) { $i++;?>
					<?php $active = ($m['module_id'] == $module_id)?'class="active"':''; ?>
					<li <?php echo $active; ?>><a href="<?php echo $m['edit']; ?>" ><i class="fa fa-minus-circle"></i> <?php echo $m['name']; ?></a></li>
					<?php } //end modules?>
					<?php } //end extensions?>
					<?php } //end if?>
				</ul>
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">

					<div class="tab-pane">
						<table class="table noborder">
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_module_name; ?></td>
								<td class="col-sm-10"><input class="form-control nostyle" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_module_name; ?>"/></td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_title; ?></td>
								<td class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<div class="input-group nostyle">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"></span>
											<input class="form-control nostyle" name="title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title[$language['language_id']])?$title[$language['language_id']]:''; ?>"/>
										</div>	
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_mode; ?></td>
								<td class="col-sm-10">
									<select class="form-control nostyle" name="mode">
										<?php if ($mode == 'flybot') { ?>
										<option value="default" selected="selected">Default</option>
										<option value="flybot">Fly Outside</option>
										<?php } else { ?>
										<option value="default">Default</option>
										<option value="flybot" selected="selected">Fly Outside</option>
										<?php } ?>
									</select>
								</td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_width_height; ?></td>
								<td class="col-sm-10">
									<input class="form-control nostyle" type="text" name="image_width" value="<?php echo $image_width; ?>" /> x
									<input class="form-control nostyle" type="text" name="image_height" value="<?php echo $image_height; ?>"/>
								</td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_display; ?><br/><span class="help"><?php echo $help_entry_display; ?></span></td>
								<td class="col-sm-10"><input class="form-control nostyle" type="text" name="items" value="<?php echo $items; ?>" /></td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_status; ?></td>
								<td class="col-sm-10">
									<select class="form-control nostyle" name="status">
										<?php if ($status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</td>
							</tr>



						</table>
					</div>


				</form>
			</div>
		</div><!-- end div content form -->

		</div>
	</div><!-- End div#page-content -->

</div><!-- End div#content -->
<style type="text/css">
	.noborder tbody > tr > td {border: 1px solid #fff;}
	.nostyle { width: 36%; }
</style>
<?php echo $footer; ?>