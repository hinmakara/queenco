<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0"
                   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                   xmlns:umi="http://www.umi-cms.ru/TR/umi">


    <xsl:template match="udata[@method = 'lastlist']" mode="baners-bx">
   <div class="bx-main">
       <ul class="bxslider">
            <xsl:apply-templates select="items/item"  mode="baners-bx" />
        </ul></div>
    </xsl:template>


    <xsl:template match="item"  mode="baners-bx">
        <xsl:variable name="page" select="document(concat('upage://', @id))"/>
        <li>
            <div class="parallax-container top">
                <div class="captions"><h2><xsl:value-of select="$page//property[@name='h2']/value"/></h2>
                    <xsl:value-of select="$page//property[@name='h3']/value"/>
                </div>
                <div class="parallax-top">
                    <xsl:call-template name="thumbnail">
                    <xsl:with-param name="src"><xsl:value-of select="$page//property[@name='baners_img']/value"/></xsl:with-param>
                    <xsl:with-param name="height">2000</xsl:with-param>
                    <xsl:with-param name="width">2000</xsl:with-param>
                    <xsl:with-param name="quality">5</xsl:with-param>
                    <xsl:with-param name="item">5</xsl:with-param>

                </xsl:call-template></div>
            </div>


        </li>
    </xsl:template>
</xsl:stylesheet>