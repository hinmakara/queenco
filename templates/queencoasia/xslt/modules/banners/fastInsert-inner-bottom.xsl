<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                exclude-result-prefixes="xsl date udt xlink">
    <!-- выбираем все банеры для слайдера -->
    <xsl:template match="udata[@module = 'banners'][@method = 'fastInsert']" mode="inner-bottom"></xsl:template>

    <xsl:template match="banner[@type = 'image']" mode="inner-bottom">
        <xsl:variable name="object" select="document(concat('uobject://', ancestor::udata/@id))"/>
        <xsl:variable name="parallax" select="$object//property[@name='add_banners_parallax']/value = 1"/>
        <xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.', source, ')/1900/800/void/0/1/5/0/100'))/udata/src"/>
        <section class="section-inner text-light">
        <xsl:choose>
            <xsl:when test="href != ''">
                <a href="{href}">
                    <div id="inner-bootom-banners" 
                         style="background-image:url('{$src}');">
                    <xsl:if test="$parallax = 'true'">
                        <xsl:attribute name="class">parallax-section</xsl:attribute>
                    </xsl:if>
                        <xsl:apply-templates select="$object//group[@name='field-group-banners-setting']" mode="header"/>
                    </div>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <div id="inner-bootom-banners" 
                     style="background-image:url('{$src}');">
                    <xsl:if test="$parallax='true'">
                        <xsl:attribute name="class">parallax-section</xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates select="$object//group[@name='field-group-banners-setting']" mode="header"/>
                    <div class="spacer spacer-small"></div>

                </div>
            </xsl:otherwise>
        </xsl:choose>
    </section>
    </xsl:template>
    <xsl:template match="banner[@type = 'swf']" mode="inner-bottom">
        <xsl:variable name="object" select="document(concat('uobject://', ancestor::udata/@id))"/>
        <xsl:variable name="parallax" select="$object//property[@name='add_banners_parallax']/value = 1"/>
        <xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.', source, ')/1900/800/void/0/1/5/0/100'))/udata/src"/>

        <section class="section-inner text-light">
            <div id="inner-bootom-banners" class="videobg-section"
                  data-videomp4="{$object//property[@name='video_mp4']/value}"
                  data-videowebm="{$object//property[@name='video_webm']/value}"
                  data-videowidth="1280"
                  data-videoheight="720"
                  data-videoposter="{$object//property[@name='videoposter']/value}"
                  data-videooverlayopacity="0.5"
                  data-videooverlaycolor="#000"
                  data-sound="false"
                  data-videoparallax="true">
                <xsl:if test="$parallax='true'">
                    <xsl:attribute name="class">videobg-section parallax-section</xsl:attribute>
                    <xsl:attribute name="data-videoparallax">true</xsl:attribute>
                </xsl:if>
                <xsl:if test="$object//property[@name='video_background']/value">
                    <xsl:attribute name="data-sound">false</xsl:attribute>
                    <xsl:attribute name="data-videooverlaycolor">#fffff</xsl:attribute>
                    <xsl:attribute name="data-videooverlayopacity">0.5</xsl:attribute>
                </xsl:if>
                <img src="{source}"/>
                <xsl:apply-templates select="$object//group[@name='field-group-banners-setting']" mode="header"/>
               <div class="spacer spacer-small"></div>
                <xsl:if test="href != '' or $object//property[@name='link_to_video']/value !=''">
                    <div class=" text-center">
                    <a href="/banners/go_to/{ancestor::udata/@id}/"
                       data-videoposter="{$object//property[@name ='videoposter']/value}" data-type="video" class="easy-opener">
                        <xsl:if test="$object//property[@name='link_to_video']/value !=''">
                        <xsl:attribute name="data-localvideo">local</xsl:attribute>
                        </xsl:if>
                    <h3>
                        <strong>&see-full-video;</strong>
                    </h3>
                    <div class="sr-button sr-buttonicon big-iconbutton white">
                        <i class="fa fa-play"></i>
                    </div>
                    </a>
                    </div>
                </xsl:if>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="banner[@type = 'html']" mode="inner-bottom">
        <xsl:variable name="object" select="document(concat('uobject://', ancestor::udata/@id))"/>
        <xsl:variable name="parallax" select="$object//property[@name='add_banners_parallax']/value = 1"/>
        <xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.', source, ')/1900/800/void/0/1/5/0/100'))/udata/src"/>
        <section class="text-light" style="background-color:{$object//property[@name='field-background-color']/value};">
           <div class="row">
            <xsl:choose>
                <xsl:when test="href != ''">
                    <a href="{href}">
                        <div id="inner-bootom-banners" class="container">
                            <xsl:value-of select="source" disable-output-escaping="yes"/>
                        </div>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <div id="inner-bootom-banners" class="container">
                        <xsl:value-of select="source" disable-output-escaping="yes"/>
                    </div>
                </xsl:otherwise>
            </xsl:choose>
           </div>
        </section>
    </xsl:template>
</xsl:stylesheet>