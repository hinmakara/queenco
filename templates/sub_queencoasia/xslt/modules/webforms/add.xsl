<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                exclude-result-prefixes="xsl date udt xlink"
                >

    <xsl:template match="udata[@module = 'webforms'][@method = 'add']">

        <div class="clearfix">
        <form method="post" action="{$lang-prefix}/webforms/send/"
              onsubmit="site.forms.data.save(this); return site.forms.data.check(this);" enctype="multipart/form-data">
            <input type="hidden" name="system_form_id" value="{/udata/@form_id}"/>
            <input type="hidden" name="ref_onsuccess" value="{$lang-prefix}/webforms_posted/"/>
            <xsl:apply-templates select="items" mode="address"/>
            <xsl:apply-templates select="groups/group" mode="webforms"/>
            <div class="col-xs-12">
                <xsl:apply-templates select="document('udata://system/captcha/')/udata"/>
            <div class="form_element col-xs-4">
                <input type="submit" class="btn btn-primary black" value="&send;"/>
            </div>
            </div>
        </form>
        </div>
    </xsl:template>

    <xsl:template match="group" mode="webforms">
        <xsl:param name="page"/>
        <div class="col-xs-12">
        <h4><xsl:value-of select="@title"/></h4>
        <xsl:apply-templates select="field" mode="webforms"/>
        </div>
    </xsl:template>

    <xsl:template match="field" mode="webforms">
        <div class="form_element">
            <label>
                <xsl:apply-templates select="." mode="webforms_required"/>
                <xsl:apply-templates select="." mode="webforms_input_type"/>
            </label>
        </div>
    </xsl:template>
    <xsl:template match="field[@type = 'text' or @type='wysiwyg']" mode="webforms">
        <div class="form_element">
            <label>
                <xsl:apply-templates select="." mode="webforms_required"/>
                <xsl:apply-templates select="." mode="webforms_input_type"/>
            </label>
        </div>
    </xsl:template>

    <xsl:template match="field" mode="webforms_input_type">
        <input type="text" name="{@input_name}" placeholder="{@title}" class="styler"/>
    </xsl:template>

    <xsl:template match="field[@type = 'text' or @type='wysiwyg']" mode="webforms_input_type">
        <textarea name="{@input_name}" placeholder="{@title}" class="styler"></textarea>
    </xsl:template>

    <xsl:template match="field[@type = 'password']" mode="webforms_input_type">
        <input type="password" name="{@input_name}" value="" placeholder="{@title}" class="styler"/>
    </xsl:template>

    <xsl:template match="field[@type = 'date']" mode="webforms">
        <xsl:param name="now" select="document('udata://system/convertDate/now/(d/m/Y)')"/>

        <div class="form_element">
            <label class="input-group required date">

                <input type="text" name="{@input_name}" placeholder="{@title}" class="styler"
                       data-provide="datepicker" data-date-autoclose="true" data-date-format="dd/mm/yyyy"
                       data-date-start-date="{$now}" data-date-end-date="{$now}"/>
                <span class="input-group-addon">
                    <i class="glyphicon glyphicon-th"></i>
                </span>

            </label>
        </div>
    </xsl:template>

    <xsl:template match="field[@type = 'boolean']" mode="webforms_input_type">
        <label>
            <input id="{@input_name}" name="{@input_name}" type="checkbox"
                   />
            <span>
                <xsl:text> </xsl:text> <xsl:value-of select="@title"/>
            </span>
        </label>
    </xsl:template>

    <xsl:template match="field[@type = 'file' or @type = 'img_file' or @type = 'swf_file' or @type = 'video_file']"
                  mode="webforms_input_type">
        <xsl:text> &max-file-size; </xsl:text><xsl:value-of select="@maxsize"/>Mb
        <input type="file" name="{@input_name}" placeholder="{@title}" class="styler"/>
    </xsl:template>

    <xsl:template match="field[@type = 'relation']" mode="webforms_input_type">

        <select name="{@input_name}" class="width-100" data-z-index="9" data-placeholder="{@title}">
            <xsl:if test="@multiple">
                <xsl:attribute name="multiple">
                    <xsl:text>multiple</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <option></option>
            <xsl:apply-templates select="values/item" mode="webforms_input_type"/>
        </select>
    </xsl:template>

    <xsl:template match="item" mode="webforms_input_type">
        <option value="{@id}">
            <xsl:call-template name="options">
                <xsl:with-param name="id"><xsl:value-of select="@id"/></xsl:with-param>
                <xsl:with-param name="title"><xsl:value-of select="."/></xsl:with-param>
            </xsl:call-template>
        </option>
    </xsl:template>

    <xsl:template match="field" mode="webforms_required"/>

    <xsl:template match="field[@required = 'required']" mode="webforms_required">
        <xsl:attribute name="class">
            <xsl:text>required</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="items" mode="address">
        <xsl:apply-templates select="item" mode="address"/>
    </xsl:template>

    <xsl:template match="item" mode="address">
        <input type="hidden" name="system_email_to" value="{@id}"/>
    </xsl:template>

    <xsl:template match="items[count(item) &gt; 1]" mode="address">
        <xsl:choose>
            <xsl:when test="count(item[@selected='selected']) != 1">
                <div class="form_element">
                    <label class="required">
                        <span>
                            <xsl:text>Кому отправить:</xsl:text>
                        </span>
                        <select name="system_email_to">
                            <option value=""></option>
                            <xsl:apply-templates select="item" mode="address_select"/>
                        </select>
                    </label>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="item[@selected='selected']" mode="address"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="item" mode="address_select">
        <option value="{@id}">
            <xsl:apply-templates/>
        </option>
    </xsl:template>

    <xsl:template match="value" mode="contents">
        <xsl:param name="page"/>
        <div class="pull-center col-xs-12 clearfix">
            <xsl:attribute name="class">
                <xsl:value-of select="//property[@name='field-form-content-proportions']/value/item/@name"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="//property[@name='field-form-content-float']/value/item/@name"/>
                <xsl:text> form-content clearfix</xsl:text>
            </xsl:attribute>
           <xsl:value-of select="." disable-output-escaping="yes"/>
        </div>
    </xsl:template>
</xsl:stylesheet>
