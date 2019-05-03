<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="udata[@module = 'menu' and @method = 'draw']" mode="main">
		<nav id="main-nav" class="nav-hide">
		<ul>
		<xsl:apply-templates select="item" mode="main" />
		</ul>
		</nav>
	</xsl:template>

	<xsl:template match="item" mode="main">
		<li>
			<xsl:if test="@status = 'active'">
				<xsl:attribute name="class">current-menu-item</xsl:attribute>
			</xsl:if>
			<a href="{@link}">
				<xsl:value-of select="node()" />
			</a>
		</li>
	</xsl:template>

	<xsl:template match="item[.//item]" mode="main">
		<li>
			<xsl:if test="@status = 'active' or item[.//item[@status = 'active']]">
				<xsl:attribute name="class">current-menu-item</xsl:attribute>
			</xsl:if>
			<a href="{@link}">
				<xsl:value-of select="node()" />
			</a>
			<ul class="sub-menu" >
			<xsl:for-each select="items/item">
				<li>
					<xsl:if test="@status = 'active'">
						<xsl:attribute name="class">current-menu-item</xsl:attribute>
					</xsl:if>
					<a href="{@link}">
						<xsl:value-of select="node()" />
					</a>
				</li>
			</xsl:for-each>
			</ul>
		</li>
	</xsl:template>


	<!-- Header menu -->
	<xsl:template match="udata[@module = 'menu']" mode="footer-menu">
		<ul>
			<xsl:apply-templates select="item" mode="footer-menu" />
		</ul>
	</xsl:template>

	<xsl:template match="udata[@module = 'menu']/item" mode="footer-menu">
		<li>
			<a href="{@link}">
				<xsl:value-of select="node()" />
			</a>
		</li>
	</xsl:template>

	<xsl:template match="udata[@module = 'menu']/item[@link = '/booking/']" mode="info-pages-head">
		<li>
			<a href="{@link}" class="help">
				<xsl:value-of select="node()" />
			</a>
		</li>
	</xsl:template>

	<xsl:template match="udata/items" mode="lang">
		<nav id="lang-nav" class="pull-right">
			<ul><li class="pull-right">
					<span><img src="/images/lang_icon/{item[@is-current='1']/@prefix}.png" class="select"/></span>
			</li><xsl:apply-templates select="item" mode="lang"/></ul>
		</nav>
	</xsl:template>

	<xsl:template match="item" mode="lang">
			<li>
				<a href="/">
					<xsl:if test="not(@is-default)">
						<xsl:attribute name="href">/<xsl:value-of select="@prefix"/></xsl:attribute>
					</xsl:if>
					<img src="/images/lang_icon/{@prefix}.png"/>
				</a>
		</li>
	</xsl:template>
	<xsl:template match="item[@is-current='1']" mode="lang">
	</xsl:template>
</xsl:stylesheet>