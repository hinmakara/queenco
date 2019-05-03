<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:umi="http://www.umi-cms.ru/TR/umi"
	xmlns:xlink="http://www.w3.org/TR/xlink">

	<xsl:template match="/result[@module = 'news'][@method = 'item']">
		<section class="clearfix container-fluid" id="main-block">
			<div class="col-xs-10 pull-center text-left clearfix ">


			<h2 class="underline pull-center"><xsl:value-of select=".//property[@name='h1']/value"/></h2>
				<h5 class="blog-date">
					<xsl:apply-templates select=".//property[@name = 'publish_time']"/>
				</h5>
				<h6 class="text-center"><xsl:value-of select=".//property[@name='anons']/value" disable-output-escaping="yes"/></h6>
				<div class="social-box text-center">
					<a href="http://www.facebook.com/sharer.php?u=http://{$domain}{$lang-prefix}{@link}" target="_blank"><i class="fa fa-facebook"></i><span class="hidden">facebook</span></a>
					<a href="http://twitter.com/share?text={node()}&amp;url=http://{$domain}{$lang-prefix}{@link}" target="_blank"><i class="fa fa-twitter fa-twitter-sm"></i><span class="hidden">twitter</span></a>
					<a href="http://www.tumblr.com/share/link?url=http://{$domain}{$lang-prefix}{@link}&amp;description={node()}" target="_blank"><i class="fa fa-tumblr"></i><span class="hidden">tumbler</span></a>
					<a href="http://pinterest.com/pin/create/button/?media=http://{$domain}{$lang-prefix}{@link}{.//property[@name='anons_pic']/value}&amp;description={node()} &amp;url=http://{$domain}{$lang-prefix}{@link}" target="_blank"><i class="fa fa-pinterest"></i><span class="hidden">pinterest</span></a>
					<a href="http://plus.google.com/share?url=http://{$domain}{$lang-prefix}{@link}" target="_blank"><i class="fa fa-google-plus"></i><span class="hidden">google+</span></a>
				</div>
				<div class="col-xs-12 col-md-8 pull-center">
					<xsl:call-template name="catalog-thumbnail">
						<xsl:with-param name="element-id" select="@pageId" />
						<xsl:with-param name="field-name">publish_pic</xsl:with-param>
						<xsl:with-param name="empty">&empty-photo;</xsl:with-param>
						<xsl:with-param name="width">800</xsl:with-param>
						<xsl:with-param name="height">600</xsl:with-param>
					</xsl:call-template>
				</div>
			<xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes" />

		</div>
			<div class="col-xs-10 pull-center">
				<xsl:apply-templates select="document('udata://news/related_links')" />
			</div>

</section>
</xsl:template>

<xsl:template match="udata[@method = 'related_links']" />

<xsl:template match="udata[@method = 'related_links' and count(items/item)]">
<h4>
<xsl:text>&news-realted;</xsl:text>
</h4>

<ul>
<xsl:apply-templates select="items/item" mode="related" />
</ul>
</xsl:template>

<xsl:template match="item" mode="related">
<li umi:element-id="{@id}">
<a href="{@link}" umi:field-name="news">
    <xsl:value-of select="." />
</a>
</li>
</xsl:template>

</xsl:stylesheet>