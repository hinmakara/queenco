<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <!-- more rooms slider -->
    <xsl:template match="udata[@method = 'menu']" mode="more-rooms">
        <section class="more-items">
            <hr/>
            <div class="container-fluid" >
                    <h3 class="text-center">&more-rooms;</h3>
                <ul id="flexslider-carousel">
                    <xsl:for-each select="items/item[not(@status = 'active')]">
                        <xsl:variable name="GetCurrentPage" select="document(concat('udata://custom/getLanguage/(',@link,')/',$lang))/udata"/>
                        <xsl:variable name="Upage" select="document(concat('upage://',$GetCurrentPage))/udata/page"/>
                        <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
                        <li>
                            <a href="{@link}">
                            <div class="inner-intro">
                                <xsl:call-template name="thumbnail">
                                    <xsl:with-param name="src">
                                        <xsl:value-of select="$Upage//property[@name='field-gallery-img1']/value"/>
                                    </xsl:with-param>
                                    <xsl:with-param name="height">315</xsl:with-param>
                                    <xsl:with-param name="width">560</xsl:with-param>
                                </xsl:call-template>
                                <h2 class="products-title"><xsl:value-of select="."/></h2>
                                <span class="inner-intro-rooms">
                                    <strong>&room-size;:</strong>&#160;<xsl:value-of
                                        select="$Upage//property[@name = 'field-rooms-area']/value"/>м
                                    <sup>2</sup>
                                </span>
                                <span class="inner-intro-rooms">
                                    <xsl:variable name="view"
                                                  select="$Upage//property[@name='field-rooms-view']/value/item"/>
                                    <strong>&room-view;:</strong>&#160;
                                    <xsl:call-template name="options">
                                        <xsl:with-param name="id"><xsl:value-of select="$view/@id"/></xsl:with-param>
                                        <xsl:with-param name="title"><xsl:value-of select="$view/@name"/></xsl:with-param>
                                    </xsl:call-template>
                                </span>
                                <div class="price">&from; <span class="big"> $<xsl:value-of
                                        select="$Upage//property[@name = 'field-rooms-cost']/value"/></span> /&day;</div>

                            </div>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </section>
    </xsl:template>

    <xsl:template match="item" mode="more-inner">
        <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
        <div class="tiles-item">
            <div class="inner_wrap">
                <xsl:call-template name="catalog-thumbnail">
                    <xsl:with-param name="element-id" select="@id"/>
                    <xsl:with-param name="field-name">photo1</xsl:with-param>
                    <xsl:with-param name="height">350</xsl:with-param>
                </xsl:call-template>
                <div class="desc">
                    <a href="{@link}">
                        <div class="desc_inner">
                            <h5>
                                <xsl:value-of select="."/>
                                <br/>$<xsl:value-of select="$page//property[@name = 'cost']/value"/>
                            </h5>
                            <div class="excerpt">
                                <hr/>
                                <xsl:value-of select="$page//property[@name = 'feature']/value"/>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="item[@status = 'active']" mode="more-rooms">

    </xsl:template>
    <!-- Header menu -->
    <xsl:template match="udata[@module = 'usel']" mode="info-pages-head">
        <ul umi:element-id="0" umi:module="content" umi:add-method="none" umi:region="list" umi:sortable="sortable">
            <xsl:apply-templates select="page" mode="info-pages-head"/>
        </ul>
    </xsl:template>

    <xsl:template match="udata[@module = 'usel']/page" mode="info-pages-head">
        <li umi:element-id="{@id}" umi:region="row">
            <a href="{@link}" umi:field-name="name" umi:empty="&empty-section-name;" umi:delete="delete">
                <xsl:value-of select="name"/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="udata[@module = 'usel']/page[@alt-name = 'help']" mode="info-pages-head">
        <li umi:element-id="{@id}" umi:region="row">
            <a href="{@link}" class="help" umi:field-name="name" umi:empty="&empty-section-name;" umi:delete="delete">
                <xsl:value-of select="name"/>
            </a>
        </li>
    </xsl:template>

    <!-- Top menu -->
    <xsl:template match="udata[@method = 'menu']" mode="top_menu">
        <div id="top_menu" umi:element-id="0" umi:module="content" umi:region="list" umi:sortable="sortable"
             umi:add-method="popup">
            <xsl:apply-templates select="items/item" mode="top_menu"/>
        </div>
    </xsl:template>

    <xsl:template match="item" mode="top_menu">
        <a href="{@link}" umi:element-id="{@id}" umi:region="row" umi:field-name="name" umi:empty="&empty-section-name;"
           umi:delete="delete">
            <xsl:value-of select="."/>
        </a>
    </xsl:template>

</xsl:stylesheet>