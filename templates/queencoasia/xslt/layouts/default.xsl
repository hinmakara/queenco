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
                <title><xsl:value-of select="$document-title"/></title>
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
                        <xsl:apply-templates select="$errors" />
                    </div>
                </div>
                <!-- END PAGELOADER -->
                <!-- PAGE CONTENT -->
                <div id="page-content" class="fixed-header">
                    <!-- HEADER -->
                    <header id="header" class="header-show">
                        <div class="header-inner container clearfix">
                            <div id="logo" class="pull-left">
                                <a id="defaut-logo" class="logotype" href="{result/@pre-lang}/">
                                    <img src="{$site-info[@name='field-site-info-logo-top']/value}"/>
                                </a>
                                <xsl:if test="$site-info[@name='field-site-info-logo-top1']/value">
                                    <a id="defaut-logo" class="logotype" href="{$site-info[@name='field-site-info-logo-top1-link']/value}/">
                                        <img src="{$site-info[@name='field-site-info-logo-top1']/value}"/>
                                    </a>
                                </xsl:if>
                                   </div>
                            <xsl:apply-templates select="document('udata://system/getLangsList')/udata/items" mode="lang"/>
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
                        <xsl:if test="//property[@name='field-contacts-map-show']/value = '1'">
                            <xsl:call-template name="contacts"/>
                        </xsl:if>
                        <!-- FOOTER -->
                        <footer>
                            <div class="container-fluid text-light">
                                <div class="col-xs-12">
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <h2>&contacts;</h2>
                                        <div class="contacts">
                                            <xsl:value-of select="$contacts//property[@name='content']/value" disable-output-escaping="yes"/>
                                        </div>
                                          </div>
                                    <div class="hidden-xs hidden-sm col-md-4"><h2>&newsletter;</h2>
                                        <!-- Begin MailChimp Signup Form -->
                                        <div id="mc_embed_signup">
                                            <form action="//queencoasia.us11.list-manage.com/subscribe/post?u=8acf8c933f614802fbdce92dc&amp;id=0cf141f903" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate="novalidate">
                                                <div id="mc_embed_signup_scroll">
                                                    <div class="mc-field-group">
                                                        <input type="email" value="" name="EMAIL" class="required styler" id="mce-EMAIL" placeholder="&e-mail;"/>
                                                    </div>
                                                    <div class="mc-field-group">
                                                        <input type="text" value="" name="FNAME" class="styler" id="mce-FNAME" placeholder="&fname;"/>
                                                    </div>
                                                    <div class="mc-field-group">
                                                        <input type="text" value="" name="LNAME" class="styler" id="mce-LNAME" placeholder="&lname;"/>
                                                    </div>
                                                    <div id="mce-responses" class="clear">
                                                        <div class="response" id="mce-error-response" style="display:none"></div>
                                                        <div class="response" id="mce-success-response" style="display:none"></div>
                                                    </div> <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                                                    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_8acf8c933f614802fbdce92dc_0cf141f903" tabindex="-1" value=""/></div>
                                                    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="btn"/></div>
                                                </div>
                                            </form>
                                        </div>
                                        <script type='text/javascript' src='//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js'></script><script type='text/javascript'>(function($) {window.fnames = new Array(); window.ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';fnames[1]='FNAME';ftypes[1]='text';fnames[2]='LNAME';ftypes[2]='text';}(jQuery));var $mcj = jQuery.noConflict(true);</script>
                                        <!--End mc_embed_signup-->

                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4"><h2>&about;</h2>
                                        <xsl:apply-templates
                                                select="document(concat('udata://menu/draw/bottom-menu-', $lang))/udata"
                                                mode="footer-menu"/>

                                    </div>
                                </div>
                                <div class="col-xs-12 text-center footer-logo">
                                    <a href="#page-content" data-target="page-content" class="scroll-to hidden-lg hidden-md sr-button sr-buttonicon small-iconbutton">
                                    <i class="fa fa-angle-up"></i>
                                </a><br/>
                                    <img src="{$site-info[@name='field-site-info-logo-bottom']/value}" alt="{$site-info[@name='field-site-info-footer-slogan']/value}"/>
                                    <div class="clearfix"/>
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
                <!-- For booking -->
                <script src="/templates/modules/js/jquery-ui.min.js"></script>
                <script src="/templates/modules/js/booking.js"></script>
                <script src="/templates/modules/js/booking.js"></script>

                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
                <!-- new -->

                <!-- SCRIPTS -->
                <script type="text/javascript" src="/templates/modules/js/jquery.montage.js"></script>
                <script type='text/javascript' src='/templates/modules/js/xone-loader.js'></script>
                <!--<script type="text/javascript" src="/templates/modules/js/i18n.{result/@lang}.js"></script>-->
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
                <script type="text/javascript" src="/templates/modules/js/__common.js"></script>
                <script type="text/javascript" src="/templates/modules/js/jquery.formstyler.min.js"></script>
                <script type='text/javascript' src='/templates/modules/js/script.js'></script>
                <xsl:if test="//property[@name='field-contacts-map-show']/value or $type_name = 'Контакты'">
                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
                    <script type="text/javascript">
                        <xsl:value-of select="$contacts//property[@name='field-contacts-map']/value"/>
                    </script>
                </xsl:if>
                
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>