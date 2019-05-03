<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM  "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:umi="http://www.umi-cms.ru/TR/umi">

  <xsl:template match="result[@module = 'content']">
    <xsl:choose>

      <xsl:when test="$type_name = 'Основные страницы'">
        <xsl:for-each select="document(concat('usel://inner-page/',$document-page-id))/udata/page">
          <!-- for each link get id in main lang after get img -->
          <xsl:variable name="CurId"
                        select="document(concat('udata://custom/getLanguage/(', @link,')/',$lang))/udata"/>
          <xsl:variable name="UEn" select="document(concat('upage://',$CurId))/udata/page"/>
          <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
          <section class="container-fluid sections-inner-page sections-inner-list">
            <div class="clearfix">
              <xsl:if test="$page//property[@name='field-proportions-to-main-block'] or $page//property[@name='field-proportions-to-main-float']">
                <xsl:attribute name="class">
                  <xsl:apply-templates
                          select="$page//property[@name='field-proportions-to-main-block']"
                          mode="class"/>
                  <xsl:apply-templates
                          select="$page//property[@name='field-proportions-to-main-float']"
                          mode="class"/>
                  <xsl:text> clearfix</xsl:text>
                </xsl:attribute>
              </xsl:if>
              <div class="col-xs-6 cover">
                <xsl:if test="$page//property[@name='field-proportions-to-main-img' or @name='field-proportions-to-main-img-float']">
                  <xsl:attribute name="class">
                    <xsl:apply-templates
                            select="$page//property[@name='field-proportions-to-main-img']"
                            mode="class"/>
                    <xsl:apply-templates
                            select="$page//property[@name='field-proportions-to-main-img-float']"
                            mode="class"/>
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
                    <xsl:apply-templates
                            select="$page//property[@name='field-proportions-to-main-content']"
                            mode="class"/>
                    <xsl:apply-templates
                            select="$page//property[@name='field-proportions-to-main-content-float']"
                            mode="class"/>
                    <xsl:text> sections-inner-intro</xsl:text>
                  </xsl:attribute>
                </xsl:if>
                <div class="sections-inner-title">
                  <xsl:choose>
                    <xsl:when test="$request-uri = concat($lang-prefix, '/accommodation/')">
                      <a href="{@link}">
                        <h2>
                          <xsl:value-of select="name"/>
                        </h2>
                      </a>

                    </xsl:when>
                    <xsl:otherwise>
                      <div class="sections-inner-title">
                        <h2>
                          <xsl:value-of select="name"/>
                        </h2>
                      </div>
                    </xsl:otherwise>
                  </xsl:choose>
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
                <xsl:if test="$request-uri = concat($lang-prefix, '/accommodation/')">
                  <div>
                    <a href="{@link}" class="btn btn-primary black">&read-more-and-booking;</a>
                  </div>
                </xsl:if>

              </div>
            </div>
          </section>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$type_name = 'Номера'">
        <!-- include maincontent sections-->
        <section class="container-fluid clearfix" id="main-block">
          <div class="col-xs-12 pull-center clearfix description">
            <!-- <xsl:if test="$is-aside = true() or $parent-uri = concat($lang-prefix, '/accommodation/')">
                 <xsl:attribute name="class">col-xs-12 col-sm-8 col-md-9 clearfix description</xsl:attribute>
             </xsl:if>-->
            <xsl:apply-templates select="//property[@name='h1']/value"/>
            <xsl:value-of select="//property[@name='content']/value" disable-output-escaping="yes"/>
            <xsl:apply-templates select="//group[@name ='field-group-special']" mode="rooms"/>
          </div>
          <!-- <xsl:if test="$is-aside = true() or $parent-uri = concat($lang-prefix, '/accommodation/')">
               <xsl:call-template name="aside"/>
           </xsl:if>-->
        </section>
        <!-- select inner page -->
        <xsl:for-each select="document(concat('usel://inner-page/',$document-page-id))/udata/page">
          <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
          <section class="sections-inner-page clearfix" id="{@alt-name}">
            <xsl:call-template name="line">
              <xsl:with-param name="page" select="$page"/>
            </xsl:call-template>
          </section>
        </xsl:for-each>
        <xsl:apply-templates
                select="document(concat('udata://banners/fastInsert/inner-bottom-', $lang))/udata/banner"
                mode="inner-bottom"/>
        <xsl:if test="$parent-upage//property[@name='field-form-select']/value">
          <xsl:apply-templates
                  select="document(concat('udata://webforms/add/', $parent-upage//property[@name='field-form-select']/value))/udata" mode="wide">
            <xsl:with-param name="page" select="$parent-upage"/>
          </xsl:apply-templates>

        </xsl:if>

        <xsl:apply-templates select="document(concat('udata://content/menu/(null)/2/', page/@parentId))"
                             mode="more-rooms"/>

      </xsl:when>
      <xsl:when test="$type_name = 'Казино' or $type_name = 'Рестораны' or $type_name = 'Зоны отдыха'">
        <!-- include maincontent sections-->
        <section class="container-fluid clearfix" id="main-block">
          <div class="col-xs-12 pull-center clearfix description">
            <xsl:if test="$is-aside = true() or $parent-uri = concat($lang-prefix, '/accommodation/')">
              <xsl:attribute name="class">col-xs-12 col-sm-8 col-md-9 clearfix description</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="//property[@name='h1']/value"/>
            <xsl:value-of select="//property[@name='content']/value" disable-output-escaping="yes"/>
            <xsl:apply-templates select="//group[@name ='field-group-special']" mode="rooms"/>
          </div>
          <xsl:if test="$is-aside = true() or $parent-uri = concat($lang-prefix, '/accommodation/')">
            <xsl:call-template name="aside"/>
          </xsl:if>
        </section>
        <!-- select inner page -->
        <xsl:for-each select="document(concat('usel://inner-page/',$document-page-id))/udata/page">
          <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
          <section class="sections-inner-page clearfix" id="{@alt-name}">
            <xsl:call-template name="line">
              <xsl:with-param name="page" select="$page"/>
            </xsl:call-template>
          </section>
        </xsl:for-each>
        <xsl:apply-templates
                select="document(concat('udata://banners/fastInsert/inner-bottom-', $lang))/udata/banner"
                mode="inner-bottom"/>
      </xsl:when>
      <xsl:when test="$type_name = 'Контакты'">
        <section class="clearfix container-fluid contact-form" id="main-block">
          <xsl:apply-templates select="//group[@name='field-group-style']" mode="style"/>
          <div class="clearfix">
            <xsl:apply-templates select="//group[@name='field-group-sections']" mode="class">
              <xsl:with-param name="class">clearfix </xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates select="//property[@name='h1']/value"/>
            <xsl:call-template name="contacts"/>
            <xsl:value-of select="property[@name='field-form-select']/value"/>
            <div class="col-xs-12"><xsl:apply-templates
                    select="document(concat('udata://webforms/add/', .//property[@name='field-form-select']/value))/udata" mode="contacts-form"/></div>
          </div>
        </section>
      </xsl:when>
      <xsl:when test="$type_name = 'Лендинг'">
        <section class="container-fluid sections-promo clearfix">
          <xsl:apply-templates select="//group[@name='field-group-sections']" mode="class">
            <xsl:with-param name="class">clearfix</xsl:with-param>
          </xsl:apply-templates>
          <xsl:for-each select="document(concat('usel://landing/',$document-page-id))/udata/page">
            <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
            <div class="col-xs-6">
              <xsl:if test="$page//group[@name='field-group-proportions']//property/value/item">
                <xsl:attribute name="class">
                  <xsl:apply-templates select="$page//property[@name='field-landing-to-main-block']"
                                       mode="class"/>
                  <xsl:apply-templates select="$page//property[@name='field-landing-to-main-float']"
                                       mode="class"/>
                  <xsl:text> clearfix</xsl:text>
                </xsl:attribute>
              </xsl:if>
              <div class="cover">
                <xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.', $page//property[@name='field-landing-to-main-img']/value, ')/590/390/void/0/1/5/80'))/udata">

                </xsl:apply-templates>
              </div>
              <div class="promo-text-block">
                <div class="sections-inner-intro">
                  <h2>
                    <xsl:value-of
                            select="$page//property[@name='field-landing-to-main-header']/value"/>
                  </h2>
                  <span class="hidden-xs hidden-sm"><xsl:value-of select="$page//property[@name='field-landing-to-main-desc']/value"
                                disable-output-escaping="yes"/></span>
                  <a href="{$page//@link}" class="btn btn-primary">&more;</a>
                </div>
              </div>
            </div>
          </xsl:for-each>
        </section>
      </xsl:when>
      <xsl:when test="$type_name = 'Объекты лендинга'">
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
            <xsl:apply-templates select="//property[@name='h1']/value"/>
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
      </xsl:when>
      <xsl:otherwise>
        <!-- include maincontent sections-->
        <section class="clearfix container-fluid" id="main-block">
          <xsl:apply-templates select="//group[@name='field-group-style']" mode="style"/>
          <div class="clearfix">
            <xsl:apply-templates select="//group[@name='field-group-sections']" mode="class">
              <xsl:with-param name="class">clearfix </xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates select="//property[@name='h1']/value"/>
            <xsl:value-of select="//property[@name='content']/value" disable-output-escaping="yes"/>
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

     <xsl:if test="$hide-booking-form = false()">
       <xsl:call-template name="bwh"/>
     </xsl:if>

    <xsl:apply-templates select="document(concat('udata://banners/multipleFastInsert/special-', $lang, '/'))/udata"
                         mode="main-special"/>
    <xsl:apply-templates select="//group[@name = 'field-group-welcome-seo']" mode="welcome-seo"/>
  </xsl:template>

  <xsl:template name="line" mode="line">
    <xsl:param name="page"/>
    <div class="clearfix container-fluid">
      <xsl:apply-templates select="$page//group[@name='field-group-sections']" mode="class">
        <xsl:with-param name="class">clearfix</xsl:with-param>
      </xsl:apply-templates>
      <xsl:apply-templates select="$page//property[@name='h1']/value"/>
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

  <xsl:template match="//property[@name='h1']/value">
    <h2 class="underline pull-center">
      <xsl:value-of select="."/>
    </h2>
  </xsl:template>

  <xsl:include href="menu.xsl"/>
  <xsl:include href="404.xsl"/>
  <xsl:include href="sitemap.xsl"/>
  <xsl:include href="index.xsl"/>


</xsl:stylesheet>