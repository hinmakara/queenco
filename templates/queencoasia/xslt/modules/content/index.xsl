<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM  "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="result[page/@is-default = '1']" >
        <xsl:apply-templates select=".//group[@name ='field-group-main-hotel']" mode="main-hotel"/>
        <xsl:apply-templates select=".//group[@name ='field-group-main-casino']" mode="main-casino"/>
        <xsl:apply-templates select=".//group[@name ='field-group-main-dining']" mode="main-dining"/>
        <xsl:apply-templates select=".//group[@name ='field-group-main-leisure']" mode="main-leisure"/>
    </xsl:template>
    <!-- template block for main page -->
    <xsl:template match="group" mode="main-hotel">
        <section class="main-page clearfix">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="col-lg-12 col-md-12 col-sm-4 col-xs-12 xs-horizontal">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-6">
                        <div class="box">
                            <div class="box-content">
                                <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-hotel-img-1']/value,')/392/392/void/0/1/5/0/100'))/udata/src}"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-6">
                        <div class="box box-type-title">
                            <div class="box-content">
                                <a href="{property[@name='field-group-main-hotel-link']/value/page/@link}">
                                    <h2 class="box-content-header">
                                        <xsl:value-of select="property[@name='field-group-main-hotel-header']/value"/>
                                    </h2>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-8 hidden-xs">
                    <div class="box box-styles-common">
                        <div class="box-content">
                            <xsl:value-of select="property[@name='field-group-main-hotel-desc']/value"
                                          disable-output-escaping="yes"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-sm-6 hidden-xs">
                <div class="box">
                    <div class="box-content">
                        <div class="flexslider text-light">
                            <ul class="slides">
                                <xsl:for-each select="//group[@name='field-group-main-hotel']/property[@type='img_file']">
                                    <li data-transition="fade">
                                        <img src="{document(concat('udata://system/makeThumbnailFull/(.',value,')/796/391/void/0/0/5/0/100'))/udata/src}"/>
                                    </li>
                                </xsl:for-each>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="group" mode="main-casino">
        <section class="main-page clearfix">
            <div class="col-sm-4 col-xs-12 hidden-xs">
                <div class="box">
                    <div class="box-content">
                        <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-casino-img-1']/value,')/392/392/void/0/1/5/0/80'))/udata/src}"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12">
                <div class="col-sm-12 col-xs-12">
                    <div class="col-xs-6">
                        <div class="box box-type-title">
                            <div class="box-content">
                                <a href="{property[@name='field-group-main-casino-link']/value/page/@link}">
                                    <h2 class="box-content-header">
                                        <xsl:value-of select="property[@name='field-group-main-casino-header']/value"/>
                                    </h2>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="box">
                            <div class="box-content">
                                <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-casino-img-2']/value,')/392/392/void/0/1/5/0/80'))/udata/src}"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 hidden-xs">
                    <div class="box">
                        <div class="box-content">
                            <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-casino-img-3']/value,')/392/191/void/0/1/5/0/80'))/udata/src}"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12 hidden-xs">
                <div class="  col-xs-12 hidden-sm">
                    <div class="box">
                        <div class="box-content">
                            <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-casino-img-4']/value,')/460/225/void/0/1/5/0/80'))/udata/src}"/>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 ">
                    <div class="box box-styles-common">
                        <div class="box-content">
                            <xsl:value-of select="property[@name='field-group-main-casino-desc']/value"
                                          disable-output-escaping="yes"/>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="group" mode="main-dining">
        <section class="main-page clearfix">
            <div class="col-sm-4 col-xs-12 hidden-xs">
                <div class="col-xs-12 hidden-sm">
                    <div class="box">
                        <div class="box-content">
                            <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-dining-img-4']/value,')/460/225/void/0/1/5/0/80'))/udata/src}"/>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 ">
                    <div class="box box-styles-common">
                        <div class="box-content">
                            <xsl:value-of select="property[@name='field-group-main-dining-desc']/value"
                                          disable-output-escaping="yes"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12">
                <div class="col-sm-12 col-xs-12">
                    <div class="col-xs-6">
                        <div class="box">
                            <div class="box-content">
                                <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-dining-img-2']/value,')/392/392/void/0/1/5/0/80'))/udata/src}"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="box box-type-title">
                            <div class="box-content">
                                <a href="{property[@name='field-group-main-dining-link']/value/page/@link}">
                                    <h2 class="box-content-header">
                                        <xsl:value-of select="property[@name='field-group-main-dining-header']/value"/>
                                    </h2>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 hidden-xs">
                    <div class="box">
                        <div class="box-content">
                            <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-dining-img-3']/value,')/392/191/void/0/1/5/0/80'))/udata/src}"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12 hidden-xs">
                <div class="box">
                    <div class="box-content">
                        <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-dining-img-1']/value,')/392/392/void/0/1/5/0/80'))/udata/src}"/>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="group" mode="main-leisure">
        <section class="main-page clearfix">
            <div class="col-sm-4 col-xs-12 hidden-xs">
                <div class="box">
                    <div class="box-content">
                        <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-leisure-img-1']/value,')/392/392/void/0/1/5/0/80'))/udata/src}"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12 hidden-xs">
                <div class="col-xs-12 hidden-sm">
                    <div class="box">
                        <div class="box-content">
                            <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-leisure-img-2']/value,')/460/225/void/0/1/5/0/80'))/udata/src}"/>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 ">
                    <div class="box box-styles-common">
                        <div class="box-content">
                            <xsl:value-of select="property[@name='field-group-main-leisure-desc']/value"
                                          disable-output-escaping="yes"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12">
                <div class="col-sm-12 col-xs-12">
                    <div class="col-xs-6">
                        <div class="box box-type-title">
                            <div class="box-content">
                                <a href="{property[@name='field-group-main-leisure-link']/value/page/@link}">
                                    <h2 class="box-content-header">
                                        <xsl:value-of select="property[@name='field-group-main-leisure-header']/value"/>
                                    </h2>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="box">
                            <div class="box-content">
                                <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-leisure-img-3']/value,')/392/392/void/0/1/5/0/80'))/udata/src}"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 hidden-xs">
                    <div class="box">
                        <div class="box-content">
                            <img src="{document(concat('udata://system/makeThumbnailFull/(.',property[@name='field-group-main-leisure-img-4']/value,')/392/191/void/0/1/5/0/80'))/udata/src}"/>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="group" mode="main-contacts">
    </xsl:template>


</xsl:stylesheet>