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
                <link href="/templates/modules/css/bootstrap.min.css" rel="stylesheet"/>
                <link rel='stylesheet' id='default-style-css' href='/templates/modules/css/style.css'
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
                    &lt;link href="/templates/modules/css/rs-settings-ie8.css" rel="stylesheet" /&gt;
                    &lt;script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"&gt; &lt;/script&gt;
                    ![endif]
                </xsl:comment>
                <link href="/images/favicon.ico" rel="icon" type="image/x-icon" />
            </head>
            <body>
                <!-- PAGELOADER -->
                <div id="page-loader">
                    <div class="page-loader-inner">
                        <div class="loader-logo">
                            <img src="{$site-info[@name='field-site-info-logo-top']/value}" alt="Logo"/>
                        </div>
                        <div class="loader-icon">
                            <span class="spinner"></span>
                            <span></span>
                        </div>
                    </div>
                </div>
                <!-- END PAGELOADER -->
                <!-- PAGE CONTENT -->
                <div id="page-content" class="fixed-header">
                    <!-- HEADER -->
                    <header id="header" class="header-show">
                        <div class="header-inner container clearfix">
                            <div id="logo" class="pull-left">
                                <a id="defaut-logo" class="logotype" href="http://queencoasia.com">
                                    <img src="{$site-info[@name='field-site-info-logo-top']/value}" alt="{$site-info[@name='field-site-info-footer-slogan']/value}"/>
                                </a>
                            </div>
                            <!--<xsl:apply-templates select="document('udata://system/getLangsList')/udata/items" mode="lang"/>-->
                            <div class="menu pull-right clearfix">
                                <xsl:apply-templates
                                        select="document(concat('udata://menu/draw/main-menu-', $lang))/udata"
                                        mode="main"/>
                            </div>
                        </div> <!-- END .header-inner -->
                    </header> <!-- END header -->
                    <!-- HEADER -->
                    <!-- PAGEBODY -->
                    <div class="page-body">
                        <article id="main">
                            <xsl:apply-templates select="result" mode="header" />
                        <xsl:apply-templates select="result" />

                        </article>


                        <!-- FOOTER -->
                        <footer>
                            <div class="container-fluid text-light">
                                <div class="col-xs-12">
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <h2>&contacts;</h2>
                                        <div class=" contacts">
                                            <xsl:value-of select="$contacts//property[@name='content']/value" disable-output-escaping="yes"/>
                                        </div>
                                          </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4"><h2>&about;</h2>
                                        <xsl:apply-templates
                                                select="document(concat('udata://menu/draw/bottom-menu-', $lang))/udata"
                                                mode="footer-menu"/>

                                    </div>
                                </div>
                                <div class="col-xs-12 text-center footer-logo">
                                    <div class="col-xs-11 pull-center">
                                    <a href="#page-content" data-target="page-content" class="pull-center scroll-to hidden-lg hidden-md sr-button sr-buttonicon small-iconbutton">
                                    <i class="fa fa-angle-up"></i>
                                </a></div>
                                    <div class="col-xs-12">
                                    <img src="{$site-info[@name='field-site-info-logo-bottom']/value}" alt="{$site-info[@name='field-site-info-footer-slogan']/value}"/>
                                    </div>
                                    <ul class="socialmedia-widget social-share hidden-lg hidden-md">
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
                                    <div class="copyright">©
                                        <xsl:value-of select="document('udata://system/convertDate/now/(Y)')/udata"/> - <h3><xsl:value-of
                                                select="$site-info[@name='field-site-info-footer-slogan']/value"/></h3>
                                    </div>
                                </div>
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
                <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
                <!-- new -->
                <script type='text/javascript' src='/templates/modules/js/bootstrap-datetimepicker.min.js'></script>
                <!-- SCRIPTS -->
                <script type="text/javascript" src="/templates/modules/js/jquery.montage.js"></script>
                <script type='text/javascript' src='/templates/modules/js/xone-loader.js'></script>
                <script type="text/javascript" src="/templates/modules/js/i18n.{result/@lang}.js"></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.easing.1.3.js'></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.easing.compatibility.js'></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.visible.min.js'></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.easy-opener.min.js'></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.flexslider.min.js'></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.bgvideo.min.js'></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.fitvids.min.js'></script>
                <script type="text/javascript" src="/templates/modules/js/jquery.themepunch.tools.min.js"></script>
                <script type="text/javascript" src="/templates/modules/js/jquery.themepunch.revolution.min.js"></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.parallax.min.js'></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.counter.min.js'></script>
                <script type='text/javascript' src='/templates/modules/js/owl.carousel.min.js'></script>
                <script type='text/javascript' src='/templates/modules/js/jquery.scroll.min.js'></script>
                <script type="text/javascript" src="/templates/modules/js/forms.js"></script>
                <script type="text/javascript" src="/templates/modules/js/captcha.js"></script>
                <script type="text/javascript" src="/templates/modules/js/cookie.js"></script>

                <script type="text/javascript" src="/templates/modules/js/jquery.formstyler.min.js"></script>
                <script type='text/javascript' src='/templates/modules/js/script.js'></script>
                <xsl:if test="//property[@name='field-contacts-map-show']/value or $type_name = 'Контакты'">
                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
                    <script type="text/javascript">
                        <xsl:value-of select="$contacts//property[@name='field-contacts-map']/value"/>
                    </script>
                </xsl:if>

                <!-- Go to www.addthis.com/dashboard to customize your tools
               <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-571ee7413d6c2f26"></script>
               <link rel='stylesheet' id='default-style-css' href='/templates/modules/css/social.css'
                     type='text/css' media='all'/>-->

                <script>
                    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

                    ga('create', 'UA-67742452-1', 'auto');
                    ga('send', 'pageview');

                </script>
                <!-- Facebook Pixel Code -->
                <script>
                    !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
                    n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
                    n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
                    t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
                    document,'script','https://connect.facebook.net/en_US/fbevents.js');

                    fbq('init', '1484497858522845');
                    fbq('track', "PageView");</script>
                <noscript><img height="1" width="1" style="display:none"
                               src="https://www.facebook.com/tr?id=1484497858522845&amp;ev=PageView&amp;noscript=1"
                /></noscript>
                <!-- End Facebook Pixel Code -->
                <!-- SCRIPTS -->
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>