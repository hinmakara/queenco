<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:umi="http://www.umi-cms.ru/TR/umi"
				xmlns:xlink="http://www.w3.org/TR/xlink">

	<xsl:template match="/" mode="layout">
		<html>
			<head>

				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

				<title><xsl:value-of select="$document-title" /></title>
				<meta name="keywords" content="{//meta/keywords}" />
				<meta name="description" content="{//meta/description}" />

				<!-- FONTS -->
				<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,800,600|Raleway:300,600,900' rel='stylesheet' type='text/css'/>
				<!-- FONTS -->

				<!-- CSS -->
				<link rel='stylesheet' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css?ver=707a0b1e4618ad5375c2ba1b9b7f85d6' type='text/css' media='all' />
				<link href="templates/queencoasia/css/bootstrap.min.css" rel="stylesheet" />
				<link rel='stylesheet' id='default-style-css'  href='templates/queencoasia/css/style.css' type='text/css' media='all' />


				<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
				<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
				<xsl:comment>[if lt IE 8] &lt;div id="ie7-alert" style="width: 100%; text-align:center;"&gt;
					&lt;img src="http://tmbhtest.com/images/ie7.jpg" alt="Upgrade IE 8" width="640" height="344" border="0" usemap="#Map" /&gt;
					&lt;map name="Map" id="Map"&gt;&lt;area shape="rect" coords="496,201,604,329" href="http://www.microsoft.com/windows/internet-explorer/default.aspx" target="_blank" alt="Download Interent Explorer" /&gt;&lt;area shape="rect" coords="380,201,488,329" href="http://www.apple.com/safari/download/" target="_blank" alt="Download Apple Safari" /&gt;&lt;area shape="rect" coords="268,202,376,330" href="http://www.opera.com/download/" target="_blank" alt="Download Opera" /&gt;&lt;area shape="rect" coords="155,202,263,330" href="http://www.mozilla.com/" target="_blank" alt="Download Firefox" /&gt;&lt;area shape="rect" coords="35,201,143,329" href="http://www.google.com/chrome" target="_blank" alt="Download Google Chrome" /&gt;
					&lt;/map&gt;
					&lt;/div&gt;![endif]</xsl:comment>
				<xsl:comment>[if lt IE 9]
                   &lt;script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"&gt; &lt;/script&gt;
                   &lt;script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"&gt; &lt;/script&gt;
					![endif]</xsl:comment>

			</head>
			<body>
				<div class="page-body">
				<!-- PAGELOADER -->
				<div id="page-loader">
					<div class="page-loader-inner">
						<div class="loader-logo"><img src="templates/queencoasia/images/logo-black.png" alt="Logo"/></div>
						<div class="loader-icon"><span class="spinner"></span><span></span></div>
					</div>
				</div>
				<!-- PAGELOADER -->
				<header id="header">
					<div class="header-inner wrapper clearfix">

						<div id="logo" class="left-float">
							<a id="defaut-logo" class="logotype" href="index.html"><img src="templates/queencoasia/images/logo-white.png" alt="Logo" /></a>
						</div>

						<div class="menu right-float clearfix">
							<nav id="main-nav">
								<ul>
									<li class="current-menu-item"><a href="#home" class="scroll-to">Home</a></li>
									<li><a href="#about" class="scroll-to">About</a></li>
									<li><a href="#service" class="scroll-to">Service</a></li>
									<li><a href="#portfolio" class="scroll-to">Portfolio</a></li>
									<li><a href="#team" class="scroll-to">Team</a></li>
									<li><a href="blog.html">Blog</a></li>
									<li><a href="elements.html">Elements</a>
										<ul class="sub-menu">
											<li><a href="elements.html">General</a></li>
											<li><a href="portfolio-layout.html">Portfolio Layout</a></li>
										</ul>
									</li>
									<li><a href="#contact" class="scroll-to">Contact</a></li>
								</ul>
							</nav>
							<nav id="menu-controls">
								<ul>
									<li class="current-menu-item"><a href="#home" class="scroll-to"><span class="c-dot"></span><span class="c-name">Home</span></a></li>
									<li><a href="#about" class="scroll-to"><span class="c-dot"></span><span class="c-name">About</span></a></li>
									<li><a href="#service" class="scroll-to"><span class="c-dot"></span><span class="c-name">Service</span></a></li>
									<li><a href="#portfolio" class="scroll-to"><span class="c-dot"></span><span class="c-name">Portfolio</span></a></li>
									<li><a href="#team" class="scroll-to"><span class="c-dot"></span><span class="c-name">Team</span></a></li>
									<li><a href="blog.html"><span class="c-dot"></span><span class="c-name">Blog</span></a></li>
									<li><a href="elements.html"><span class="c-dot"></span><span class="c-name">Elements</span></a></li>
									<li><a href="#contact" class="scroll-to"><span class="c-dot"></span><span class="c-name">Contact</span></a></li>
								</ul>
							</nav>
						</div>

					</div> <!-- END .header-inner -->
				</header>






				</div>
				<div class="site-wrapper">
					<header class="site-header">
						<div class="nav-wrap">
							<div class="container">

								<div class="site-logo retina"> <a href="http://www.queencoasia.com/"><img alt="Site logo" src="http://www.queencoasia.com/wp-content/uploads/2015/04/logo-black.png" /></a>
								</div>

								<!-- Used for mobile menu -->
								<button class="navbar-toggle" type="button">
								</button>

								<xsl:apply-templates select="document(concat('udata://menu/draw/main-menu-', $lang))/udata" mode="main"/>
							</div>
						</div>

					</header>
					<div class="main-content">
						<div class="parallax-section">

							<div id="parallax-video" class="horizontalsection text-light videobg-section" data-webm="http://localhost/files/discovery_channel.webm" data-mp4="http://localhost/files/discovery_channel.mp4" data-videoposter="http://localhost/images/1x1.png" data-videowidth="720" data-videoheight="480" data-videoparallax="true" style="width: 100%;">

								<div class="horizontalinner wrapper">
									<div class="section-title sr-animation">
										<h2>Parallax Video</h2>
										<div class="seperator size-small"><span></span></div>
										<h4 class="subtitle">Xone supports <strong>Background videos</strong> with an optional parallax effect, <br/>
											and you can also link to an external video.</h4>
									</div>
									<h6 class="align-center sr-animation sr-animation-frombottom"><strong>See the Video</strong></h6>
									<p class="align-center sr-animation sr-animation-frombottom" data-delay="200">
										<a href="http://player.vimeo.com/video/50834315" data-type="video" data-width="500" data-height="281" class="sr-button sr-buttonicon medium-button easy-opener">
											<i class="fa fa-play fa-fw"></i></a>
									</p>
								</div>

							</div>
							</div>
							<!-- end header container -->
				<xsl:apply-templates select="$errors" />
					<!--<xsl:if test="result[page/@is-default = '1']">
						<xsl:apply-templates select="document('udata://news/lastlist/(/index/baners/)')" mode="baners-bx" />
					</xsl:if>-->
					<!-- header pic -->
					<xsl:if test="result[.//property[@name ='header_pic']/value != '']">
						<div class="parallax-container room">
							<div class="parallax-top">
								<xsl:call-template name="catalog-thumbnail">
									<xsl:with-param name="element-id" select="result/@pageId" />
									<xsl:with-param name="field-name">header_pic</xsl:with-param>
									<xsl:with-param name="empty">&empty-photo;</xsl:with-param>
									<xsl:with-param name="width">auto</xsl:with-param>
									<xsl:with-param name="height">2000</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>

				<!-- main container -->
					<!--<xsl:apply-templates select="result" />-->
					<xsl:if test=".//property[@name='show_map']/value = '1'">
						<div id="map"></div>
					</xsl:if>
					</div>
					<footer>
						<div class="container">
							<div class="row">
								<div class="col-md-4 col-xs-12">
									<ul><li id="text-9" class="widget-container widget_text">
										<div class="textwidget"><h4>&contacts;</h4>
											<xsl:value-of select="document(concat('upage://', $lang-prefix,'contacts'))//property[@name = 'content']/value" disable-output-escaping="yes" />
											<p>
									Victory Beach,<br/>
									Mohavithey Krong,District 3,<br/>
									Sihanoukville, Cambodia, 18000</p>
								</div>
								</li></ul></div>
								<div class="col-md-4 col-xs-12">
									<h4>&newsletters;</h4>
									<xsl:apply-templates select="document('udata://dispatches/subscribe/')/udata" />
								</div>
								<div class="col-md-4 col-xs-12">
									<h4>&about;</h4>
									<ul><li id="nav_menu-19" class="widget-container widget_nav_menu"><div class="menu-social-container"><ul id="menu-social" class="menu"><li id="menu-item-156" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-156"><a href="https://www.facebook.com/QueencoAsia"><i class="fa fa-lg fa-fw fa-facebook-square"></i> Queenco at Facebook</a></li>
									<li id="menu-item-157" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-157"><a href="https://www.facebook.com/pokeratqueenco"><i class="fa fa-lg fa-fw fa-facebook-square"></i> Poker at Queenco</a></li>
									<li id="menu-item-383" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-383"><a href="https://instagram.com/queencoasia/"><i class="fa fa-lg fa-fw fa-instagram"></i> Queenco on Instagram</a></li>
									<li id="menu-item-158" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-158"><a href="http://www.tripadvisor.co.uk/Hotel_Review-g325573-d2441631-Reviews-Queenco_Hotel_and_Casino-Sihanoukville_Sihanoukville_Province.html#REVIEWS"><i class="fa fa-lg fa-fw fa-empire"></i> Tripadvisor</a></li>
									<li id="menu-item-159" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-159"><a href="http://www.booking.com/hotel/kh/quuenco-and-casino.en-gb.html?sid=79f98edf3a3fd4b9b4693dae089a2340;dcid=4;bhh=1"><i class="fa fa-lg fa-fw fa-square"></i> Booking.com</a></li>
								</ul></div></li></ul></div>
							</div>
						</div>
						<div class="copyright-footer">
							<div class="container">
								<div class="row">
									<div class="col-md-6"><ul><li>© <xsl:value-of select="document('udata://system/convertDate/now/(Y)')/udata" />.
										<xsl:text>&copyright;</xsl:text> -
										<a href="{result/@pre-lang}/" title="{$site-info[@name = 'footer_slogan']/value}" class="site-name">
											<xsl:value-of select="$site-info[@name = 'footer_slogan']/value" /></a></li></ul></div>
									<div class="col-md-6 text-right"><ul><li><a href="http://studio.ovit-asia.com" title="Website create by Cambodia in studio OVIT">Website create by Cambodia in studio OVIT</a></li></ul></div>
								</div>
							</div>
						</div>
					</footer>
				</div>


				<div id="back-top-wrapper" class="visible-desktop">
					<p id="back-top">
						<a href="#top" id="backtotop"><i class="fa fa-angle-up"></i></a> </p>
				</div>

				<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
				<!-- Include all compiled plugins (below), or include individual files as needed -->
				<script src="/templates/queencoasia/js/bootstrap.min.js"></script>
				<!-- new -->
				<!-- SCRIPTS -->
				<script type="text/javascript" src="/templates/queencoasia/js/i18n.{result/@lang}.js"></script>
				<script type='text/javascript' src='/templates/queencoasia/js/retina.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.easing.1.3.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.easing.compatibility.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.visible.min.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.easy-opener.min.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.flexslider.min.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.isotope.min.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.bgvideo.min.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.fitvids.min.js'></script>
				<script type="text/javascript" src="/templates/queencoasia/js/jquery.themepunch.plugins.min.js"></script>
				<script type="text/javascript" src="/templates/queencoasia/js/jquery.themepunch.revolution.min.js"></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.parallax.min.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.counter.min.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/jquery.scroll.min.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/xone-header.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/xone-loader.js'></script>
				<script type='text/javascript' src='/templates/queencoasia/js/xone-form.js'></script>
				<script type="text/javascript" src="/templates/queencoasia/js/__common.js"></script>
				<script type="text/javascript" src="/templates/queencoasia/js/jquery.formstyler.min.js"></script>
				<script type='text/javascript' src='/templates/queencoasia/js/script.js'></script>

				<!-- SCRIPTS -->


			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>