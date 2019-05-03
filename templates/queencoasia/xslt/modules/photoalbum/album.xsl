<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0"
				   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				   xmlns:date="http://exslt.org/dates-and-times"
				   xmlns:udt="http://umi-cms.ru/2007/UData/templates"
				   xmlns:umi="http://www.umi-cms.ru/TR/umi"
				   exclude-result-prefixes="xsl date udt umi">

	<xsl:template match="result[@module = 'photoalbum'][@method = 'album']">
		<div class="clearfix">
			<div class="container">
				<div class="row">
					<div class="span12">
						<div class="content_box_padding">
							<xsl:apply-templates select="document(concat('udata://photoalbum/album/',$document-page-id, '?extProps=h1,descr'))/udata" />
						</div>
					</div>
				</div>
			</div></div>

	</xsl:template>

	<xsl:template match="udata[@module = 'photoalbum'][@method = 'album']">

		<xsl:value-of select="document(concat('upage://',id,'.descr'))/udata/property/value" disable-output-escaping="yes" />

	</xsl:template>

	<xsl:template match="udata[@module = 'photoalbum'][@method = 'album'][total]">
		<div id="portfolio-grid" class="portfolio-spaced clearfix">
		<xsl:apply-templates select="items/item" />
	</div>
		<div class="col-xs-12">
		<xsl:apply-templates select="total" />
		</div>
	</xsl:template>

	<xsl:template match="udata[@module = 'photoalbum' and @method = 'album']/items/item">
		<div class="col-xs-6 col-sm-4 col-md-3 masonry-item">
			<xsl:variable name="src" select="document(concat('upage://', @id))/udata//property[@name='photo']/value" />
			<a href="{document(concat('udata://system/makeThumbnailFull/(.', $src, ')/2000/950/void/0/1/5/0/100'))/udata/src}" class="easy-opener" data-type="image" data-gallery="gal">
				<img src="{document(concat('udata://system/makeThumbnailFull/(.', $src, ')/600/600/void/0/1/5/0/100'))/udata/src}" />
			</a>
		</div>

	</xsl:template>

</xsl:stylesheet>