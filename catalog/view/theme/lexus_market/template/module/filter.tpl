<div class="box">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
    <div class="box-products">
      <div class="list-group box-filter">
        <?php foreach ($filter_groups as $filter_group) { ?>
        <span><?php echo $filter_group['name']; ?></span>
          <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
            <?php foreach ($filter_group['filter'] as $filter) { ?>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <label class="checkbox">
              <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
              <?php echo $filter['name']; ?></label>
            <?php } else { ?>
            <label class="checkbox">
              <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" />
              <?php echo $filter['name']; ?></label>
            <?php } ?>
            <?php } ?>
          </div>
        <?php } ?>
        <a id="button-filter" class="button"><?php echo $button_filter; ?></a>
      </div>
     
    </div>  
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];
	
	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
