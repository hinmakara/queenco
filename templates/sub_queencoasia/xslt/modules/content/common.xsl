<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM  "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:umi="http://www.umi-cms.ru/TR/umi">

  <xsl:template match="result[@module = 'content']">
      <xsl:if test="document(concat('usel://landing/',$document-page-id,'/field-landing-menu'))/udata/total > 1">
          <nav id="landing-nav" class="col-xs-12 hidden-xs">
              <ul class="col-xs-11 pull-center">
                  <li>
                      <a href="#page-content" class="scroll-to">&top;</a>
                  </li>
                  <xsl:for-each
                          select="document(concat('usel://landing-menu/',$document-page-id,'/field-landing-menu'))/udata/page">
                      <li>
                          <a href="#{@alt-name}" class="scroll-to">
                              <xsl:value-of select="name"/>
                          </a>
                      </li>
                  </xsl:for-each>
              </ul>
          </nav>
      </xsl:if>
      <!-- include maincontent sections-->
      <section class="clearfix container-fluid promo-page" id="main-block">
          <xsl:apply-templates select="//group[@name='field-group-style']" mode="style"/>
          <div class="clearfix">
              <xsl:apply-templates select="//group[@name='field-group-sections']" mode="class">
                  <xsl:with-param name="class">clearfix </xsl:with-param>
              </xsl:apply-templates>
              <xsl:apply-templates select="//property[@name='h1']/value" mode="header"/>
              <xsl:value-of select="//property[@name='content']/value" disable-output-escaping="yes"/>
          </div>
      </section>
      <!-- select inner page -->
      <xsl:for-each select="document(concat('usel://landing/',$document-page-id))/udata/page">
          <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
          <section class="sections-inner-page promo-page clearfix" id="{@alt-name}">
              <xsl:apply-templates select="$page//group[@name='field-group-style']" mode="style"/>
              <xsl:call-template name="line">
                  <xsl:with-param name="page" select="$page"/>
              </xsl:call-template>
          </section>
      </xsl:for-each>
  </xsl:template>


<xsl:template match="result" mode="header">
    <!-- REVOLUTION SLIDER -->
    <xsl:if test="$hasbanners or $slider">
        <section id="home" class="no-padding">
            <div class="home-slider-container">
                <div class="home-slider" data-type="hero">
                    <xsl:if test="count($hasbanners) > 1 or count($hasslider) > 1">
                        <xsl:attribute name="data-type">standart</xsl:attribute>
                    </xsl:if>
                    <ul>
                        <xsl:apply-templates
                                select="document(concat('udata://banners/multipleFastInsert/top-', $lang))/udata"
                                mode="main"/>
                        <xsl:apply-templates select="$UpageEn//group[@name='field-group-gallery']" mode="slider"/>
                    </ul>
                </div>
            </div>
        </section>
    </xsl:if>
    <!-- END REVOLUTION SLIDER -->
    <xsl:apply-templates select="document(concat('udata://banners/multipleFastInsert/special-', $lang, '/'))/udata"
                         mode="main-special"/>
    <xsl:apply-templates select="//group[@name = 'field-group-welcome-seo']" mode="welcome-seo"/>
</xsl:template>
    <xsl:template match="value" mode="header">
        <h2 class="underline">
            <xsl:value-of select="."/>
        </h2>
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
<!-- Inner promo and landing page -->
    <xsl:template name="line" mode="line">
        <xsl:param name="page"/>
        <div class="clearfix container-fluid">
            <xsl:apply-templates select="$page//group[@name='field-group-sections']" mode="class">
                <xsl:with-param name="class">clearfix</xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates select="$page//property[@name='h1']/value" mode="header"/>
            <xsl:choose>
                <xsl:when test="basetype/@module = 'webforms'">
                    <xsl:apply-templates
                            select="document(concat('udata://webforms/add/', $page//property[@name='form_id']/value))/udata" mode="landing">
                        <xsl:with-param name="page" select="$page"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="basetype/@module = 'photoalbum'">
                    <xsl:apply-templates select="document(concat('udata://photoalbum/album/', @id, '//10'))/udata"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$page//property[@name='content']/value" disable-output-escaping="yes"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="document(concat('usel://landing/',@id))/udata/page">
                <xsl:call-template name="line">
                    <xsl:with-param name="page" select="document(concat('upage://', @id))/udata/page"/>
                </xsl:call-template>
            </xsl:for-each>
        </div>
    </xsl:template>

  <xsl:include href="menu.xsl"/>
  <xsl:include href="404.xsl"/>
  <xsl:include href="sitemap.xsl"/>
</xsl:stylesheet>