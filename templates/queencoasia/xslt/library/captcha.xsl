<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="udata[@module = 'system' and @method = 'captcha']" />

	<xsl:template match="udata[@module = 'system' and @method = 'captcha' and count(url)]">
		<div class="form_element col-xs-12 col-xs-6">
				<label class="required">
					<div class="img col-xs-6"><img src="{url}{url/@random-string}" id="captcha_img" />
						<span id="captcha_reset"><i class="fa fa-refresh" alt="&reset-captcha;"></i></span>
					</div>
					<div class="text col-xs-6">
						<input type="text" name="captcha" class="styler captcha" placeholder="&enter-captcha;"/>
					</div>
				</label>
</div>
	</xsl:template>
</xsl:stylesheet>