<?php 
  /*
  * @package Framework for Opencart 2.0
  * @version 2.0
  * @author http://www.pavothemes.com
  * @copyright Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
  * @license   GNU General Public License version 2
  */
  require_once(DIR_SYSTEM . 'pavothemes/loader.php');
  $config = $this->registry->get('config'); 
  $helper = ThemeControlHelper::getInstance( $this->registry, $config->get('config_template') );
?>
 <?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>
<!-- 
  $ospans: allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 -->

<?php if( !($helper->getConfig('enable_pagebuilder') && $helper->isHomepage())  ){ ?>

<?php
  $blockid = 'mass_bottom';
  $blockcls = '';
 
  $ospans = array();
  $tmcols = 'col-sm-12 col-xs-12';
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );


?>

<?php } ?>
 
<footer id="footer">
 
  <?php
    $blockid = 'footer_top';
    $blockcls = '';
    $ospans = array(1=>12, 2=>12);
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>

 <?php
    $blockid = 'footer_center';
    $blockcls = '';
    $ospans = array(1=>3,2=>3,3=>3,4=>3);
    require( ThemeControlHelper::getLayoutPath( 'common/block-twitter.tpl' ) );
  ?>

  <?php
  /**
   * Footer Center Position
   * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
   */
  $blockid = 'footer_bottom';
  $blockcls = '';
  $tmcols = 'col-lg-6 col-md-6 col-sm-6 col-xs-12';
 
  $ospans = array(1=>3,2=>3,3=>3,4=>3);
   require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  if( count($modules) <= 0 ) { 
   ?>

<?php  } ?> 
 


<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
  <?php  echo $helper->renderAddon( 'panel' );?>
<?php  } ?>

</div>
<?php
  $offcanvas = $helper->getConfig('offcanvas','category');
  if($offcanvas == "megamenu") {
      echo $helper->renderAddon( 'offcanvas');
  } else {
      echo $helper->renderAddon( 'offcanvas-category');
  }

  ?> 
</div> 
</body></html>