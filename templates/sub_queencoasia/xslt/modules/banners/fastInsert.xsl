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
    <xsl:template match="udata[@module = 'banners'][@method = 'multipleFastInsert']" mode="main"></xsl:template>
    <xsl:template match="udata[@module = 'banners'][@method = 'multipleFastInsert'][banners]" mode="main">
                            <xsl:for-each select="banners">
                               <xsl:apply-templates select="banner" mode="main"/>
                            </xsl:for-each>
    </xsl:template>

    <!-- Основной набор правил -->
    <xsl:template match="banner[@type = 'image']" mode="main">
        <xsl:variable name="object" select="document(concat('uobject://', ancestor::banners/@id))"/>
        <xsl:variable name="parallax" select="$object//property[@name='add_banners_parallax']/value = 1"/>
        <xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.', $object//property[@name = 'image']/value, ')/1900/900/void/0/1/5/0/100'))/udata/src"/>
        <li data-transition="fade">
            <xsl:choose>
                <xsl:when test="$object//property[@name='url']/value != ''">
                    <img src="{$src}" width="1900" height="800">
                        <xsl:if test="$parallax='true'">
                            <xsl:attribute name="data-bgparallax">10</xsl:attribute>
                        </xsl:if>
                    </img>
                    <xsl:apply-templates select="$object//group[@name='field-group-banners-setting']" mode="header"/>

                </xsl:when>
                <xsl:otherwise>
                    <img src="{$src}" width="1900" height="800">
                        <xsl:if test="$parallax='true'">
                            <xsl:attribute name="data-bgparallax">10</xsl:attribute>
                        </xsl:if>
                    </img>
                    <xsl:apply-templates select="$object//group[@name='field-group-banners-setting']" mode="header"/>

                </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>

    <xsl:template match="banner[@type = 'swf']" mode="main">
        <xsl:variable name="object" select="document(concat('uobject://', ancestor::banners/@id))"/>
        <xsl:variable name="parallax" select="$object//property[@name='add_banners_parallax']/value = 1"/>
        <xsl:choose>
            <xsl:when test="$object//property[@name ='video_slider']/value = 1">
                <li data-transition="fade" data-slotamount="5" data-masterspeed="800">
                    <a href="#play_video" rel="{href}" id="play_video" class="play_video">
                        <xsl:attribute name="class">
                            <xsl:if test="$object//property[@name ='video_vimeo']/value = 1">play_video vimeo</xsl:if>
                            <xsl:if test="$object//property[@name ='video_youtube']/value = 1">play_video youtube
                            </xsl:if>
                        </xsl:attribute>
                        <xsl:call-template name="thumbnail">
                            <xsl:with-param name="src" select="$object//property[@name ='swf']/value"/>
                            <xsl:with-param name="field-name">photo</xsl:with-param>
                            <xsl:with-param name="width">1900</xsl:with-param>
                            <xsl:with-param name="height">900</xsl:with-param>
                            <xsl:with-param name="alt" select="alt"/>
                        </xsl:call-template>
                        <div class="play-video">
                            <i class="fa fa-play-circle-o"></i>
                        </div>
                    </a>
                </li>
            </xsl:when>
            <xsl:when test="$object//property[@name ='video_background']/value = 1">
                <li data-transition="fade">
                    <xsl:choose>
                        <xsl:when test="$object//property[@name='url']/value != '' or $object//property[@name='link_to_video']/value != ''">
                            <a href="/banners/go_to/{/udata/banners/@id}/"
                               data-videoposter="{$object//property[@name ='videoposter']/value}" data-type="video" class="easy-opener">
                                <xsl:if test="$object//property[@name='link_to_video']/value !=''">
                                    <xsl:attribute name="data-localvideo">local</xsl:attribute>
                                </xsl:if>
                                <img src="{$object//property[@name ='videoposter']/value}" data-bgposition="center center"
                                     data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg">
                                    <xsl:if test="$parallax='true'">
                                        <xsl:attribute name="data-bgparallax">10</xsl:attribute>
                                    </xsl:if>
                                </img>
                                <xsl:if test="document('udata://content/getMobileModesList/')//item[@name='is_desktop'][@status='active']">
                                    <div class="rs-background-video-layer"
                                         data-videomp4="{$object//property[@name ='video_mp4']/value}"
                                         data-videowebm="{$object//property[@name ='video_webm']/value}"
                                         data-forcerewind="on"
                                         data-volume="mute"
                                         data-videorate="1.5"
                                         data-videowidth="100%"
                                         data-videoheight="100%"
                                         data-videocontrols="controls"
                                         data-videoloop="loopandnoslidestop"
                                         data-forceCover="1"
                                         data-aspectratio="4:3"
                                         data-autoplay="true">
                                        <xsl:if test="$parallax='true'">
                                            <xsl:attribute name="data-bgparallax">10</xsl:attribute>
                                        </xsl:if>
                                    </div>
                                </xsl:if>
                                <xsl:apply-templates select="$object//group[@name='field-group-banners-setting']" mode="header"/>

                                <xsl:if test="$object//property[@name='link_to_video']/value != ''">
                                    <div class="tp-caption text-light text-center"
                                         data-x="center" data-hoffset="0"
                                         data-y="center" data-voffset="100">
                                        <h3>
                                            <strong>&see-full-video;</strong>
                                        </h3>
                                        <div class="sr-button sr-buttonicon big-iconbutton white">
                                            <i class="fa fa-play"></i>
                                        </div>
                                    </div>
                                </xsl:if>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                                <img src="{$object//property[@name ='videoposter']/value}" data-bgposition="center center"
                                     data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg">
                                    <xsl:if test="$parallax='true'">
                                        <xsl:attribute name="data-bgparallax">10</xsl:attribute>
                                    </xsl:if>
                                </img>
                                <xsl:if test="document('udata://content/getMobileModesList/')//item[@name='is_desktop'][@status='active']">
                                    <div class="rs-background-video-layer"
                                         data-videomp4="{$object//property[@name ='video_mp4']/value}"
                                         data-videowebm="{$object//property[@name ='video_webm']/value}"
                                         data-forcerewind="on"
                                         data-volume="mute"
                                         data-videorate="1.5"
                                         data-videowidth="100%"
                                         data-videoheight="100%"
                                         data-videocontrols="controls"
                                         data-videoloop="loopandnoslidestop"
                                         data-forceCover="1"
                                         data-aspectratio="4:3"
                                         data-autoplay="true">
                                    </div>
                                    <xsl:if test="$parallax='true'">
                                        <xsl:attribute name="data-bgparallax">10</xsl:attribute>
                                    </xsl:if>
                                </xsl:if>
                            <xsl:apply-templates select="$object//group[@name='field-group-banners-setting']" mode="header"/>

                        </xsl:otherwise>
                    </xsl:choose>
                </li>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="banner[@type = 'html']" mode="main">
        <li data-transition="fade">
        <xsl:value-of select="source" disable-output-escaping="yes"/>
        </li>
    </xsl:template>

</xsl:stylesheet>