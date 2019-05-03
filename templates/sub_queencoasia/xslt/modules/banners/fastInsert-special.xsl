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
    <xsl:template match="udata[@module = 'banners'][@method = 'multipleFastInsert']" mode="main-special"></xsl:template>
    <xsl:template match="udata[@module = 'banners'][@method = 'multipleFastInsert'][banners]" mode="main-special">
        <section id="hook">
            <div class="clearfix" id="special-carousel">
             <xsl:for-each select="banners">
               <xsl:variable name="object" select="document(concat('uobject://', @id))"/>
                <div>
                 <a href="/banners/go_to/{@id}/">
                  <div class="thumbnail">
                   <img src="{document(concat('udata://system/makeThumbnailFull/(.', banner/source, ')/392/392/void/0/1/5/0/80'))/udata/src}"/>
                    <div class="caption">
                     <xsl:value-of select="$object//property[@name='field-banners-h']/value" disable-output-escaping="yes"/>
                      <xsl:value-of select="$object//property[@name='field-banners-d']/value" disable-output-escaping="yes"/>
                    </div>
                  </div>
                 </a>
                </div>
             </xsl:for-each>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>