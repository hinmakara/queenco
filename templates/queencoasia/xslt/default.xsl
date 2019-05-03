<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet	version="1.0"
				   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				   xmlns:xlink="http://www.w3.org/TR/xlink">

	<xsl:output doctype-system="about:legacy-compat" method="html" encoding="utf-8"/>

	<xsl:variable name="errors"	select="document('udata://system/listErrorMessages')/udata"/>

	<xsl:variable name="lang-prefix" select="/result/@pre-lang" />
	<xsl:variable name="lang" select="/result/@lang" />
	<xsl:variable name="default_lang" select="document('udata://system/getLangsList')/udata/items/item[@is-default = '1']/@prefix" />

	<xsl:variable name="document-page-id" select="/result/@pageId" />
	<xsl:variable name="document-title" select="/result/@title" />
	<xsl:variable name="user-type" select="/result/user/@type" />
	<xsl:variable name="request-uri" select="/result/@request-uri" />
	<xsl:variable name="parent-uri" select="concat($lang-prefix, /result/parents/page/@link)" />
	<xsl:variable name="parent-upage" select="document(concat('upage://', $lang-prefix, /result/parents/page/@id))/udata" />
	<xsl:variable name="domain" select="/result/@domain" />
	<xsl:variable name="type_name" select="document(concat('utype://', /result/page/@type-id))/udata/type/@title" />

	<xsl:variable name="GetCurrentPageId" select="document(concat('udata://custom/getLanguage/(',$request-uri,')/',$lang))/udata"/>
	<xsl:variable name="UpageEn" select="document(concat('upage://',$GetCurrentPageId))/udata/page"/>

	<xsl:variable name="banners" select="document(concat('uobject://', ancestor::banners/@id))"/>
	<xsl:variable name="slider" select=".//group[@name='field-group-gallery']"/>

	<xsl:variable name="site-info" select="document(concat('upage://', $lang-prefix, 'template_page'))//group[@name = 'field-group-site-info']/property" />
	<xsl:variable name="site-info-page" select="document(concat('upage://', $lang-prefix, 'template_page'))" />
	<xsl:variable name="contacts" select="document(concat('upage://', $lang-prefix, 'about/contacts'))"/>
	<xsl:variable name="error-page" select="document(concat('upage://', $lang-prefix, 'notfound'))"/>

	<xsl:variable name="user-id" select="/result/user/@id" />
	<xsl:variable name="user-info" select="document(concat('uobject://', $user-id))" />

	<xsl:variable name="module" select="/result/@module" />
	<xsl:variable name="method" select="/result/@method" />

	<xsl:variable name="hasbanners" select="document(concat('udata://banners/multipleFastInsert/top-', $lang))/udata/banners"/>
	<xsl:variable name="hasslider" select="$slider/property"/>
	<xsl:variable name="is-aside" select="//property[@name='field-aside-float']/value = 1" />
	<xsl:variable name="hide-booking-form" select="//property[@name='field-booking-disable']/value = 1" />
	<xsl:variable name="page-name" select="/result/page/name" />

	<xsl:param name="p">0</xsl:param>

	<xsl:param name="search_string" />

	<xsl:include href="layouts/default.xsl" />
	<xsl:include href="library/common.xsl" />
	<xsl:include href="modules/content/common.xsl" />
	<xsl:include href="modules/users/common.xsl" />
	<xsl:include href="modules/data/common.xsl" />
	<xsl:include href="modules/search/common.xsl" />
	<xsl:include href="modules/news/common.xsl" />

	<xsl:include href="modules/webforms/common.xsl" />
	<xsl:include href="modules/banners/common.xsl" />
	<xsl:include href="modules/blogs20/common.xsl" />


	<xsl:include href="modules/filemanager/common.xsl" />
	<xsl:include href="modules/photoalbum/common.xsl" />
	<xsl:include href="modules/vote/common.xsl" />
	<xsl:include href="modules/menu/common.xsl" />

	<xsl:include href="modules/all-pages.xsl" />


</xsl:stylesheet>