<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM  "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="result[@module = 'content']">
        <xsl:apply-templates select=".//group[@name = 'field-group-welcome-seo']" mode="welcome-seo"/>

        <xsl:choose>
            <xsl:when test="page/@is-default = '1'">
                <xsl:apply-templates select=".//group[@name ='field-group-main-hotel']" mode="main-hotel"/>
                <xsl:apply-templates select=".//group[@name ='field-group-main-casino']" mode="main-casino"/>
                <xsl:apply-templates select=".//group[@name ='field-group-main-dining']" mode="main-dining"/>
                <xsl:apply-templates select=".//group[@name ='field-group-main-leisure']" mode="main-leisure"/>
            </xsl:when>
            <xsl:when test="$request-uri = concat($lang-prefix, '/accommodation/')">
                <xsl:for-each select="document(concat('udata://menu/draw/main-menu-', $lang))/udata/item[@status='active']/items/item">
                    <!-- for each link get id in main lang after get img -->
                    <xsl:variable name="CurId" select="document(concat('udata://custom/getLanguage/(', @link,')/',$lang))/udata"/>
                    <xsl:variable name="UEn" select="document(concat('upage://',$CurId))/udata/page"/>
                    <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
                    <section class="container-fluid sections-inner-page sections-inner-list">
                        <div class="clearfix">
                            <xsl:if test="$page//property[@name='field-proportions-to-main-block'] or $page//property[@name='field-proportions-to-main-float']">
                                <xsl:attribute name="class">
                                    <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-block']" mode="class"/>
                                    <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-float']" mode="class"/>
                                    <xsl:text> clearfix</xsl:text>
                                </xsl:attribute>
                            </xsl:if>

                            <div class="col-xs-6 cover">
                                <xsl:if test="$page//property[@name='field-proportions-to-main-img' or @name='field-proportions-to-main-img-float']">
                                    <xsl:attribute name="class">
                                        <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-img']" mode="class"/>
                                        <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-img-float']" mode="class"/>
                                        <xsl:text> cover</xsl:text>
                                    </xsl:attribute>
                                </xsl:if>
                                <div class="flexslider text-light">
                                    <ul class="slides">
                                        <xsl:apply-templates select="$UEn//group[@name='field-group-gallery']"
                                                             mode="slider"/>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-6 sections-inner-intro">
                                <xsl:if test="$page//property[@name='field-proportions-to-main-content' or @name='field-proportions-to-main-content-float']">
                                    <xsl:attribute name="class">
                                        <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-content']" mode="class"/>
                                        <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-content-float']" mode="class"/>
                                        <xsl:text> sections-inner-intro</xsl:text>
                                    </xsl:attribute>
                                </xsl:if>
                                <div class="sections-inner-title">
                                    <a href="{@link}"><h2>
                                        <xsl:value-of select="."/>
                                    </h2></a>
                                </div>
                                <div class="sections-inner-intro-text">
                                    <span class="sections-inner-text">
                                        <xsl:value-of
                                                select="$page//property[@name = 'field-short-content']/value"
                                                disable-output-escaping="yes"/>
                                    </span>
                                    <div class="proportions">
                                        <xsl:apply-templates
                                                select="$page//property[@name = 'field-rooms-area']/value"
                                                mode="room-size"/>
                                        <xsl:apply-templates
                                                select="$page//property[@name='field-rooms-view']/value"
                                                mode="room-view"/>
                                        <xsl:apply-templates
                                                select="$page//property[@name = 'field-worktime']/value"
                                                mode="working-time"/>
                                    </div>
                                    <xsl:apply-templates select="$page//property[@name = 'field-rooms-cost']/value"
                                                         mode="price"/>
                                </div>
                                <div class="">
                                    <a href="{$lang-prefix/@link}" class="btn btn-primary black">&read-more-and-booking;</a>
                                </div>
                            </div>
                        </div>
                    </section>

                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$request-uri = concat($lang-prefix, '/dining/') or $request-uri = concat($lang-prefix, '/leisure/') or $request-uri = concat($lang-prefix, '/casino/')">
                <xsl:for-each select=".//property[@name='field-link-select']/value/page">
                    <!-- for each link get id in main lang after get img -->
                    <xsl:variable name="CurId" select="document(concat('udata://custom/getLanguage/(', @link,')/',$lang))/udata"/>
                    <xsl:variable name="UEn" select="document(concat('upage://',$CurId))/udata/page"/>
                    <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
                    <section class="container-fluid sections-inner-page sections-inner-list">
                        <div class="clearfix">
                            <xsl:if test="$page//property[@name='field-proportions-to-main-block'] or $page//property[@name='field-proportions-to-main-float']">
                                <xsl:attribute name="class">
                                    <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-block']" mode="class"/>
                                    <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-float']" mode="class"/>
                                    <xsl:text> clearfix</xsl:text>
                                </xsl:attribute>
                            </xsl:if>

                            <div class="col-xs-6 cover">
                                <xsl:if test="$page//property[@name='field-proportions-to-main-img' or @name='field-proportions-to-main-img-float']">
                                    <xsl:attribute name="class">
                                        <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-img']" mode="class"/>
                                        <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-img-float']" mode="class"/>
                                        <xsl:text> cover</xsl:text>
                                    </xsl:attribute>
                                </xsl:if>
                                <div class="flexslider text-light">
                                    <ul class="slides">
                                        <xsl:apply-templates select="$UEn//group[@name='field-group-gallery']"
                                                             mode="slider"/>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-6 sections-inner-intro">
                                <xsl:if test="$page//property[@name='field-proportions-to-main-content' or @name='field-proportions-to-main-content-float']">
                                    <xsl:attribute name="class">
                                        <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-content']" mode="class"/>
                                        <xsl:apply-templates select="$page//property[@name='field-proportions-to-main-content-float']" mode="class"/>
                                        <xsl:text> sections-inner-intro</xsl:text>
                                    </xsl:attribute>
                                </xsl:if>
                                <div class="sections-inner-title">
                                    <h2>
                                        <xsl:value-of select="name"/>
                                    </h2>
                                </div>
                                <div class="sections-inner-intro-text">
                                    <span class="sections-inner-text">
                                        <xsl:value-of
                                                select="$page//property[@name = 'field-short-content']/value"
                                                disable-output-escaping="yes"/>
                                    </span>
                                    <div class="proportions">
                                        <xsl:apply-templates
                                                select="$page//property[@name = 'field-rooms-area']/value"
                                                mode="room-size"/>
                                        <xsl:apply-templates
                                                select="$page//property[@name='field-rooms-view']/value"
                                                mode="room-view"/>
                                        <xsl:apply-templates
                                                select="$page//property[@name = 'field-worktime']/value"
                                                mode="working-time"/>
                                    </div>
                                    <!-- <xsl:apply-templates select="$page//property[@name = 'field-rooms-cost']/value"
                                                          mode="price"/>-->
                                </div>
                                <!--<div class="">
                                  <a href="#" class="btn btn-primary black">&more-info;</a>
                                </div>-->
                            </div>
                        </div>
                    </section>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$parent-uri = concat($lang-prefix, '/accommodation/') or $parent-uri = concat($lang-prefix, '/dining/') or $parent-uri = concat($lang-prefix, '/leisure/') or $parent-uri = concat($lang-prefix, '/casino/')">
                <section id="main-block" class="container test">
                    <aside id="sidebar" class="col-sm-4 col-md-3 col-xs-12 pull-left" data-target="#main-block">
                        <div class="sidebar-box clearfix">
                            <div class="col-xs-8 col-sm-12">
                                <h3 class="sidebar-box-title">
                                    <xsl:value-of select="page/name"/>
                                </h3>
                                <!-- <div class="sidebar-box-price">
                                   <h4 class="sidebar-box-price-title">
                                     &price;
                                   </h4>
                                   &from;&#160;<span>$<xsl:value-of select="$UpageEn//property[@name = 'field-rooms-cost']/value"/></span>&#160;&day;
                                 </div>-->
                            </div>
                            <div class="col-xs-4 col-sm-12">
                                <a class="btn btn-primary black"
                                   href="{$UpageEn//property[@name='booking_link']/value}">&booking;</a>
                            </div>
                        </div>
                    </aside>
                    <div class="col-sm-8 col-md-9 col-xs-12 description ">
                        <div><xsl:value-of select=".//property[@name = 'content']/value"
                                           disable-output-escaping="yes"/></div>
                        <xsl:apply-templates select=".//group[@name ='field-group-special']" mode="rooms"/>

                    </div>
                </section>
                <xsl:apply-templates
                        select="document(concat('udata://banners/fastInsert/inner-bottom-', $lang))/udata/banner"
                        mode="inner-bottom"/>
                <xsl:apply-templates select="document(concat('udata://content/menu/(null)/2/', page/@parentId))"
                                     mode="more-rooms"/>
            </xsl:when>
            <xsl:otherwise>
                <section class="container-fluid sections-inner-page sections-inner-pages">
                    <div class="clearfix">
                        <xsl:if test=".//property[@name='field-proportions-to-main-block'] or .//property[@name='field-proportions-to-main-float']">
                            <xsl:attribute name="class">
                                <xsl:apply-templates select=".//property[@name='field-proportions-to-main-block']" mode="class"/>
                                <xsl:apply-templates select=".//property[@name='field-proportions-to-main-float']" mode="class"/>
                                <xsl:text> clearfix</xsl:text>
                            </xsl:attribute>
                        </xsl:if>
                        <h2 class="header pull-center col-xs-12 col-sm-6 col-md-4"><xsl:value-of select=".//property[@name='h1']/value"/></h2>
                        <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                    </div>
                </section>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="result" mode="header">

    </xsl:template>
    <xsl:template match="result[@pageId]" mode="header">
        <!-- REVOLUTION SLIDER -->
        <xsl:if test="$hasbanners or $slider">
            <section id="home" class="no-padding">
                <div class="home-slider-container">
                    <div class="home-slider" data-type="hero">
                        <xsl:if test="count($hasbanners) > 1 or count($hasslider) > 1">
                            <xsl:attribute name="data-type">standart</xsl:attribute>
                        </xsl:if>
                        <ul>
                            <xsl:apply-templates select="document(concat('udata://banners/multipleFastInsert/top-', $lang))/udata" mode="main"/>
                            <xsl:apply-templates select="$UpageEn//group[@name='field-group-gallery']" mode="slider"/>
                        </ul>
                    </div>
                </div>
            </section>
        </xsl:if>
        <!-- END REVOLUTION SLIDER -->
        <xsl:if test="$hide-booking-form = true()">
            <xsl:call-template name="bwh"/>
        </xsl:if>
        <xsl:call-template name="bwh"/>
        <!-- show special promotions block -->
        <xsl:apply-templates select="document(concat('udata://banners/multipleFastInsert/special-', $lang, '/'))/udata" mode="main-special"/>
        <!-- end show special promotions block -->
    </xsl:template>
    <xsl:template match="result[page/@is-default = '0']" mode="header">
        <xsl:if test="$show-booking-form = false()">
        </xsl:if>
        <xsl:choose>
            <xsl:when test="$show_welcome_block = '1'">
                <div class="span7 title-section">
                    <xsl:if test="$header_white = '1'">
                        <xsl:attribute name="class">span7 title-section header_white</xsl:attribute>
                    </xsl:if>
                    <h2 class="title-header">
                        <xsl:value-of select="@header"/>
                    </h2>
                    <h3 class="feature">
                        <xsl:value-of select=".//property[@name='feature']/value"/>
                    </h3>
                </div>
                <div class="span3 more-box">
                    <span class="more-info-text">&welcome;!</span>
                    <xsl:value-of select="$site-info[@name = 'welcome_block_text']/value"
                                  disable-output-escaping="yes"/>
                    <a class="btn btn-primary black" href="{$lang-prefix}/contacts/">&comment-ask-question;</a>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="span9 title-section">
                    <xsl:if test="$header_white = '1'">
                        <xsl:attribute name="class">span7 title-section header_white</xsl:attribute>
                    </xsl:if>
                    <h2 class="title-header">
                        <xsl:value-of select="@header"/>
                    </h2>
                    <h3 class="feature">
                        <xsl:value-of select=".//property[@name='feature']/value"/>
                    </h3>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <!--<xsl:apply-templates select="document('udata://core/navibar')/udata"/>-->

    </xsl:template>
    <xsl:template match="group" mode="welcome-seo">
        <section id="welcome">
            <div class="container-fluid text-center">
                <div class="welcome-block col-xs-10 col-xs-offset-1">
                    <h2 class="welcome-block-title collapsed" data-toggle="collapse"
                        data-target="#welcome-main" aria-expanded="false" aria-controls="welcome-main">
                        <xsl:value-of select="property[@name ='field-welcome-header']/value"/>
                    </h2>
                    <div class="welcome-block-text collapse" id="welcome-main">
                        <xsl:value-of select="property[@name ='field-welcome-content']/value"
                                      disable-output-escaping="yes"/>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>

    <!-- rooms -->
    <xsl:template match="group" mode="rooms">
        <xsl:for-each select="property">
            <ul class="clearfix">
                <li class="col-xs-3 col-sm-2"><xsl:value-of select="title"/></li>
                <xsl:choose>
                    <xsl:when test="@name='field-rooms-cost'">
                        <li> $&#160;<xsl:value-of select="value"/></li>
                    </xsl:when>
                    <xsl:when test="@name='field-rooms-area'">
                        <li><xsl:value-of select="value"/>&#160;m
                            <sup>2</sup></li>
                    </xsl:when>
                    <xsl:when test="@name='field-rooms-capacity-extra'">
                        <li> &yes;</li>
                    </xsl:when>
                    <xsl:when test="@name='field-rooms-capacity' or @name='field-rooms-capacity-child'">
                        <li> <xsl:value-of select="value"/></li>
                    </xsl:when>
                    <xsl:when test="@name='field-rooms-facilities'">
                        <li class="col-xs-12 col-md-10">
                            <ul>
                                <xsl:for-each select="value/item">
                                    <li><xsl:value-of select="document(concat('udata://custom/optionslang/', @id, '/', @name))/udata"/></li>
                                </xsl:for-each>
                            </ul></li>
                    </xsl:when>
                    <xsl:when test="@name='field-rooms-view'">
                        <li><xsl:value-of select="value/item/@id"/>
                            <xsl:value-of
                                    select="document(concat('udata://custom/optionslang/', value/item/@id, '/', value/item/@name))/udata"/></li>
                    </xsl:when>
                </xsl:choose>
            </ul>
        </xsl:for-each>

    </xsl:template>
    <xsl:template match="property" mode="rooms">
        <xsl:choose>
            <xsl:when test="@name='field-rooms-area'">
                <tr>
                    <td>
                        <xsl:value-of select="title"/>
                    </td>
                    <td><xsl:value-of select="value"/>&#160;m
                        <sup>2</sup>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="property[@name='field-rooms-capacity-extra']/value = '1'">
                <tr>
                    <td>
                        <xsl:value-of select="title"/>
                    </td>
                    <td>&yes;</td>
                </tr>
            </xsl:when>
            <xsl:when test="@name='field-rooms-capacity' or @name='field-rooms-capacity-child'">
                <tr>
                    <td>
                        <xsl:value-of select="title"/>
                    </td>
                    <td>
                        <xsl:value-of select="value"/>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="@name='field-rooms-facilities'">
                <tr>
                    <td>
                        <xsl:value-of select="title"/>
                    </td>
                    <td>
                        <ul>
                            <xsl:for-each select="value/item">
                                <li>
                                    <xsl:value-of
                                            select="document(concat('udata://custom/optionslang/', @id, '/', @name))/udata"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="@name='field-rooms-view'">
                <tr>
                    <td>
                        <xsl:value-of select="title"/>
                    </td>
                    <td>
                        <xsl:value-of select="value/item/@id"/>
                        <xsl:value-of
                                select="document(concat('udata://custom/optionslang/', value/item/@id, '/', value/item/@name))/udata"/>
                    </td>
                </tr>
            </xsl:when>

        </xsl:choose>
    </xsl:template>
    <!-- slider photos -->
    <xsl:template match="group" mode="slider">
        <xsl:for-each select="property[@type='img_file']">
            <li data-transition="fade">
                <xsl:call-template name="thumbnail">
                    <xsl:with-param name="src">
                        <xsl:value-of select="value"/>
                    </xsl:with-param>
                    <xsl:with-param name="width">1440</xsl:with-param>
                    <xsl:with-param name="height">800</xsl:with-param>
                </xsl:call-template>
            </li>
        </xsl:for-each>
    </xsl:template>
    <!-- working time -->
    <xsl:template match="value" mode="room-size">
        <span class="sections-inner-size">
            <strong>&room-size;:</strong>&#160;<xsl:value-of
                select="."/>м
            <sup>2</sup>
        </span>
    </xsl:template>
    <xsl:template match="item" mode="room-view">
        <span class="sections-inner-size">
            <strong>&room-view;:</strong>&#160;<xsl:value-of
                select="document(concat('udata://custom/optionslang/', ./@id, '/', ./@name))/udata"/>
        </span>
    </xsl:template>
    <xsl:template match="value" mode="working-time">
        <span class="sections-inner-size">
            <strong>&working-hours;:</strong>&#160;<xsl:value-of
                select="."/>
        </span>
    </xsl:template>
    <xsl:template match="value" mode="price">
        <div class="price">&from;&#160;$<xsl:value-of
                select="."/>
            <span class="currency">/&day;</span>
        </div>
    </xsl:template>

    <xsl:include href="menu.xsl"/>
    <xsl:include href="404.xsl"/>
    <xsl:include href="sitemap.xsl"/>
    <xsl:include href="index.xsl"/>
</xsl:stylesheet>