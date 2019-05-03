<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0"
                   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                   xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="/result[@module = 'news'][@method = 'rubric']" mode="blog">
        <xsl:apply-templates select="document('udata://news/lastlist/?extProps=publish_time,anons')" mode="blog"/>
    </xsl:template>

    <xsl:template match="udata[@method = 'lastlist']" mode="blog">
        <section class="clearfix container-fluid" id="main-block">
            <h2 class="underline pull-center"><xsl:value-of select="document(concat('upage://', category_id, '.h1'))//value"/></h2>
            <div class="pull-center"></div>
        </section>
        <div class="col-xs-12 col-md-8 pull-center clearfix">
            <xsl:apply-templates select="items/item" mode="blog" />
        </div>
        <section class="main-page clearfix">
            <div class="col-xs-12">
                <xsl:apply-templates select="total" />
            </div>
        </section>
    </xsl:template>


    <xsl:template match="item" mode="blog">

        <section class="blog-cell clearfix">
            <xsl:if test="position() mod 2 = 0">
                <xsl:attribute name="class">blog-cell pull-right clearfix</xsl:attribute>
            </xsl:if>
            <div class="blog-image-box col-xs-12 col-md-5">
                <div class="box">
                    <div class="box-content">
                        <a class="sm-image-crop" href="{@link}">
                            <xsl:call-template name="catalog-thumbnail">
                                <xsl:with-param name="element-id" select="@id" />
                                <xsl:with-param name="field-name">anons_pic</xsl:with-param>
                                <xsl:with-param name="empty">&empty-photo;</xsl:with-param>
                                <xsl:with-param name="width">400</xsl:with-param>
                                <xsl:with-param name="height">300</xsl:with-param>
                            </xsl:call-template>
                        </a>
                    </div>
                </div>
            </div>
            <div class="blog-content-box col-xs-12 col-md-7">
                <div class="box">
                    <div class="box-content">
                        <h5 class="blog-date">
                            <xsl:apply-templates select=".//property[@name = 'publish_time']"/>
                        </h5>
                        <h3>
                            <a href="{@link}">
                                <xsl:value-of select="node()" />
                            </a>
                          </h3>
                        <xsl:value-of select=".//property[@name = 'anons']/value" disable-output-escaping="yes" />
                        <a href="{@link}" class="blog-link">&more-info;</a>
                        <!-- Social links -->
                        <div class="social-box text-center">
                            <a href="http://www.facebook.com/sharer.php?u=http://{$domain}{$lang-prefix}{@link}" target="_blank"><i class="fa fa-facebook"></i><span class="hidden">facebook</span></a>
                            <a href="http://twitter.com/share?text={node()}&amp;url=http://{$domain}{$lang-prefix}{@link}" target="_blank"><i class="fa fa-twitter fa-twitter-sm"></i><span class="hidden">twitter</span></a>
                            <a href="http://www.tumblr.com/share/link?url=http://{$domain}{$lang-prefix}{@link}&amp;description={node()}" target="_blank"><i class="fa fa-tumblr"></i><span class="hidden">tumbler</span></a>
                            <a href="http://pinterest.com/pin/create/button/?media=http://{$domain}{$lang-prefix}{@link}{.//property[@name='anons_pic']/value}&amp;description={node()} &amp;url=http://{$domain}{$lang-prefix}{@link}" target="_blank"><i class="fa fa-pinterest"></i><span class="hidden">pinterest</span></a>
                            <a href="http://plus.google.com/share?url=http://{$domain}{$lang-prefix}{@link}" target="_blank"><i class="fa fa-google-plus"></i><span class="hidden">google+</span></a>
                        </div>
                        <!-- /Social links -->
<!--
                        <dl>
                            <dt>Filed under:</dt>
                            <dd><a href="/blog/(hotel)/145">The River Lee</a></dd>
                        </dl>-->
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
</xsl:stylesheet>