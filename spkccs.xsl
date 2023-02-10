<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:import href="general.xsl"/>
<xsl:import href="ccris_general.xsl"/>
<xsl:import href="spga_general.xsl"/>
<xsl:include href="quick_purchase.xsl"/> 
  <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="xml/summary/input_request/search_name" /></title>
          <style type="text/css">
            <xsl:value-of select="document('xslt2.css')" disable-output-escaping="yes" />
          </style>
      </head>
      <body>
		<div class="wrapper">
			<table width="100%">
				<tr>
					<td align="left"><img src="https://ct.experian.com.my/images/ExperianLogo.png" width="176px" height="59px" />&#160;<img src="https://spekar.experian.com.my/images/angkasa.png" width="75px" height="86px" /></td>
					<td align="right" valign="bottom" class="italic-bold"><p>CrediTrack by Experian</p><p><xsl:value-of select="xml/report_date"/></p></td>
				</tr>
			</table>
            <p class="h1">SPeKAR SCORE– (SPKCC-S)</p>
            <xsl:apply-templates/>
			<br /><br /><br />
			<!-- <xsl:call-template name="bottom_term" />	 -->	
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

