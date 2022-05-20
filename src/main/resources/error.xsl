<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="general.xsl"/>
<xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html>
      <head>
        <title>Error</title>
        <style type="text/css">
          <xsl:value-of select="document('xslt2.css')" disable-output-escaping="yes" />
        </style>
      </head>
      <body>
		<div class="wrapper">
			<table width="100%">
				<tr>
					<td align="left"><img src="https://ct.experian.com.my/images/ExperianLogo.png" width="176px" height="59px" /></td>
					<td align="right" valign="bottom" class="italic-bold"><p>CrediTrack by Experian</p><p><xsl:value-of select="xml/report_date"/></p></td>
				</tr>
			</table>
            <p class="h1">ERROR</p>
            <p class="h2 red"><xsl:value-of select="xml/error" /></p>
			<br /><br /><br />
			<xsl:call-template name="bottom_term" />
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>