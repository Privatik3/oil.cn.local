
<?php
	$this->language( 'module/themecontrol' );
	$objlang = $this->registry->get('language');
 	$config = $this->registry->get('config');
	$megamenu = $helper->renderModule('pavmegamenu');
	$verticalmenu = $helper->renderModule('pavverticalmenu');
?>
<nav id="topbar">
  <div class="container-fluid">
  		<div class="row ">
  			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 "><a href="/"><img class="logo" src="image/logo.png"></a></div>
  			<div style="padding-top: 8px; padding-left: 30px" class="col-lg-6 col-md-6 col-sm-4 col-xs-12 hidden-xs">
  				<div class="custom-top call-support pull-left">
					<i class="fa fa-mobile" style="font-size: 52px;"></i>
				</div>
			    <div class="custom-top mail-contact pull-left hidden-sm hidden-xs">
			    	<p><span class="call-number"> <?php echo $config->get('config_telephone');?></span><?php echo ' &nbsp;&nbsp;Life'?></p>
					<p><span class="call-number"> <?php echo ' ';?></span><?php echo ' &nbsp;&nbsp;'?></p>
					<p><span class="call-number"> <?php echo '‎066-620-45-10';?></span><?php echo ' &nbsp;&nbsp;Vodafone'?></p>
				</div>
				<div style=" padding-left: 30px" class="custom-top call-support pull-left">
					<img class="time" src="image/clock.png">
				</div>
				<div class="custom-top mail-contact pull-left hidden-sm hidden-xs">
			    	<p><span class="call-number"> <?php echo '09:00-18:00';?></span><?php echo ' &nbsp;&nbsp;Пн-Пт'?></p>
					<p><span class="call-number"> <?php echo ' ';?></span><?php echo ' &nbsp;&nbsp;'?></p>
					<p><span class="call-number"> <?php echo '10:00-15:00';?></span><?php echo '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Сб-Вс'?></p>
				</div>
				<div class="welcome pull-left">
					<?php if ($logged) { ?>
		            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> -
		            <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
		            <?php } else { ?>
		            <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a><br><br>
		            <a href="<?php echo $login; ?>"><?php echo 'Вход'; ?></a>
		            <?php } ?>
				</div>	
			</div>		
			<div class="col-lg-3 col-md-3 col-sm-5 col-xs-6 pull-right">
				<div class="show-mobile pull-right">
					<div class="quick-cart pull-right">
						<div class="quickcart-toggle">
							<?php echo $cart; ?>
						</div>
					</div>
						
				<div class="quick-user pull-right">
					<div class="quickaccess-toggle">
						<i class="fa fa-user"></i><i class="fa fa-angle-down"></i>
						<div class="inner-toggle">
							<div class="language">
								<?php echo $language; ?>
							</div>
							<div class="currency">
								<?php echo $currency; ?>
							</div>
						</div>
					</div>
				</div>	
				<div class="quick-setting pull-right">
					<div class="quickaccess-toggle">
						<i class="fa fa-cog"></i><i class="fa fa-angle-down"></i>
						<div class="inner-toggle">
							<ul class="links ">
								<li><a class="wishlist" href="<?php echo $wishlist; ?>" id="wishlist-total"><span class="fa fa-heart"></span><?php echo $text_wishlist; ?></a></li>
								<li><a class="" href="<?php echo $account; ?>"><span class="fa fa-user"></span><?php echo $text_account; ?></a></li>
								<li><a class="shoppingcart" href="<?php echo $shopping_cart; ?>"><span class="fa fa-shopping-cart"></span><?php echo $text_shopping_cart; ?></a></li>
								<li><a class="last" href="<?php echo $checkout; ?>"><span class="fa fa-file"></span><?php echo $text_checkout; ?></a></li> 
								<?php if ($logged) { ?>
							      <li><a href="<?php echo $logout; ?>"><span class="fa fa-unlock"></span><?php echo $text_logout; ?></a></li>
							     <?php } else { ?>
							      <li><a href="<?php echo $register; ?>"><span class="fa fa-pencil"></span><?php echo $text_register; ?></a></li>
							      <li><a href="<?php echo $login; ?>"><span class="fa fa-unlock"></span><?php echo $text_login; ?></a> </li>
							    <?php } ?>

							</ul>
						</div>
					</div>
				</div>		
				<div class="quick-setting pull-right hidden-lg hidden-md">
					<div class="quickaccess-toggle">
						<i class="icon-list"></i>
						<div class="inner-toggle">
							<?php if ($logged) { ?>
				            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> -
				            <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
				            <?php } else { ?>
				            <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a><br>
				            <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
				            <?php } ?>
						</div>
					</div>
				</div>
				</div>
			</div>			
	    </div><!-- end -->
  </div>
</nav>
<header id="header">
	<div id="header-bottom">
		<div class="container-fluid">
			<div class="row">							
				<div style="padding-left: 0px;padding-right: 0px;" class="col-lg-3 col-sm-3 col-md-3 raz">
					<div id="pav-verticalmenu">
						<div class="box-heading d-heading">
							<h4>
								<i class="fa fa-bars"></i>
								Продукция
								<i class="fa fa-angle-down"></i>
								<span class="arrow-down pull-right"><span></span></span>
							</h4>								
						</div>	
						<div class="box-content d-content">
							<?php if(!empty($verticalmenu)) { ?>
							<?php echo $verticalmenu; ?>
							<?php } ?>
						</div>
					</div>			
				</div>	
				<div style="padding-left: 0px;padding-right: 0px;" class="col-lg-6 col-md-6 col-sm-6">
				<ul class="main_men">
					<span class="befor">Меню</span>
						<li><a href="">Главная</a></li>
						<li><a href="">Подбор</a></li>
						<li><a href="">Вопросы</a></li>
						<li><a href="http://oil.cn.ua/index.php?route=information/information&information_id=4">Услуги СТО</a></li>
						<li><a href="http://oil.cn.ua/index.php?route=information/information&information_id=5">Доставка и оплата</a></li>
						<li><a href="http://oil.cn.ua/index.php?route=information/contact">Контакты</a></li>
				</ul>
				</div>							
				<div class="col-lg-3 col-md-3 col-sm-3 search-wrapper">
					<?php echo $search; ?>
				</div>										
			</div>	
		</div>		
	</div>	
<script type="text/javascript">
	
	$(document).ready(function() {
 if($(window).width()< 500 ) {
    $('.befor').addClass('cliki');
}
   });

</script>
<script type="text/javascript">
	$(document).ready(function() {
		var a=1;
    $(".cliki").click(function(){ 
    
    if (a==1) {
    	$(".main_men li").css('display' , 'inline-block');
    	a=a+1;
   }
   else{
   	$(".main_men li").css('display' , 'none');
   	a=a-1;
   }
  });
     });
</script>
<script type="text/javascript">
	
	$(document).ready(function() {
 if($(window).width()< 500 ) {
    $('#pav-verticalmenu .box-heading').addClass('clik');
}
   });

</script>
<script type="text/javascript">
	$(document).ready(function() {
		var b=1;
    $(".clik").click(function(){ 
    
    if (b==1) {
    	$("#pav-verticalmenu .box-content").css('display' , 'block');
    	b=b+1;
   }
   else{
   	$("#pav-verticalmenu .box-content").css('display' , 'none');
   	b=b-1;
   }
  });
     });
</script>

</header>
