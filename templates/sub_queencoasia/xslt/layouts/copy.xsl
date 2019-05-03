<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                xmlns:xlink="http://www.w3.org/TR/xlink"
                version="1.0">

    <xsl:template match="/" mode="layout">
        <html>
            <head>
                <meta name="viewport"
                      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>
                    <xsl:value-of select="$document-title"/>
                </title>
                <meta name="keywords" content="{//meta/keywords}"/>
                <meta name="description" content="{//meta/description}"/>
                <!-- CSS -->
                <link rel='stylesheet'
                      href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css?ver=707a0b1e4618ad5375c2ba1b9b7f85d6'
                      type='text/css' media='all'/>
                <link href="/templates/queencoasia/css/bootstrap.min.css" rel="stylesheet"/>
                <link rel='stylesheet' id='default-style-css' href='/templates/queencoasia/css/style.css'
                      type='text/css' media='all'/>
                <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
                <xsl:comment>[if lt IE 8] &lt;div id="ie7-alert" style="width: 100%; text-align:center;"&gt;
                    &lt;img src="http://tmbhtest.com/images/ie7.jpg" alt="Upgrade IE 8" width="640" height="344"
                    border="0" usemap="#Map" /&gt;
                    &lt;map name="Map" id="Map"&gt;&lt;area shape="rect" coords="496,201,604,329"
                    href="http://www.microsoft.com/windows/internet-explorer/default.aspx" target="_blank" alt="Download
                    Interent Explorer" /&gt;&lt;area shape="rect" coords="380,201,488,329"
                    href="http://www.apple.com/safari/download/" target="_blank" alt="Download Apple Safari" /&gt;&lt;area
                    shape="rect" coords="268,202,376,330" href="http://www.opera.com/download/" target="_blank"
                    alt="Download Opera" /&gt;&lt;area shape="rect" coords="155,202,263,330"
                    href="http://www.mozilla.com/" target="_blank" alt="Download Firefox" /&gt;&lt;area shape="rect"
                    coords="35,201,143,329" href="http://www.google.com/chrome" target="_blank" alt="Download Google
                    Chrome" /&gt;
                    &lt;/map&gt;
                    &lt;/div&gt;![endif]
                </xsl:comment>
                <xsl:comment>[if lt IE 9]
                    &lt;script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"&gt; &lt;/script&gt;
                    &lt;link href="/templates/queencoasia/css/rs-settings-ie8.css" rel="stylesheet" /&gt;
                    &lt;script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"&gt; &lt;/script&gt;
                    ![endif]
                </xsl:comment>
            </head>
            <body>
                <!-- PAGELOADER -->
                <div id="page-loader">
                    <div class="page-loader-inner">
                        <div class="loader-logo">
                            <img src="/templates/queencoasia/images/logo-black.png" alt="Logo"/>
                        </div>
                        <div class="loader-icon">
                            <span class="spinner"></span>
                            <span></span>
                        </div>
                        <xsl:apply-templates select="$errors"/>
                    </div>
                </div>
                <!-- END PAGELOADER -->
                <!-- PAGE CONTENT -->
                <div id="page-content" class="fixed-header">
                    <!-- HEADER -->
                    <header id="header" class="header-overlay">
                        <div class="header-inner container clearfix">
                            <div id="logo" class="left-float">
                                <a id="overlay-logo" class="logotype" href="{result/@pre-lang}/">
                                    <img src="{$site-info[@name='logo_white']/value}" alt="Logo"/>
                                </a>
                                <a id="defaut-logo" class="logotype" href="{result/@pre-lang}/">
                                    <img src="{$site-info[@name='logo_black']/value}" alt="Logo"/>
                                </a>
                            </div>
                            <div class="menu right-float clearfix">
                                <xsl:apply-templates
                                        select="document(concat('udata://menu/draw/main-menu-', $lang))/udata"
                                        mode="main"/>
                            </div>
                        </div> <!-- END .header-inner -->
                    </header> <!-- END header -->
                    <!-- HEADER -->
                    <!-- PAGEBODY -->
                    <div class="page-body">
                        <!-- START REVOLUTION SLIDER 5.0 -->
                        <xsl:apply-templates
                                select="document(concat('udata://banners/multipleFastInsert/main-top-', $lang))/udata"
                                mode="main"/>
                        <!-- END REVOLUTION SLIDER 5.0 -->
                        <div class="bookmain-layout-block">
                            <a href="#" class="bookmain-btn collapsed" data-toggle="collapse"
                               data-target="#bookmain-colapsed" aria-expanded="false" aria-controls="bookmain-colapsed">
                                <h3 class="bookmain-header">
                                    &booking-now;
                                </h3>
                            </a>
                            <!-- booking widget block -->
                            <div id="bookmain-colapsed" class="bookmain collapse">
                                <div class="bookmain-content">
                                    <form action="/book/reservations" method="GET">
                                        <div class="col-xs-12">
                                            <select class="width-auto">
                                                <option disabled="" value="1" selected="">
                                                    Select a rooms
                                                </option>
                                                <option data-do-availability="n" value="wizardstep_3201" skip-autosubmit-form="">
                                                    Superior Rooms Tower
                                                </option>
                                                <option data-do-availability="n" value="wizardstep_3201" skip-autosubmit-form="">
                                                    Deluxe Rooms Beach
                                                </option>
                                                <option data-do-availability="n" value="wizardstep_3201" skip-autosubmit-form="">
                                                    Deluxe Rooms Tower
                                                </option>
                                                <option data-do-availability="n" value="wizardstep_3201" skip-autosubmit-form="">
                                                    Deluxe Sea View Tower
                                                </option>
                                            </select>

                                        </div>
                                        <div class="col-xs-6">
                                            <input value="" id="checkinDate--slider" checkin-date="" type="text"
                                                   placeholder="Arrival" class="styler width-auto"/>
                                        </div>

                                        <div class="col-xs-6">
                                            <input id="checkoutDate--slider" checkout-date="" type="text" value=""
                                                   placeholder="Departure" class="styler width-auto"/>

                                        </div>
                                        <div class="">
                                            <div class="col-xs-4">
                                                <label for="roomsInput">Rooms</label>
                                                <span class="select">
                                                    <select bookmain-rooms-input="" name="RoomsCount"
                                                            class="width-auto">
                                                        <option value="1" selected="">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                    </select>
                                                </span>
                                            </div>
                                            <div class="col-xs-4">
                                                <label for="adults1">Adults</label>
                                                <span class="select">
                                                    <select value="2" id="adults1" name="AdultsCount[0]"
                                                            class="width-auto">
                                                        <option value="1">1</option>
                                                        <option value="2" selected="selected">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                    </select>
                                                </span>
                                            </div>
                                            <div class="col-xs-4">
                                                <label for="children1">Children</label>
                                                <span class="select">
                                                    <select value="0" id="children1" name="ChildrenCount[0]"
                                                            class="width-auto">
                                                        <option value="0" selected="selected">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                    </select>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 row">
                                            <button class="btn black" type="submit" bookmain-submit="">Find a room
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /booking widget block -->
                        </div>
                        <section id="special">
                            <div class="container-fluid">
                                <div class="col-xs-6 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="{document('udata://system/makeThumbnailFull/(./images/main/room.jpg)/392/auto/void/0/1/5/0/80')/udata/src}"/>
                                        <div class="caption">
                                            <a href="/hotels/the-bloomsbury-hotel/rooms-suites">
                                                <h3 class="box-content-header">Advanced purchase offer</h3>
                                            </a>
                                            <p>All have  bathrooms, supremely comfortable pillow-topped beds, and complimentary Wi-Fi.</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="{document('udata://system/makeThumbnailFull/(./images/main/room1.jpg)/392/auto/void/0/1/5/0/80')/udata/src}"/>
                                        <div class="caption">
                                            <h3 class="box-content-header">Superior Quuen Rooms</h3>
                                            <p>All have  bathrooms, supremely comfortable pillow-topped beds, and complimentary Wi-Fi.</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="{document('udata://system/makeThumbnailFull/(./images/main/dinig.jpg)/392/auto/void/0/1/5/0/80')/udata/src}"/>
                                        <div class="caption">
                                            <h3 class="box-content-header">Dine at Nice</h3>
                                            <p>All have  bathrooms, supremely comfortable pillow-topped beds, and complimentary Wi-Fi.</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="{document('udata://system/makeThumbnailFull/(./images/main/chef.jpg)/392/auto/void/0/1/5/0/80')/udata/src}"/>
                                        <div class="caption">
                                            <h3 class="box-content-header">Sanday Specials</h3>
                                            <p>All have  bathrooms, supremely comfortable pillow-topped beds, and complimentary Wi-Fi.</p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <article id="main">
                            <section class="container-fluid">
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="col-lg-12 col-md-12 col-sm-4 col-xs-12">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-6">
                                            <div class="box">
                                                <div class="box-content">
                                                    <img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/rooms-and-suites-block/bloomsbury-home-rooms-suites/83409-2-eng-US/bloomsbury-home-rooms-suites_block_low_1_of_6.jpg" alt="Queenco Home Rooms &amp; Suites" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-6">
                                            <div class="box box-type-title">
                                                <div class="box-content">
                                                    <a href="/hotels/the-bloomsbury-hotel/rooms-suites">
                                                        <h2 class="box-content-header">Rooms &amp; Suites</h2>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-8 hidden-xs">
                                        <div class="box box-styles-common-1">
                                            <div class="box-content">
                                                <h3 class="box-content-header">It’s the little things that make all the difference </h3>

                                                <p>The Queenco hotel’s 153 guest rooms and suites offer the very best of 21<sup>st</sup> century technology seamlessly blended with design flair and luxurious comfort. All have  bathrooms, supremely comfortable pillow-topped beds, and complimentary Wi-Fi.</p>                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 col-sm-6 hidden-xs">
                                    <div class="box">
                                        <div class="box-content">
                                            <div class="flexslider-container portfolio-slider">
                                                <div class="flexslider">
                                                    <ul class="slides">
                                                        <li><img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/rooms-and-suites-block/rooms-suites-slider-img-1/83406-2-eng-US/rooms-suites-slider-img-1_block_high_2_of_3.jpg" alt=""/></li>
                                                        <li><img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/rooms-and-suites-block/rooms-suites-slider-img-1/83406-2-eng-US/rooms-suites-slider-img-1_block_high_2_of_3.jpg" alt=""/></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="container-fluid">
                                <div class="col-sm-4 col-xs-12 hidden-xs">
                                    <div class="box">
                                        <div class="box-content">
                                            <img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/meetings-block/bloomsbury-home-m-e-large-square/83373-2-eng-US/bloomsbury-home-m-e-large-square_block_high_1_of_3.jpg"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-xs-12">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="col-xs-6">
                                            <div class="box">
                                                <div class="box-content">
                                                    <img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/rooms-and-suites-block/bloomsbury-home-rooms-suites/83409-2-eng-US/bloomsbury-home-rooms-suites_block_low_1_of_6.jpg" alt="Queenco Home Rooms &amp; Suites" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-6">
                                            <div class="box box-type-title">
                                                <div class="box-content">
                                                    <a href="/hotels/the-bloomsbury-hotel/rooms-suites">
                                                        <h2 class="box-content-header">Rooms &amp; Suites</h2>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 hidden-xs">
                                        <div class="box">
                                            <div class="box-content">
                                                <img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/meeting-events-block/bloomsbury-m-e-meeting-landscape-1/83370-3-eng-US/bloomsbury-m-e-meeting-landscape-1_block_low_2_of_6.jpg"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-xs-12 hidden-xs">
                                    <div class="  col-xs-12 hidden-sm">
                                        <div class="box">
                                            <div class="box-content">
                                                <img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/meeting-events-block/bloomsbury-m-e-meeting-landscape-2/83367-3-eng-US/bloomsbury-m-e-meeting-landscape-2_block_low_2_of_6.jpg" alt="Queenco Home Rooms &amp; Suites" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 ">
                                        <div class="box box-styles-common-1">
                                            <div class="box-content">
                                                <h3 class="box-content-header">It’s the little things that make all the difference </h3>

                                                <p>The Queenco hotel’s 153 guest rooms and suites offer the very best of 21<sup>st</sup> century technology seamlessly blended with design flair and luxurious comfort. All have  bathrooms, supremely comfortable pillow-topped beds, and complimentary Wi-Fi.</p>                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="container-fluid">
                                <div class="col-sm-4 col-xs-12 hidden-xs">
                                    <div class="box">
                                        <div class="box-content">
                                            <img src="/images/map.jpg"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-xs-12 hidden-xs">
                                    <div class="col-xs-12 ">
                                        <div class="box box-styles-common-1">
                                            <div class="box-content">
                                                <h3 class="box-content-header">Queenco hotel &amp; casino</h3>

                                                <p>
                                                    Mohavithey Krong,District 3,<br/>Sihanoukville, Cambodia</p><p>Phone:
                                                <a href="tel:+85533933733" target="_self">+855-34-933-733</a></p><p>
                                                <a href="mailto:info@queencoasia.com" target="_self">info@queencoasia.com</a></p>                      </div>
                                        </div>
                                    </div>
                                    <div class="  col-xs-12 hidden-sm">
                                        <div class="box">
                                            <div class="box-content">
                                                <img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/meeting-events-block/bloomsbury-m-e-meeting-landscape-2/83367-3-eng-US/bloomsbury-m-e-meeting-landscape-2_block_low_2_of_6.jpg" alt="Queenco Home Rooms &amp; Suites" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-4 col-xs-12">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="col-xs-6">
                                            <div class="box box-type-title">
                                                <div class="box-content">
                                                    <a href="/hotels/the-bloomsbury-hotel/rooms-suites">
                                                        <h2 class="box-content-header">Slice of the city</h2>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-6">
                                            <div class="box">
                                                <div class="box-content">
                                                    <img src="/images/sihanoukville.jpg" alt="Queenco Home Rooms &amp; Suites" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 hidden-xs">
                                        <div class="box">
                                            <div class="box-content">
                                                <img src="https://www.doylecollection.com/var/doyle/storage/images/media/doyle-redesign/images/hotels/bloomsbury/homepage/meeting-events-block/bloomsbury-m-e-meeting-landscape-1/83370-3-eng-US/bloomsbury-m-e-meeting-landscape-1_block_low_2_of_6.jpg"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </article>
                        <!-- FOOTER -->
                        <footer>
                            <div class="footerinner wrapper align-center text-light">
                                <a id="backtotop" href="#" class="sr-button sr-buttonicon small-iconbutton">
                                    <i class="fa fa-angle-up"></i>
                                </a>
                                <p class="footer-logo">
                                    <img src="/templates/queencoasia/images/logo-white.png" alt="Footer Logo"/>
                                </p>
                                <ul class="socialmedia-widget social-share">
                                    <li class="facebook">
                                        <a href="#">Facebook</a>
                                    </li>
                                    <li class="twitter">
                                        <a href="#">Tweet</a>
                                    </li>
                                    <li class="linkedin">
                                        <a href="#">Google Plus</a>
                                    </li>
                                    <li class="dribbble">
                                        <a href="#">Dribble</a>
                                    </li>
                                    <li class="behance">
                                        <a href="#">Behance</a>
                                    </li>
                                    <li class="instagram">
                                        <a href="#">Instagram</a>
                                    </li>
                                </ul>
                                <p class="copyright">©
                                    <xsl:value-of select="document('udata://system/convertDate/now/(Y)')/udata"/> - Xone
                                    - Created by SpabRice
                                </p>
                            </div>
                        </footer>
                        <!-- FOOTER -->
                    </div>
                    <!-- END .page-body -->
                </div>
                <!-- END #page-content -->
                <!-- SCRIPTS -->
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
                <script type="text/javascript" src="/templates/queencoasia/js/jquery.themepunch.tools.min.js"></script>
                <script type="text/javascript"
                        src="/templates/queencoasia/js/jquery.themepunch.revolution.min.js"></script>
                <script type="text/javascript" src="/templates/queencoasia/js/jquery.themepunch.enablelog.js"></script>
                <script type='text/javascript' src='/templates/queencoasia/js/jquery.parallax.min.js'></script>
                <script type='text/javascript' src='/templates/queencoasia/js/jquery.counter.min.js'></script>
                <!--<script type='text/javascript' src='/templates/queencoasia/js/jquery.scroll.min.js'></script>-->
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