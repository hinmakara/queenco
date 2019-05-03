<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0"
                   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                   xmlns:umi="http://www.umi-cms.ru/TR/umi"
                   xmlns:php="http://php.net/xsl">

    <xsl:template name="bwh">
        <section id="horizon_booking" class="booking_form container-fluid text-center">
            <form id="booking_form" class="form form-horizon clearfix">
                <div class="form-group col-xs-6 col-sm-2 col-md-2">
                    <span class="field datepicker-icon">
                        <input id="checkin_date2" class="input-text" placeholder="Check-in" type="text" readonly="readonly" />
                    </span>
                </div>

                <div class="form-group col-xs-6 col-sm-2 col-md-2">
                    <span class="field datepicker-icon">
                        <input id="checkout_date2" class="input-text" placeholder="Check-out" type="text" readonly="readonly" />
                    </span>
                </div>

                <div class="form-group col-xs-12 col-sm-6 col-md-4">
                    <span class="field col-xs-4">
                        <select id="adult2" class="input-select">
                            <option value="1">1 adult</option>
                            <option value="2" selected="selected">2 adults</option>
                            <option value="3">3 adults</option>
                            <option value="4">4 adults</option>
                            <option value="5">5 adults</option>
                            <option value="6">6 adults</option>
                            <option value="7">7 adults</option>
                            <option value="8">8 adults</option>
                            <option value="9">9 adults</option>
                        </select>
                    </span>

                    <span class="field col-xs-4">
                        <select id="child2" class="input-select">
                            <option value="0" selected="selected">0 children</option>
                            <option value="1">1 child</option>
                            <option value="2">2 children</option>
                            <option value="3">3 children</option>
                            <option value="4">4 children</option>
                            <option value="5">5 children</option>
                            <option value="6">6 children</option>
                            <option value="7">7 children</option>
                            <option value="8">8 children</option>
                            <option value="9">9 children</option>
                        </select>
                    </span>

                    <span class="field col-xs-4">
                        <select id="room2" class="input-select">
                            <option value="1" selected="selected">1 room</option>
                            <option value="2">2 rooms</option>
                            <option value="3">3 rooms</option>
                            <option value="4">4 rooms</option>
                            <option value="5">5 rooms</option>
                            <option value="6">6 rooms</option>
                            <option value="7">7 rooms</option>
                            <option value="8">8 rooms</option>
                            <option value="9">9 rooms</option>
                        </select>
                    </span>
                </div>

                <div class="form-group col-xs-12 col-sm-2 col-md-2 hidden-sm hidden-xs">
                    <span class="field">
                        <input id="accesscode2" class="input-text" placeholder="Promo Code" type="text" />
                    </span>
                </div>

                <div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-1">
                    <span class="field">
                        <button id="submit2" class="button" type="submit">&find-a-room;</button>
                    </span>
                </div>
                <span class="form-group col-xs-12"><a href="https://reservation.travelanium.net/propertyibe2/booking-management?propertyId=454&amp;onlineId=4">Manage your reservations</a></span>
            </form>

        </section>
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
    <xsl:template match="group" mode="class">
        <xsl:param name="class"/>
        <xsl:attribute name="class">
            <xsl:apply-templates select="property" mode="class"/>
            <xsl:if test="//property[@name='field-page-paralax']/value = '1'">horizontalsection parallax-section
            </xsl:if>
            <xsl:value-of select="$class"/>
        </xsl:attribute>

    </xsl:template>
    <xsl:template match="property" mode="class">
        <xsl:param name="class"/>
        <xsl:attribute name="class">
            <xsl:apply-templates select="property" mode="class"/>
            <xsl:value-of select="$class"/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="property" mode="class">
        <xsl:for-each select="value/item">
            <xsl:value-of select="@name"/><xsl:text> </xsl:text>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="group" mode="style">
        <xsl:param name="style"/>
        <xsl:param name="addstyle">
            <xsl:for-each select="property">
                <xsl:if test="@type='color'">background-color:<xsl:value-of select="value"/>;
                </xsl:if>
                <xsl:if test="@type='img_file'">background: url('<xsl:value-of select="value"/>');
                </xsl:if>
            </xsl:for-each>
        </xsl:param>
        <xsl:attribute name="style">
            <xsl:value-of select="normalize-space($addstyle)"/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="group" mode="form">
        <section class="clearfix" id="main-block">
            <div class="col-xs-12 pull-center clearfix">

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
                                    <li><xsl:call-template name="options">
                                        <xsl:with-param name="id"><xsl:value-of select="@id"/></xsl:with-param>
                                        <xsl:with-param name="title"><xsl:value-of select="@name"/></xsl:with-param>
                                    </xsl:call-template>
                                    </li>
                                </xsl:for-each>
                            </ul></li>
                    </xsl:when>
                    <xsl:when test="@name='field-rooms-view'">
                       <li>
                        <xsl:call-template name="options">
                           <xsl:with-param name="id"><xsl:value-of select="value/item/@id"/></xsl:with-param>
                           <xsl:with-param name="title"><xsl:value-of select="value/item/@name"/></xsl:with-param>
                       </xsl:call-template>
                        </li>
                    </xsl:when>
                </xsl:choose>
            </ul>
        </xsl:for-each>

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
    <xsl:template name="options">
        <xsl:param name="id"/>
        <xsl:param name="title"/>
        <xsl:value-of select="document(concat('udata://custom/optionslang/', $id, '/', php:function('urlencode', string($title))))/udata"/>
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
            <strong>&room-view;:</strong>&#160;
            <xsl:call-template name="options">
                <xsl:with-param name="id"><xsl:value-of select="./@id"/></xsl:with-param>
                <xsl:with-param name="title"><xsl:value-of select="./@name"/></xsl:with-param>
            </xsl:call-template>
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
    <xsl:template name="aside">
        <xsl:variable name="group" select="//group[@name='field-group-aside']"/>
        <aside id="sidebar" class="col-sm-4 col-md-3 hidden-xs">
            <div class="sidebar-box clearfix">
               <xsl:choose>
                   <xsl:when test="$parent-uri = concat($lang-prefix, '/accommodation/')">
                       <div class="col-xs-12">
                           <h3 class="sidebar-box-title">
                               <xsl:value-of select="$page-name"/>
                           </h3>
                           <!--<div class="sidebar-box-price">
                               <h4 class="sidebar-box-price-title">
                                   &price;
                               </h4>
                               &from;&#160;<span>$<xsl:value-of select="$UpageEn//property[@name = 'field-rooms-cost']/value"/></span>&#160;&day;
                           </div>-->
                       </div>
                           <div class="col-xs-12">
                               <a class="btn btn-primary black"
                                  href="#wide-form">&booking-now;</a>
                           </div>
                   </xsl:when>
                   <xsl:otherwise>
                       <div class="col-xs-12">
                           <xsl:value-of select="$group/property[@name='field-aside-content']/value" disable-output-escaping="yes"/>
                       </div>
                       <xsl:if test="$group/property[@name='field-aside-link']/value">
                           <div class="col-xs-12">
                               <a class="btn btn-primary black"
                                  href="{$group/property[@name='field-aside-link']/value}"><xsl:value-of select="$group/property[@name='field-aside-button']/value"/></a>
                           </div>
                       </xsl:if>
                   </xsl:otherwise>
               </xsl:choose>

            </div>
        </aside>
    </xsl:template>
    <xsl:template name="contacts">
        <section id="sections-contacts" class="sections-inner-page sections-contacts">
            <div class="col-md-12 pull-center col-xs-12">
                <div class="pull-center col-md-12 cover col-xs-12 " id="map">
                </div>
                <div class="pull-left col-md-6 col-xs-12 sections-inner-intro hidden-xs">
                    <xsl:value-of select="$contacts//property[@name='content']/value"
                                  disable-output-escaping="yes"/>
                    <div class="col-xs-8 pull-center social hidden">
                        <div class="col-xs-2">
                            <div class="box box-type-title facebook">
                                <div class="box-content">
                                    <a href="/hotels/the-bloomsbury-hotel/sections-inner-suites">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="box box-type-title instagram">
                                <div class="box-content">
                                    <a href="/hotels/the-bloomsbury-hotel/sections-inner-suites">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="box box-type-title linkedin">
                                <div class="box-content">
                                    <a href="/hotels/the-bloomsbury-hotel/sections-inner-suites">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="box box-type-title vk">
                                <div class="box-content">
                                    <a href="/hotels/the-bloomsbury-hotel/sections-inner-suites">
                                        <i class="fa fa-vk"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="box box-type-title linkedin">
                                <div class="box-content">
                                    <a href="/hotels/the-bloomsbury-hotel/sections-inner-suites">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="box box-type-title vk">
                                <div class="box-content">
                                    <a href="/hotels/the-bloomsbury-hotel/sections-inner-suites">
                                        <i class="fa fa-vk"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
</xsl:stylesheet>
