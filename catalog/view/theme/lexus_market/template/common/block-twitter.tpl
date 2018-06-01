<?php
$sconfig = $this->registry->get('config');
$language_code = $sconfig->get('config_language');
$config  = $sconfig->get('themecontrol');

$default = array(

	't_widgetid'  => "366766896986591232",
	't_username'  => "pavothemes",
	't_name'      => "000000",
	't_title'     => "000000",
	't_link'      => "000000",
	't_border'    => "000000",
	
);
$config = array_merge($default, $config);


$modules = array();
if( isset($layoutID) && $layoutID ){
	$modules = $helper->getCloneModulesInLayout( $blockid, $layoutID ); 
}else {
	$modules = $helper->getModulesByPosition( $blockid ); 
}
if(!empty($modules)) {
?>
<div class="<?php echo str_replace('_','-',$blockid); ?> <?php $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>">
	<div class="container">
		<div class="inner">
		<div class="row">
			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"><?php echo isset($modules[0])?$modules[0]:''; ?> </div>

				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"><?php echo isset($modules[1])?$modules[1]:''; ?> </div>
				
			</div>
		</div>
	</div>

</div>
<script type="text/javascript">
// Customize twitter feed
var hideTwitterAttempts = 0;
function hideTwitterBoxElements() {
	setTimeout( function() {
		if ( $('[id*=pav-twitter]').length ) {
			$('#pav-twitter iframe').each( function(){
				var ibody = $(this).contents().find( 'body' );
				if ( ibody.find( '.timeline .stream .h-feed li.tweet' ).length ) {
					ibody.find( '.header .p-nickname' ).css( 'color', '<?php echo $config["t_name"]; ?>' );
					ibody.find( '.p-name' ).css( 'color', '<?php echo $config["t_name"]; ?>' );
					ibody.find( '.e-entry-title' ).css( 'color', '<?php echo $config["t_title"]; ?>' );
				} else {
					$(this).hide();
				}
			});
		}
		hideTwitterAttempts++;
		if ( hideTwitterAttempts < 3 ) {
			hideTwitterBoxElements();
		}
	}, 1500);
}
// somewhere in your code after html page load
hideTwitterBoxElements();
</script>
<?php } ?>