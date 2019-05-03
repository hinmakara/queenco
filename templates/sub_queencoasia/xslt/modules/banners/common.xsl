<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet	version="1.0"
					xmlns="http://www.w3.org/1999/xhtml"
					xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
					xmlns:date="http://exslt.org/dates-and-times"
					xmlns:udt="http://umi-cms.ru/2007/UData/templates"
					xmlns:xlink="http://www.w3.org/TR/xlink"
					exclude-result-prefixes="xsl date udt xlink">
	<xsl:template match="group" mode="header">
		<xsl:variable name="class">
			<xsl:text>custom-caption </xsl:text>
			<xsl:value-of select=".//property[starts-with(@name, 'field-banners-data-x')]/value/item/@name"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select=".//property[starts-with(@name, 'field-banners-data-y')]/value/item/@name"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select=".//property[starts-with(@name, 'field-banners-color')]/value/item/@name"/>
			<xsl:text> </xsl:text>
			<xsl:for-each select=".//property[starts-with(@name, 'field-banners-caption-proportions')]/value/item">
				<xsl:value-of select="@name"/><xsl:text> </xsl:text>
			</xsl:for-each>
			<xsl:if test="not(.//property[starts-with(@name, 'field-banners-caption-proportions')]/value/item/@name)">
				col-xs-4
			</xsl:if>
		</xsl:variable>
		<div>
			<xsl:attribute name="class">
				<xsl:value-of select="normalize-space($class)" />
			</xsl:attribute>
			<div class="captions-header">
				<xsl:value-of select=".//property[starts-with(@name, 'field-banners-h')]/value" disable-output-escaping="yes"/>
			</div>
			<div class="captions-content">
				<xsl:value-of select=".//property[starts-with(@name, 'field-banners-d')]/value" disable-output-escaping="yes"/>
			</div>
		</div>
	</xsl:template>
	<xsl:include href="fastInsert.xsl" />
	<xsl:include href="fastInsert-special.xsl" />
	<xsl:include href="fastInsert-inner-bottom.xsl" />

</xsl:stylesheet>