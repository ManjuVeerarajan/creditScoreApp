<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="apos">'</xsl:variable>
	
	<xsl:template name="xsl_link">
		<script type="text/javascript">
			<xsl:text disable-output-escaping="yes">
				<![CDATA[
					function submit_order(pending_order) {}
					function purchase_order(type, search_id, name, old_ic) {}
					function purchase_cibi_order(type, search_id, name, old_ic) {}
					function purchase_suit(id) {}
				]]>
			</xsl:text>
        </script>
	</xsl:template>
	
	<xsl:template name="quick_purchase_js">
		<!-- do nothing -->
	</xsl:template>
	
	<xsl:template name="quick_purchase_html">
		<!-- do nothing -->
	</xsl:template>
	
	<xsl:template name="escapeQuotes">
		<xsl:param name="txt" />
		<xsl:variable name="backSlashQuote">&#92;&#39;</xsl:variable>
		<xsl:variable name="singleQuote">&#39;</xsl:variable>
		<xsl:choose>
			<xsl:when test="string-length($txt) = 0">
				<!-- do nothing -->
			</xsl:when>
			<xsl:when test="contains($txt, $singleQuote)">
				<xsl:value-of disable-output-escaping="yes" 
						select="concat(substring-before($txt, $singleQuote), $backSlashQuote)"/>
 
				<xsl:call-template name="escapeQuotes">
					<xsl:with-param name="txt" select="substring-after($txt, $singleQuote)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of disable-output-escaping="yes" select="$txt"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
  <xsl:template name="getICPPNoPriorityNewIC">
		<xsl:param name="newic"/>
    <xsl:param name="oldic"/>
		<xsl:choose>
			<xsl:when test="string-length($newic) > 0">
        <xsl:value-of select="$newic"/>
			</xsl:when>
			<xsl:otherwise>
        <xsl:value-of select="$oldic"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
  
  <xsl:template name="getBothICPPNo">
    <xsl:param name="newic"/>
    <xsl:param name="oldic"/>
    <xsl:choose>
      <xsl:when test="string-length($newic) > 0 and string-length($oldic) > 0 and $newic != 'NA'">
        <xsl:value-of select="$newic"/> / <xsl:value-of select="$oldic"/>
      </xsl:when>
      <xsl:when test="string-length($oldic) > 0">
        <xsl:value-of select="$oldic"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$newic" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="buildQuickPurchaseLink">
	<xsl:param name="type"/>
	<xsl:param name="director_newic"/>
	<xsl:param name="director_name"/>
	<xsl:param name="director_oldic"/>
	<xsl:param name="link_name"/>
	<xsl:value-of select="$link_name" />
  </xsl:template>
	
  <xsl:template name="buildPurchaseSuitLink">
	<xsl:param name="suit_id"/>
	<!-- do nothing -->
	</xsl:template>
	
  <xsl:template name="buildQuickPurchaseBiCiLink">
	<xsl:param name="type"/>
	<xsl:param name="reg_no"/>
	<xsl:param name="name"/>
	<!-- do nothing -->	
	</xsl:template>
	
	<xsl:template name="text_wrapper">
	<xsl:param name="text"/>
	<xsl:param name="size"/>
	<xsl:choose>
		<xsl:when test="string-length($text)">
		  <xsl:value-of select="substring($text,1,$size)"/><br/>
		  <xsl:call-template name="text_wrapper">
			<xsl:with-param name="text" select="substring($text,$size+1)"/>
			<xsl:with-param name="size" select="$size"/>
		  </xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:value-of select="$text"/><br/>
		</xsl:otherwise>
	  </xsl:choose>
	</xsl:template>
	
	<xsl:template name="oaor_message_link">
		<xsl:param name="url"/>
		<xsl:param name="message_bold"/>
			<xsl:element name="a">
				<xsl:attribute name="href">
				<xsl:value-of select="concat('javascript:OpenInNewTab(', $apos,$url, $apos,')')" />
				</xsl:attribute>
				<b><u><xsl:value-of select="$message_bold" /></u></b>
			</xsl:element> or get Consent for further information
	</xsl:template>
</xsl:stylesheet>