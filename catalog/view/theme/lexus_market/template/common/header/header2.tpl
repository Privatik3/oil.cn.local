
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
  		<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 hidden-xs"><img class="logo" src="image/logo.png"></div>
  			<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 hidden-xs">
				<div class="welcome pull-left">
					<?php if ($logged) { ?>
		            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> или
		            <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
		            <?php } else { ?>
		            <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> или
		            <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
		            <?php } ?>
				</div>
				<div class="show-mobile">						
					<div class="quick-user pull-left">
						<div class="quickaccess-toggle" >
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
				<div class="quick-setting pull-left">
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
				<div class="quick-setting pull-left hidden-lg hidden-md">
					<div class="quickaccess-toggle" >
						<i class="icon-list"></i>
						<div class="inner-toggle">
							<?php if ($logged) { ?>
				            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> или
				            <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
				            <?php } else { ?>
				            <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> или
				            <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
				            <?php } ?>
						</div>
					</div>
				</div>
				</div>
				
			</div>		
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pull-right">
				<div class="quick-cart pull-right">
					<div class="quickcart-toggle">
						<?php echo $cart; ?>
					</div>
				</div>	
			</div>			
	    </div><!-- end -->
  </div>
</nav>
<header id="header">
	<div class="container">
		<div class="row">	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 inner">

				<!-- menu -->  		  
				<div id="pav-mainnav">
					<div class="mainnav-wrap">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 inner">
							<?php if( $logoType=='logo-theme'){ ?>
							<div  id="logo-theme" class="logo-store">
								<a href="<?php echo $home; ?>">
									<span><?php echo $name; ?></span>
								</a>
							</div>
							<?php } elseif ($logo) { ?>
								<div id="logo" class="logo-store">
									<a href="<?php echo $home; ?>">
										<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
									</a>
								</div>
							<?php } ?>
						</div>
						<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
							<button data-toggle="offcanvas" class="button canvas-menu hidden-lg hidden-md" type="button"><span class="fa fa-bars"></span> Menu</button>
							<?php
							/**
							 * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
							 */
							$modules = $helper->renderModule('pavmegamenu');

							if (count($modules) && !empty($modules)) { ?>

							    
							<?php echo $modules; ?>
							 

							<?php } elseif ($categories) { ?>
								<div class="main-menu">
							    <div class="navbar navbar-inverse"> 
							        <nav class="megamenu" role="navigation"> 
							            <div class="navbar-header">
							                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
							                    <span class="sr-only">Toggle navigation</span>
							                    <span class="fa fa-bars"></span>
							                </button>
							            </div>

							            <div class="collapse navbar-collapse navbar-ex1-collapse">
							                <ul class="nav navbar-nav">
							                    
							                    <?php foreach ($categories as $category) { ?>

							                        <?php if ($category['children']) { ?>			
							                            <li class="parent dropdown deeper ">
							                                <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?>
							                                    <b class="fa fa-angle-down"></b>
							                                    <span class="triangles"></span>
							                                </a>
							                            <?php } else { ?>
							                            <li>
							                                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
							                            <?php } ?>
							                            <?php if ($category['children']) { ?>
							                                <ul class="dropdown-menu">
							                                    <?php for ($i = 0; $i < count($category['children']);) { ?>
							                                        <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
							                                        <?php for (; $i < $j; $i++) { ?>
							                                            <?php if (isset($category['children'][$i])) { ?>
							                                                <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
							                                            <?php } ?>
							                                        <?php } ?>
							                                    <?php } ?>
							                                </ul>
							                            <?php } ?>
							                        </li>
							                    <?php } ?>
							                </ul>
							            </div>	
							        </nav>
							    </div> 
							    </div>  
							<?php } ?>
						</div>

					</div>

					
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="header-bottom">
		<div class="container">
			<div class="row">							
				<div class="col-lg-3 col-sm-3 col-md-3 hidden-xs hidden-sm">
					<div id="pav-verticalmenu" class="pav-dropdown">
						<div class="box-heading d-heading">
							<h4>
								<i class="fa fa-bars"></i>
								<?php echo $objlang->get('text_catalog_menu'); ?>
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
				<div class="col-lg-9 col-md-9 col-sm-12 search-wrapper">
					<?php echo $search; ?>
				</div>										
			</div>	
		</div>		
	</div>	


</header>






