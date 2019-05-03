<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="udata[@method='navibar']">
        <ul class="breadcrumb breadcrumb__t">
            <li><a href="{result/@pre-lang}/">&home;</a></li>
            <xsl:apply-templates select="items/item" />
        </ul>
    </xsl:template>

    <xsl:template match="udata[@method='navibar']/items/item">
        <li class="divider"></li><li><a class="crumb" href="{@link}"><xsl:value-of select="node()" /></a></li>
    </xsl:template>

    <xsl:template match="udata[@method='navibar']/items/item[last()]">
        <li class="divider"></li><li class="active"><xsl:value-of select="node()" /></li>
    </xsl:template>

</xsl:stylesheet>


