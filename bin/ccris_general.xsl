<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- BEGIN PHANTOMJS HEADER FOOTER SECTION -->
	<xsl:template name="phantomjs_headerfooter">
	
		<script type="text/javascript">
		var orderDate = '<xsl:value-of select="/xml/end/order_date" />';
		var orderID = '<xsl:value-of select="/xml/end/order_id" />';
		var username = '<xsl:call-template name="escapeQuotes">
								<xsl:with-param name="txt">
									<xsl:value-of select="/xml/end/username" />
								</xsl:with-param>
							</xsl:call-template>';
		<![CDATA[
		var PhantomJSPrinting = {
			  header: {
				height: "2cm",
				contents: function() 
				{
				return "<div><span style='float: left; height:50px;'><img src='https://ct.experian.com.my/images/ExperianLogo.png' width='143px' height='48px' /></span><span style='float: right; font-size: 7px; height:50px;'><b>STRICTLY CONFIDENTIAL<br />CreditTrack by Experian<br/>Order Date: "+ orderDate +"<br />Order ID: "+ orderID +"<br />User Name: "+ username +"</b></span></div><hr style='clear: both;' />";
				}
			  },
			  footer: {
				height: "3.7cm",
				contents: function(pageNum, numPages) 
				{ 
				return "<hr /><div style='font-size: 6px;'>Experian Information Services (Malaysia) Sdn. Bhd. (532271-T)<br /><br />NOTICE: The information provided by Experian in this report is based on information which has been compiled from public sources and third parties. We do not guarantee the accuracy of the information provided by Experian. While we have used our best endeavours to ensure that the data is complete and accurate, we do not accept any liability for errors, omissions, incomplete information or non-current data and a purchaser or user of the information in this Report shall verify the accuracy of the information on its own. The information furnished is <u>STRICTLY CONFIDENTIAL</u> and should not be disclosed to any party including the subject concerned. The information in this report is not for evaluation or a comment on the credit-worthiness of the subject nor is it any advice, analysis, observation, representation or comment on the credit risk of the subject person or company/business or any other entity on whom/which the information is provided. Experian shall not be liable for any conclusions drawn by you/the user of any of the information found in this report. Please notify &amp; contact Experian promptly of any questions regarding the accuracy of the information contained in this report to the Customer Service at: No 17-9 &amp; 19-9, 9th Floor, The Boulevard, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur, Malaysia or call: +60326151128.<br /><span style='float: right; font-size: 8px;'><b>Page " + pageNum + " of " + numPages + "</b></span></div>";
				}
			  }
			 };
		]]>
		</script>
	
	</xsl:template>
	<!-- END PHANTOMJS HEADER FOOTER SECTION -->
	
	<!-- BEGIN SPKC HEADER FOOTER SECTION -->
	<xsl:template name="spkc_headerfooter">
	
		<script type="text/javascript">
		var orderDate = '<xsl:value-of select="/xml/end/order_date" />';
		var orderID = '<xsl:value-of select="/xml/end/order_id" />';
		var username = '<xsl:call-template name="escapeQuotes">
								<xsl:with-param name="txt">
									<xsl:value-of select="/xml/end/username" />
								</xsl:with-param>
							</xsl:call-template>';
		<![CDATA[
		var PhantomJSPrinting = {
			  header: {
				height: "2cm",
				contents: function() 
				{
				return "<div><span style='float: left; height:50px;'><img src='https://ct.experian.com.my/images/ExperianLogo.png' width='143px' height='48px' /></span><span style='float: left; height:50px;'><img src='https://spekar.experian.com.my/images/angkasa.png' width='41px' height='48px' /></span><span style='float: right; font-size: 7px; height:50px;'><b>STRICTLY CONFIDENTIAL<br />CreditTrack by Experian<br/>Order Date: "+ orderDate +"<br />Order ID: "+ orderID +"<br />User Name: "+ username +"</b></span></div><hr style='clear: both;' />";
				}
			  },
			  footer: {
				height: "3.7cm",
				contents: function(pageNum, numPages) 
				{ 
				return "<hr /><div style='font-size: 6px;'>Experian Information Services (Malaysia) Sdn. Bhd. (532271-T)<br /><br />NOTICE: The information provided by Experian in this report is based on information which has been compiled from public sources and third parties. We do not guarantee the accuracy of the information provided by Experian. While we have used our best endeavours to ensure that the data is complete and accurate, we do not accept any liability for errors, omissions, incomplete information or non-current data and a purchaser or user of the information in this Report shall verify the accuracy of the information on its own. The information furnished is <u>STRICTLY CONFIDENTIAL</u> and should not be disclosed to any party including the subject concerned. The information in this report is not for evaluation or a comment on the credit-worthiness of the subject nor is it any advice, analysis, observation, representation or comment on the credit risk of the subject person or company/business or any other entity on whom/which the information is provided. Experian shall not be liable for any conclusions drawn by you/the user of any of the information found in this report. Please notify &amp; contact Experian promptly of any questions regarding the accuracy of the information contained in this report to the Customer Service at: No 17-9 &amp; 19-9, 9th Floor, The Boulevard, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur, Malaysia or call: +60326151128.<br /><span style='float: right; font-size: 8px;'><b>Page " + pageNum + " of " + numPages + "</b></span></div>";
				}
			  }
			 };
		]]>
		</script>
	
	</xsl:template>
	<!-- END SPKC HEADER FOOTER SECTION -->
	
	<!-- BEGIN PCRP HEADER FOOTER SECTION -->
	<xsl:template name="pcrp_headerfooter">
		<script type="text/javascript">
			var reportDate = '<xsl:value-of select="/xml/report_date" />';
			var ramciPCRPNo = '<xsl:value-of select="/xml/person_details_pcr/pcr_orderid" />';
		<![CDATA[
		var PhantomJSPrinting = {
			  header: {
				height: "2cm",
				contents: function() 
				{
				return "<table width='100%'><tr><td width='400px'><img src='https://ct.experian.com.my/images/ExperianLogo.png' width='143px' height='48px' /></td><td align='right' style='font-size: 11px;'><b>STRICTLY CONFIDENTIAL</b><table width='300px' style='font-size: 10px; border: 1px solid #000;'><tr><td align='left' width='100px'>Report Date </td><td>:</td><td align='right'>"+ reportDate +"</td></tr><tr><td>PCRP No.</td><td>:</td><td align='right'> "+ ramciPCRPNo +"</td></tr></table></td><tr></table>";
				}
			  },
			  footer: {
				height: "2cm",
				contents: function(pageNum, numPages) 
				{ 
				return "<hr /><div style='font-size: 6px;'>Experian Information Services (Malaysia) Sdn. Bhd. (532271-T)<br /><br />NOTICE: The information provided by Experian in this report is based on information which has been compiled from public sources and third parties. We do not guarantee the accuracy of the information provided by Experian. While we have used our best endeavours to ensure that the data is complete and accurate, we do not accept any liability for errors, omissions, incomplete information or non-current data and a purchaser or user of the information in this Report shall verify the accuracy of the information on its own. The information furnished is <u>STRICTLY CONFIDENTIAL</u> and should not be disclosed to any party including the subject concerned. The information in this report is not for evaluation or a comment on the credit-worthiness of the subject nor is it any advice, analysis, observation, representation or comment on the credit risk of the subject person or company/business or any other entity on whom/which the information is provided. Experian shall not be liable for any conclusions drawn by you/the user of any of the information found in this report. Please notify &amp; contact Experian promptly of any questions regarding the accuracy of the information contained in this report to the Customer Service at: No 17-9 &amp; 19-9, 9th Floor, The Boulevard, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur, Malaysia or call: +60326151128.<br /><span style='float: right; font-size: 8px;'><b>Page " + pageNum + " of " + numPages + "</b></span></div>";
				}
			  }
			 };
		]]>
		</script>
	
	</xsl:template>
	<!-- END PCRP HEADER FOOTER SECTION -->
        
        <!-- BEGIN CCRP HEADER FOOTER SECTION -->
	<xsl:template name="ccrp_headerfooter">
		<script type="text/javascript">
			var reportDate = '<xsl:value-of select="/xml/reference/order_date" />';
			var ramciCCRPNo = '<xsl:value-of select="/xml/reference/order_id" />';
		<![CDATA[
		var PhantomJSPrinting = {
			  header: {
				height: "2cm",
				contents: function() 
				{
				return "<table width='100%'><tr><td width='400px'><img src='https://ct.experian.com.my/images/ExperianLogo.png' width='143px' height='48px' /></td><td align='right' style='font-size: 11px;'><b>STRICTLY CONFIDENTIAL</b><table width='300px' style='font-size: 10px; border: 1px solid #000;'><tr><td align='left' width='100px'>Report Date </td><td>:</td><td align='right'>"+ reportDate +"</td></tr><tr><td>CCRP No.</td><td>:</td><td align='right'> "+ ramciCCRPNo +"</td></tr></table></td><tr></table>";
				}
			  },
			  footer: {
				height: "2cm",
				contents: function(pageNum, numPages) 
				{ 
				return "<hr /><div style='font-size: 6px;'>Experian Information Services (Malaysia) Sdn. Bhd. (532271-T)<br /><br />NOTICE: The information provided by Experian in this report is based on information which has been compiled from public sources and third parties. We do not guarantee the accuracy of the information provided by Experian. While we have used our best endeavours to ensure that the data is complete and accurate, we do not accept any liability for errors, omissions, incomplete information or non-current data and a purchaser or user of the information in this Report shall verify the accuracy of the information on its own. The information furnished is <u>STRICTLY CONFIDENTIAL</u> and should not be disclosed to any party including the subject concerned. The information in this report is not for evaluation or a comment on the credit-worthiness of the subject nor is it any advice, analysis, observation, representation or comment on the credit risk of the subject person or company/business or any other entity on whom/which the information is provided. Experian shall not be liable for any conclusions drawn by you/the user of any of the information found in this report. Please notify &amp; contact Experian promptly of any questions regarding the accuracy of the information contained in this report to the Customer Service at: No 17-9 &amp; 19-9, 9th Floor, The Boulevard, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur, Malaysia or call: +60326151128.<br /><span style='float: right; font-size: 8px;'><b>Page " + pageNum + " of " + numPages + "</b></span></div>";
				}
			  }
			 };
		]]>
		</script>
	
	</xsl:template>
	<!-- END CCRP HEADER FOOTER SECTION -->

	<!-- BEGIN EXECUTIVE SUMMARY HEADER -->
	<xsl:template match="executive_summary" name="executive_summary">
		<p class="h2 blue uline">SECTION 1: SUMMARY</p>
		<xsl:apply-templates />
	</xsl:template>
	<!-- END EXECUTIVE SUMMARY HEADER -->
        
    <!-- BEGIN EXECUTIVE SUMMARY HEADER FOR CCRP-->
	<xsl:template match="executive_summary_ccrp" name="executive_summary_ccrp">
		<xsl:apply-templates />
	</xsl:template>
	<!-- END EXECUTIVE SUMMARY HEADER FOR CCRP-->
	
	<!-- BEGIN EXECUTIVE SUMMARY HEADER -->
	<xsl:template match="summary" name="summary">
		<div class="section">
			<p class="h2 blue uline">SECTION 1: SUMMARY</p>
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- END EXECUTIVE SUMMARY HEADER -->
	
	<!-- BEGIN CORPORATE_PROFILE HEADER -->
	<xsl:template match="corporate_profile" name="corporate_profile">
		<div class="section">
			<p class="h2 blue uline">SECTION 1A: CORPORATION DETAILS AND FINANCIAL PROFILE</p>
			<xsl:choose>
				<xsl:when test="*">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<p>NO INFORMATION AVAILABLE</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- END CORPORATE_PROFILE HEADER -->
        
        <!-- BEGIN CORPORATE_PROFILE HEADER FOR CCRP 1-->
	<xsl:template match="corporate_profile_ccrp_1" name="corporate_profile_ccrp_1">
		<div class="section">
			<xsl:choose>
				<xsl:when test="*">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<p>NO INFORMATION AVAILABLE</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- END CORPORATE_PROFILE HEADER FOR CCRP 1-->
        
        <!-- BEGIN CORPORATE_PROFILE HEADER FOR CCRP 2-->
	<xsl:template match="corporate_profile_ccrp_2" name="corporate_profile_ccrp_2">
		<div class="section">
			<xsl:choose>
				<xsl:when test="*">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<p>NO INFORMATION AVAILABLE</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- END CORPORATE_PROFILE HEADER FOR CCRP 2-->
	
	<!-- BEGIN BANKING_INFO HEADER -->
	<xsl:template match="banking_info" name="banking_info">
		<div class="section">
			<p class="h2 blue uline">SECTION 2: BANKING CREDIT INFORMATION</p>
			<p class="small">Note: The following information has been extracted from Bank Negara Malaysia. The information is confidential and shall not be disclosed to any other person. We do not warrant as to its accuracy, correctness or completeness. If there is any inconsistency, inaccuracies or missing details or information, please contact Experian customer service for assistance.</p>
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- END BANKING_INFO HEADER -->
	
	<!-- BEGIN AOR HEADER -->
	<!-- Remove DCHEQ -->
	<!-- <xsl:template match="aor_info" name="aor_info">
		<div class="section">
			<p class="h2 blue uline">SECTION 2: DISHONOURED CHEQUES INFORMATION</p>
			<p class="small">Note: The following information has been extracted from Bank Negara Malaysia. The information is confidential and shall not be disclosed to any other person. We do not warrant as to its accuracy, correctness or completeness. If there is any inconsistency, inaccuracies or missing details or information, please contact Experian customer service for assistance.</p>
			<xsl:apply-templates />
		</div>
	</xsl:template> -->
	<!-- END AOR HEADER -->
	
	<!-- BEGIN LITIGATION_INFO HEADER -->
	<xsl:template match="litigation_info" name="litigation_info">
		<div class="section">
			<p class="h2 blue uline">SECTION 3: LITIGATION INFORMATION</p>
			<xsl:choose>
				<xsl:when test="*">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<p>NO INFORMATION AVAILABLE</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- END LITIGATION_INFO HEADER -->
        
        <!-- BEGIN LITIGATION_INFO HEADER FOR CCRP-->
	<xsl:template match="litigation_info_ccrp" name="litigation_info_ccrp">
		<div class="section">
			<xsl:choose>
				<xsl:when test="*">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<p>NO INFORMATION AVAILABLE</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- END LITIGATION_INFO HEADER FOR CCRP-->
	
	<!-- BEGIN LITIGATION_INFO HEADER -->
	<xsl:template match="bankruptcy_info" name="bankruptcy_info">
		<div class="section">
			<p class="h2 blue uline">SECTION 3: BANKRUPTCY ACTION</p>
			<xsl:choose>
				<xsl:when test="*">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<p>NO INFORMATION AVAILABLE</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<!-- END LITIGATION_INFO HEADER -->
	
	<!-- BEGIN TRADE_BUREAU HEADER -->
	<xsl:template match="trade_bureau" name="trade_bureau">
		<div class="section">
			<p class="h2 blue uline">SECTION 4: TRADE BUREAU / OTHER CREDIT REFERENCE</p>
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- END TRADE_BUREAU HEADER -->
        
        <!-- BEGIN TRADE_BUREAU HEADER FOR CCRP-->
	<xsl:template match="trade_bureau_ccrp" name="trade_bureau_ccrp">
		<div class="section">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- END TRADE_BUREAU HEADER FOR CCRP-->
	
	<!-- BEGIN ENQUIRY HEADER -->
	<xsl:template match="enquiry" name="enquiry">
		<div class="section">
			<p class="h2 blue uline">SECTION 5: ENQUIRIES</p>
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- END ENQUIRY HEADER -->
	
	<!-- BEGIN ENQUIRY HEADER FOR IRISB -->
	<xsl:template match="enquiry_irisb" name="enquiry_irisb">
		<div class="section">
			<p class="h2 blue uline">SECTION 4: ENQUIRIES</p>
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- END ENQUIRY HEADER -->
	
	<!-- BEGIN PBI HEADER -->
	<xsl:template match="pbi" name="pbi">
		<div class="section" style="page-break-before:always;">
			<p class="h2 blue uline">SECTION 6: PARTIES WITH BUSINESS INTEREST INFORMATION (PBI)</p>
			<xsl:for-each select="item">
				<p class="h2 blue">PARTIES WITH BUSINESS INTEREST: <span class="italic-bold"><xsl:value-of select="summary/input_request/search_name"/></span></p>
				<xsl:apply-templates />
			</xsl:for-each>
		</div>
	</xsl:template>
	<!-- END PBI HEADER -->

	
	<!-- BEGIN CCRIS INPUT REQUEST -->
	<xsl:template match="ccris_input_request" name="ccris_input_request">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">PARTICULARS OF THE SUBJECT PROVIDED BY YOU</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name Of Subject</td>
				<td width="80%"><xsl:value-of select="search_name"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Registration No</td>
				<td width="80%"><xsl:value-of select="search_id"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- END CCRIS INPUT REQUEST -->
	
	<!-- BEGIN CCRIS CORPORATE INFO -->
	<xsl:template match="ccris_corporate_info" name="ccris_corporate_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION IN OUR DATABANK</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name Of Subject</td>
				<td width="80%"><xsl:value-of select="name"/></td>
			</tr>
			<tr>
				<!-- <td width="20%" class="bold">Registration No</td>
				<td width="80%"><xsl:value-of select="id"/></td> -->
				
				<xsl:choose>
					<xsl:when test="new_reg_no">
						<tr>
							<td width="20%" class="bold">Registration No</td>
							<td width="80%"><xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/> </td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td width="20%" class="bold">Registration No</td>
							<td width="80%"><xsl:value-of select="reg_no"/></td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</table>
	</xsl:template>
	<!-- END CCRIS CORPORATE INFO -->
	
	<!-- BEGIN AOR CORPORATE INFO -->
	<xsl:template match="aor_corporate_info" name="aor_corporate_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION IN OUR DATABANK</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name Of Subject</td>
				<td width="80%"><xsl:value-of select="name"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Registration No</td>
				<td width="80%"><xsl:value-of select="id"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- END AOR CORPORATE INFO -->

	<!-- BEGIN CCRIS CORPORATE ADDRESS -->
	<xsl:template match="ccris_corporate_addresses" name="ccris_corporate_addresses">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="3" align="left">ADDRESS (S) IN BANKING &#38; EXPERIAN  DATABANK<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(ccris_corporate_address)">
					<tr>
						<td width="75%" class="bold">Address</td>
						<td width="15%" class="bold">Date Captured</td>
						<td width="10%" class="bold">Source</td>
					</tr>
					<xsl:for-each select="ccris_corporate_address">
						<tr>
							<td><xsl:value-of select="address"/></td>
							<td><xsl:value-of select="date_capture"/></td>
							<td><xsl:value-of select="source_from"/></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="3">NIL</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CCRIS CORPORATE ADDRESS -->
	
	<!-- BEGIN SUMMARY INFO -->
	<xsl:template match="info_summary" name="info_summary">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="4" align="left">SUMMARY CREDIT INFORMATION</th>
			</tr>
			<tr>
				<td width="50%" colspan="2" class="bold">By Banking Info</td>
				<td width="50%" colspan="2" class="bold">By Experian</td>
			</tr>
			<tr>
				<td width="40%">Credit Applications Approved for Last 12 months</td>
				<td width="10%"><xsl:value-of select="credit_approval_count"/></td>
				<xsl:if test="winding_up_count">
					<xsl:choose>
						<xsl:when test="winding_up_count &gt; 0">
							<td width="40%" class="fontRed">Winding Up Record</td>
							<td width="10%" class="fontRed"><xsl:value-of select="winding_up_count"/></td>
						</xsl:when>
						<xsl:otherwise>
							<td width="40%">Winding Up Record</td>
							<td width="10%"><xsl:value-of select="winding_up_count"/></td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="bankruptcy_count">
					<xsl:choose>
						<xsl:when test="bankruptcy_count &gt; 0">
							<td width="40%" class="fontRed">Bankruptcy Record</td>
							<td width="10%" class="fontRed"><xsl:value-of select="bankruptcy_count"/></td>
						</xsl:when>
						<xsl:otherwise>
							<td width="40%">Bankruptcy Record</td>
							<td width="10%"><xsl:value-of select="bankruptcy_count"/></td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</tr>
			<tr>
				<td width="40%">Credit Applications Pending</td>
				<td width="10%"><xsl:value-of select="credit_pending_count"/></td>
				<xsl:choose>
					<xsl:when test="legal_suit_count &gt; 0">
						<td width="40%" class="fontRed">Legal Suits</td>
						<td width="10%" class="fontRed"><xsl:value-of select="legal_suit_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Legal Suits</td>
						<td width="10%"><xsl:value-of select="legal_suit_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
			<!-- Remove DCHEQ -->
				<xsl:choose>
					<xsl:when test="special_attention_account_count &gt; 0">
						<td width="40%" class="fontRed">Special Attention account</td>
						<td width="10%" class="fontRed"><xsl:value-of select="special_attention_account_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Special Attention account</td>
						<td width="10%"><xsl:value-of select="special_attention_account_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="trade_bureau_count &gt; 0">
						<td width="40%" class="fontRed">Trade / Credit Reference</td>
						<td width="10%" class="fontRed"><xsl:value-of select="trade_bureau_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Trade / Credit Reference</td>
						<td width="10%"><xsl:value-of select="trade_bureau_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="legal_action_banking_count &gt; 0">
						<td width="40%" class="fontRed">Legal Action taken (from Banking)</td>
						<td width="10%" class="fontRed"><xsl:value-of select="legal_action_banking_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Legal Action taken (from Banking)</td>
						<td width="10%"><xsl:value-of select="legal_action_banking_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
				<td width="40%">Total Enquiries for Last 12 months</td>
				<td width="10%"><xsl:value-of select="enquiry_count"/></td>
			</tr>
			
			<tr>
				<td width="40%">Existing No. of Facility (from Banking)</td>
				<td width="10%"><xsl:value-of select="existing_facility_count"/></td>
				<td width="40%">Total Companies/Businesses Interest</td>
				<td width="10%"><xsl:value-of select="interest_count"/></td>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="angkasa_deduction_count">
						<td width="40%">&#160;</td>
						<td width="10%">&#160;</td>
						<td width="40%">Total ANGKASA (BPA) Deduction</td>
						<td width="10%"><xsl:value-of select="angkasa_deduction_count"/></td>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<!-- Remove DCHEQ -->
			<!-- <tr>
				<xsl:choose>
					<xsl:when test="dishonored_cheque_count &gt; 0">
						<td width="40%" class="fontRed">Dishonored Cheque</td>
						<td width="10%" class="fontRed"><xsl:value-of select="dishonored_cheque_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Dishonored Cheque</td>
						<td width="10%"><xsl:value-of select="dishonored_cheque_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="trade_bureau_count &gt; 0">
						<td width="40%" class="fontRed">Trade / Credit Reference</td>
						<td width="10%" class="fontRed"><xsl:value-of select="trade_bureau_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Trade / Credit Reference</td>
						<td width="10%"><xsl:value-of select="trade_bureau_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="special_attention_account_count &gt; 0">
						<td width="40%" class="fontRed">Special Attention account</td>
						<td width="10%" class="fontRed"><xsl:value-of select="special_attention_account_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Special Attention account</td>
						<td width="10%"><xsl:value-of select="special_attention_account_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
				<td width="40%">Total Enquiries for Last 12 months</td>
				<td width="10%"><xsl:value-of select="enquiry_count"/></td>
			</tr>
			
			<tr>
				<xsl:choose>
					<xsl:when test="legal_action_banking_count &gt; 0">
						<td width="40%" class="fontRed">Legal Action taken (from Banking)</td>
						<td width="10%" class="fontRed"><xsl:value-of select="legal_action_banking_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Legal Action taken (from Banking)</td>
						<td width="10%"><xsl:value-of select="legal_action_banking_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
				<td width="40%">Total Companies/Businesses Interest</td>
				<td width="10%"><xsl:value-of select="interest_count"/></td>
			</tr>
			<tr>
				<td width="40%">Existing No. of Facility (from Banking)</td>
				<td width="10%"><xsl:value-of select="existing_facility_count"/></td>
				<xsl:choose>
					<xsl:when test="angkasa_deduction_count">
						<td width="40%">Total ANGKASA (BPA) Deduction</td>
						<td width="10%"><xsl:value-of select="angkasa_deduction_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">&#160;</td>
						<td width="10%">&#160;</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr> -->
		</table>
	</xsl:template>
	<!-- END SUMMARY INFO -->

	<!-- BEGIN CCRP SUMMARY INFO -->
	<xsl:template match="info_summary_ccrp" name="info_summary_ccrp">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="4" align="left">SUMMARY CREDIT INFORMATION</th>
			</tr>
			<tr>
				<td width="50%" colspan="2" class="bold">By Banking Info</td>
				<td width="50%" colspan="2" class="bold">By Experian</td>
			</tr>
			<tr>
				<td width="40%">Credit applications approved for last 12 months</td>
				<td width="10%"><xsl:value-of select="credit_approval_count"/></td>
				<xsl:if test="winding_up_count">
					<xsl:choose>
						<xsl:when test="winding_up_count &gt; 0">
							<td width="40%" class="fontRed">Winding Up Record</td>
							<td width="10%" class="fontRed"><xsl:value-of select="winding_up_count"/></td>
						</xsl:when>
						<xsl:otherwise>
							<td width="40%">Winding Up Record</td>
							<td width="10%"><xsl:value-of select="winding_up_count"/></td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="bankruptcy_count">
					<xsl:choose>
						<xsl:when test="bankruptcy_count &gt; 0">
							<td width="40%" class="fontRed">Bankruptcy Record</td>
							<td width="10%" class="fontRed"><xsl:value-of select="bankruptcy_count"/></td>
						</xsl:when>
						<xsl:otherwise>
							<td width="40%">Bankruptcy Record</td>
							<td width="10%"><xsl:value-of select="bankruptcy_count"/></td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</tr>
			<tr>
				<td width="40%">Credit applications pending</td>
				<td width="10%"><xsl:value-of select="credit_pending_count"/></td>
				<xsl:choose>
					<xsl:when test="legal_suit_count &gt; 0">
						<td width="40%" class="fontRed">Legal Suits</td>
						<td width="10%" class="fontRed"><xsl:value-of select="legal_suit_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Legal Suits</td>
						<td width="10%"><xsl:value-of select="legal_suit_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="special_attention_account_count &gt; 0">
						<td width="40%" class="fontRed">Special Attention account</td>
						<td width="10%" class="fontRed"><xsl:value-of select="special_attention_account_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Special Attention account</td>
						<td width="10%"><xsl:value-of select="special_attention_account_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="trade_bureau_count &gt; 0">
						<td width="40%" class="fontRed">Trade / Credit Reference</td>
						<td width="10%" class="fontRed"><xsl:value-of select="trade_bureau_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Trade / Credit Reference</td>
						<td width="10%"><xsl:value-of select="trade_bureau_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="legal_action_banking_count &gt; 0">
						<td width="40%" class="fontRed">Legal Action taken (from Banking)</td>
						<td width="10%" class="fontRed"><xsl:value-of select="legal_action_banking_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Legal Action taken (from Banking)</td>
						<td width="10%"><xsl:value-of select="legal_action_banking_count"/></td>
					</xsl:otherwise>
				</xsl:choose>
				<td width="40%">Total enquiries</td>
				<td width="10%"><xsl:value-of select="enquiry_count"/></td>
			</tr>
			
			<tr>
				<td width="40%">Existing No. of Facility (from Banking)</td>
				<td width="10%"><xsl:value-of select="existing_facility_count"/></td>
				<td width="40%">Total Companies/Businesses Interest</td>
				<td width="10%"><xsl:value-of select="interest_count"/></td>
			</tr>
			<xsl:choose>
				<xsl:when test="angkasa_deduction_count">
					<tr>
						<td width="40%">&#160;</td>
						<td width="10%">&#160;</td>
						<td width="40%">Total ANGKASA (BPA) Deduction</td>
						<td width="10%"><xsl:value-of select="angkasa_deduction_count"/></td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CCRP SUMMARY INFO -->
	
	<!-- BEGIN AOR SUMMARY INFO -->
	<xsl:template match="aor_summary" name="aor_summary">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="4" align="left">SUMMARY CREDIT INFORMATION</th>
			</tr>
			<tr>
				<td width="50%" colspan="2" class="bold">By Banking Info</td>
				<td width="50%" colspan="2" class="bold">By Experian</td>
			</tr>
			<tr>
				<!-- Remove DCHEQ -->
				<!-- <xsl:choose>
					<xsl:when test="dishonored_cheque_count &gt; 0">
						<td width="40%" class="fontRed">Dishonored Cheque</td>
						<td width="10%" class="fontRed"><xsl:value-of select="dishonored_cheque_count"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="40%">Dishonored Cheque</td>
						<td width="10%"><xsl:value-of select="dishonored_cheque_count"/></td>
					</xsl:otherwise>
				</xsl:choose> -->
				
				<xsl:if test="winding_up_count">
					<xsl:choose>
						<xsl:when test="winding_up_count &gt; 0">
							<td width="40%" class="fontRed">Winding Up Record</td>
							<td width="10%" class="fontRed"><xsl:value-of select="winding_up_count"/></td>
						</xsl:when>
						<xsl:otherwise>
							<td width="40%">Winding Up Record</td>
							<td width="10%"><xsl:value-of select="winding_up_count"/></td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="bankruptcy_count">
					<xsl:choose>
						<xsl:when test="bankruptcy_count &gt; 0">
							<td width="40%" class="fontRed">Bankruptcy Record</td>
							<td width="10%" class="fontRed"><xsl:value-of select="bankruptcy_count"/></td>
						</xsl:when>
						<xsl:otherwise>
							<td width="40%">Bankruptcy Record</td>
							<td width="10%"><xsl:value-of select="bankruptcy_count"/></td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</tr>
		</table>
	</xsl:template>
	<!-- END AOR SUMMARY INFO -->
	
	<!-- BEGIN BANKING WARNING -->
	<xsl:template match="ccris_banking_warning" name="ccris_banking_warning">	
		<table border="0" width="100%" class="full_border">
			<tr>
				<td colspan="2" class="bold">Subject Status</td>
			</tr>
			<tr>
				<td class="bold" width="30%">Warning Remark</td>
				<td width="70%">
					<xsl:choose>
						<xsl:when test="string-length(.)">
							<xsl:value-of select="."/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- END BANKING WARNING -->
	
	<!-- BEGIN SUMMARY BANKING INFO -->
	<xsl:template match="ccris_banking_summary" name="ccris_banking_summary">
		<br />
		<p class="font14 uline"><strong>SUMMARY OF BANKING INFORMATION</strong></p>
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left" colspan="3">SUMMARY CREDIT REPORT</th>
			</tr>
			<tr>
				<td align="left" colspan="3" class="bold">Total no. of Credit Applications</td>
			</tr>
			<tr>
				<td>&#160;</td>
				<td class="bold">No. of Applications</td>
				<td class="bold">Total Amount (RM)</td>
			</tr>
			<tr>
				<td class="bold">A. Approved for past 12 months</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_credit_report/approved_count">
							<xsl:value-of select="summary_credit_report/approved_count"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_credit_report/approved_amount">
							<xsl:value-of select="format-number(summary_credit_report/approved_amount, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="bold">B. Pending</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_credit_report/pending_count">
							<xsl:value-of select="summary_credit_report/pending_count"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_credit_report/pending_amount">
							<xsl:value-of select="format-number(summary_credit_report/pending_amount, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left" colspan="4">SUMMARY OF POTENTIAL &#38; CURRENT LIABILITIES</th>
			</tr>
			<tr>
				<td>&#160;</td>
				<td class="bold">Outstanding (RM) <br /><span class="small">(Exclude FEC)</span></td>
				<td class="bold">Total Limit (RM) <br /><span class="small">(Exclude FEC)</span></td>
				<td class="bold">FEC Limit (RM)</td>
			</tr>
			<tr>
				<td class="bold">As Borrower</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_liabilities/borrower/outstanding">
							<xsl:value-of select="format-number(summary_liabilities/borrower/outstanding, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_liabilities/borrower/total_limit">
							<xsl:value-of select="format-number(summary_liabilities/borrower/total_limit, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_liabilities/borrower/fec_limit">
							<xsl:value-of select="format-number(summary_liabilities/borrower/fec_limit, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="summary_liabilities/guarantor">
				<tr>
					<td class="bold">As Guarantor</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/guarantor/outstanding">
								<xsl:value-of select="format-number(summary_liabilities/borrower/outstanding, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/guarantor/total_limit">
								<xsl:value-of select="format-number(summary_liabilities/guarantor/total_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/guarantor/fec_limit">
								<xsl:value-of select="format-number(summary_liabilities/guarantor/fec_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="summary_liabilities/total">
				<tr>
					<td class="bold">Total</td>
					<td>&#160;</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/total/total_limit">
								<xsl:value-of select="format-number(summary_liabilities/total/total_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/total/fec_limit">
								<xsl:value-of select="format-number(summary_liabilities/total/fec_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="bold fontRed">Legal Action Taken</td>
				<td colspan="3">
					<xsl:choose>
						<xsl:when test="summary_liabilities/legal_action_taken">
							<xsl:value-of select="summary_liabilities/legal_action_taken"/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="bold fontRed">Special Attention Account</td>
				<td colspan="3">
					<xsl:choose>
						<xsl:when test="summary_liabilities/special_attention_account">
							<xsl:value-of select="summary_liabilities/special_attention_account"/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- END SUMMARY BANKING INFO -->
        
        <!-- BEGIN SUMMARY BANKING INFO CCRP-->
	<xsl:template match="ccris_banking_summary_ccrp" name="ccris_banking_summary_ccrp">
		<br />
		<table border="0" width="100%" class="full_border">
                        <tr>
				<th align="left" colspan="3">SUMMARY CREDIT REPORT</th>
			</tr>
			<tr>
				<td align="left" colspan="3" class="bold">Total no. of Credit Applications</td>
			</tr>
			<tr>
				<td>&#160;</td>
				<td class="bold">No. of Applications</td>
				<td class="bold">Total Amount (RM)</td>
			</tr>
			<tr>
				<td class="bold">A. Approved for past 12 months</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_credit_report/approved_count">
							<xsl:value-of select="summary_credit_report/approved_count"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_credit_report/approved_amount">
							<xsl:value-of select="format-number(summary_credit_report/approved_amount, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="bold">B. Pending</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_credit_report/pending_count">
							<xsl:value-of select="summary_credit_report/pending_count"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_credit_report/pending_amount">
							<xsl:value-of select="format-number(summary_credit_report/pending_amount, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left" colspan="4">SUMMARY OF POTENTIAL &#38; CURRENT LIABILITIES</th>
			</tr>
			<tr>
				<td>&#160;</td>
				<td class="bold">Outstanding (RM) <br /><span class="small">(Exclude FEC)</span></td>
				<td class="bold">Total Limit (RM) <br /><span class="small">(Exclude FEC)</span></td>
				<td class="bold">FEC Limit (RM)</td>
			</tr>
			<tr>
				<td class="bold">As Borrower</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_liabilities/borrower/outstanding">
							<xsl:value-of select="format-number(summary_liabilities/borrower/outstanding, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_liabilities/borrower/total_limit">
							<xsl:value-of select="format-number(summary_liabilities/borrower/total_limit, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="summary_liabilities/borrower/fec_limit">
							<xsl:value-of select="format-number(summary_liabilities/borrower/fec_limit, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="summary_liabilities/guarantor">
				<tr>
					<td class="bold">As Guarantor</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/guarantor/outstanding">
								<xsl:value-of select="format-number(summary_liabilities/borrower/outstanding, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/guarantor/total_limit">
								<xsl:value-of select="format-number(summary_liabilities/guarantor/total_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/guarantor/fec_limit">
								<xsl:value-of select="format-number(summary_liabilities/guarantor/fec_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="summary_liabilities/total">
				<tr>
					<td class="bold">Total</td>
					<td>&#160;</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/total/total_limit">
								<xsl:value-of select="format-number(summary_liabilities/total/total_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="summary_liabilities/total/fec_limit">
								<xsl:value-of select="format-number(summary_liabilities/total/fec_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="bold fontRed">Legal Action Taken</td>
				<td colspan="3">
					<xsl:choose>
						<xsl:when test="summary_liabilities/legal_action_taken">
							<xsl:value-of select="summary_liabilities/legal_action_taken"/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="bold fontRed">Special Attention Account</td>
				<td colspan="3">
					<xsl:choose>
						<xsl:when test="summary_liabilities/special_attention_account">
							<xsl:value-of select="summary_liabilities/special_attention_account"/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- END SUMMARY BANKING INFO CCRP-->
	
	<!-- BEGIN DCHEQS INFO -->
	<!-- Remove DCHEQ -->
	<!-- <xsl:template match="dcheqs_info" name="dcheqs_info">
		<br />
		<xsl:choose>
			<xsl:when test="dcheqs_warning">
				<table border="0" width="100%" class="full_border">
					<tr>
						<th align="left" class="fontRed">DISHONOURED CHEQUE INFORMATION (OWN BANK)</th>
					</tr>
					<tr>
						<td><xsl:value-of select="."/></td>
					</tr>
				</table>
				<br />
				<table border="0" width="100%" class="full_border">
					<tr>
						<th align="left" class="fontRed">DISHONOURED CHEQUE INFORMATION (COMMERCIAL BANK)</th>
					</tr>
					<tr>
						<td><xsl:value-of select="."/></td>
					</tr>
				</table>
			</xsl:when>
			<xsl:otherwise>
				<table border="0" width="100%" class="full_border">
					<tr>
						<th colspan="5" align="left" class="fontRed">DISHONOURED CHEQUE INFORMATION (OWN BANK)</th>
					</tr>
					<tr>
						<td class="bold background_DAEEF3">Account No</td>
						<td class="bold background_DAEEF3">Issuance Date</td>
						<td class="bold background_DAEEF3">Cheque No</td>
						<td class="bold background_DAEEF3">Amount</td>
						<td class="bold background_DAEEF3">Remark</td>
					</tr>
					<xsl:choose>
						<xsl:when test="count(own_bank/item)">
							<xsl:for-each select="own_bank/item">
								<tr>
									<td><xsl:value-of select="account_no"/></td>
									<td><xsl:value-of select="inssuance_date"/></td>
									<td><xsl:value-of select="cheque_no"/></td>
									<td><xsl:value-of select="format-number(amount, '###,##0.00')"/></td>
									<td><xsl:value-of select="remark"/></td>
								</tr>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td colspan="5">NO INFORMATION AVAILABLE</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<br />
				<table border="0" width="100%" class="full_border">
					<tr>
						<th colspan="4" align="left" class="fontRed">DISHONOURED CHEQUE INFORMATION (COMMERCIAL BANK)</th>
					</tr>
					<tr>
						<td class="bold background_DAEEF3">Bank</td>
						<td class="bold background_DAEEF3">Account No</td>
						<td class="bold background_DAEEF3">Issuance Date</td>
						<td class="bold background_DAEEF3">Remark</td>
					</tr>
					<xsl:choose>
						<xsl:when test="count(other_bank/item)">
							<xsl:for-each select="other_bank/item">
								<tr>
									<td><xsl:value-of select="bank_no"/></td>
									<td><xsl:value-of select="account_no"/></td>
									<td><xsl:value-of select="inssuance_date"/></td>
									<td><xsl:value-of select="remark"/></td>
								</tr>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td colspan="4">NO INFORMATION AVAILABLE</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template> -->
	<!-- END DCHEQS INFO -->
	
	<!-- BEGIN CCRIS DETAILS INFO -->
	<xsl:template match="ccris_banking_details" name="ccris_banking_details">
		<br />
		<table border="0" width="100%" class="full_border_2p">
			<tr>
				<th colspan="25" align="left">DETAILED CREDIT REPORT (BANKING ACCOUNTS)</th>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold">No.</td>
				<td class="background_DAEEF3 bold">Aprv date /<br />R&amp;R date </td>
				<td class="background_DAEEF3 bold">Sts</td>
				<td class="background_DAEEF3 bold">Capacity</td>
				<td class="background_DAEEF3 bold">Lender Type</td>
				<td class="background_DAEEF3 bold">Facility</td>
				<td class="background_DAEEF3 bold">Total Outstanding Balance (RM)</td>
				<td class="background_DAEEF3 bold">Date Balance Updated</td>
				<td class="background_DAEEF3 bold">Limit /<br />Inst.Amt <br />(RM)</td>
				<td class="background_DAEEF3 bold">Prin Repymt Term</td>
				<td class="background_DAEEF3 bold">Col Type</td>
				<td class="background_DAEEF3 bold" colspan="12">Conduct of Account for the last 12 months</td>
				<td class="background_DAEEF3 bold">Legal Sts</td>
				<td class="background_DAEEF3 bold">Date Status Update</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold" colspan="11">&#160;</td>
				<td class="background_DAEEF3 bold justify" colspan="12"><div class="left"><xsl:value-of select="end_year"/></div>
				<xsl:if test="not(start_year = end_year)">
					<div class="right"><xsl:value-of select="start_year"/></div>
				</xsl:if>
				<div class="clear"></div>
				</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold" colspan="11" align="left">OUTSTANDING CREDIT</td>
				<xsl:choose>
					<xsl:when test="count(month/item)">
						<xsl:for-each select="month/item">
							<td class="background_DAEEF3 bold"><xsl:value-of select="."/></td>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
					</xsl:otherwise>
				</xsl:choose>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
			</tr>
			<xsl:if test="outstanding_credit/item">
				<xsl:for-each select="outstanding_credit/item">
					<xsl:variable name="master_position">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<xsl:for-each select="master/item">
						<tr>
							<xsl:choose>
								<xsl:when test="not(date = '')">
									<td>
										<xsl:value-of select="$master_position"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="date"/>
							</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(limit) >0">
									<td>
										<xsl:value-of select="format-number(limit, '###,###.00')" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(legal_status) >0">
									<td class="bgRedFontWhite">
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap bgRedFontWhite">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
					
					<xsl:for-each select="sub_account/item/item">
						<tr>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(restructure_reschedule_date) > 0">
									<td class="bgRedFontWhite">
										<xsl:value-of select="restructure_reschedule_date" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="status" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="facility" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(total_outstanding_balance) >0">
									<td>
										<xsl:choose>
											<xsl:when test="total_outstanding_balance = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>

	<xsl:when test="total_outstanding_balance[number(.) &lt; 0]">
		<xsl:value-of select="'0.00'" />
	</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(total_outstanding_balance, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="balance_updated_date" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(installment_amount) >0">
									<td class="bold">
										<xsl:choose>
											<xsl:when test="installment_amount = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>

											<xsl:when test="installment_amount[number(.) &lt; 0]">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(installment_amount, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="principle_repayment_term" />
							</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<xsl:for-each select="credit_position/item">
								<xsl:choose>
									<xsl:when test=". &gt; 1">
										<td class="bgRedFontWhite">
											<xsl:value-of select="."/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td>
											<xsl:value-of select="." />
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td class="bold">TOTAL<br />OUTSTANDING<br />BALANCE:</td>
				<td class="bold">
					<xsl:value-of select="format-number(sum(outstanding_credit/item/sub_account/item/item/total_outstanding_balance[number(.) &gt; 0]), '###,##0.00')" />
				</td>
				<td class="bold">TOTAL<br />LIMIT:</td>
				<td class="bold">
					<xsl:value-of select="format-number(sum(outstanding_credit/item/master/item/limit[number(.)=number(.)]), '###,##0.00')" />
				</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold" colspan="11" align="left">CREDIT APPLICATION</td>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold">No.</td>
				<td class="background_DAEEF3 bold">Aprv date</td>
				<td class="background_DAEEF3 bold">Sts</td>
				<td class="background_DAEEF3 bold">Capacity</td>
				<td class="background_DAEEF3 bold">Lender Type</td>
				<td class="background_DAEEF3 bold">Facility</td>
				<td class="background_DAEEF3 bold">Total Outstanding Balance (RM)</td>
				<td class="background_DAEEF3 bold">Date Balance Updated</td>
				<td class="background_DAEEF3 bold">Limit (RM)</td>
				<td class="background_DAEEF3 bold">Prin Repymt Term</td>
				<td class="background_DAEEF3 bold">Col Type</td>
				<td class="background_DAEEF3 bold" colspan="12">Conduct of Account for the last 12 months</td>
				<td class="background_DAEEF3 bold">Legal Sts</td>
				<td class="background_DAEEF3 bold">Date Status Update</td>
			</tr>
			<xsl:choose>
				<xsl:when test="credit_application/item">
					<xsl:for-each select="credit_application/item">
						<tr>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td class="nowrap">
								<xsl:value-of select="application_date"/>
							</td>
							<td>
								<xsl:value-of select="status"/>
							</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>
								<xsl:value-of select="facility"/>
							</td>
							<td>0</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="format-number(amount_applied[number(.)=number(.)], '###,##0.00')"/>
							</td>
							<td>N/A</td>
							<td>N/A</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td class="bold">TOTAL<br />LIMIT:</td>
						<td class="bold">
							<xsl:value-of select="format-number(sum(credit_application/item/amount_applied[number(.)=number(.)]), '###,##0.00')" />
						</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="25">NO RECORD ON FILE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
			<tr>
				<td colspan="11" align="left" class="background_DAEEF3 bold fontRed">SPECIAL ATTENTION ACCOUNT</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold">No.</td>
				<td class="background_DAEEF3 bold">Aprv date</td>
				<td class="background_DAEEF3 bold">Sts</td>
				<td class="background_DAEEF3 bold">Capacity</td>
				<td class="background_DAEEF3 bold">Lender Type</td>
				<td class="background_DAEEF3 bold">Facility</td>
				<td class="background_DAEEF3 bold">Total Outstanding Balance (RM)</td>
				<td class="background_DAEEF3 bold">Date Balance Updated</td>
				<td class="background_DAEEF3 bold">Limit (RM)</td>
				<td class="background_DAEEF3 bold">Prin Repymt Term</td>
				<td class="background_DAEEF3 bold">Col Type</td>
				<td class="background_DAEEF3 bold" colspan="12">Conduct of Account for the last 12 months</td>
				<td class="background_DAEEF3 bold">Legal Sts</td>
				<td class="background_DAEEF3 bold">Date Status Update</td>
			</tr>
			<xsl:if test="special_attention_account/item">
				<xsl:for-each select="special_attention_account/item">
					<xsl:variable name="sa_master_position">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<xsl:for-each select="master/item">
						<tr>
							<xsl:choose>
								<xsl:when test="not(date = '')">
									<td>
										<xsl:value-of select="$sa_master_position"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="date"/>
							</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(limit) >0">
									<td>
										<xsl:value-of select="format-number(limit, '###,###.00')" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(legal_status) >0">
									<td class="bgRedFontWhite">
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap bgRedFontWhite">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="sub_account/item/item">
						<tr>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
							<xsl:value-of select="status" />
							</td>
								<td>&#160;</td>
								<td>&#160;</td>
							<td>
								<xsl:value-of select="facility" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(total_outstanding_balance) >0">
									<td>
										<xsl:choose>
											<xsl:when test="total_outstanding_balance = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(total_outstanding_balance, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="balance_updated_date" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(installment_amount) >0">
									<td class="bold">
										<xsl:choose>
											<xsl:when test="installment_amount = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>

											<xsl:when test="installment_amount[number(.) &lt; 0]">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(installment_amount, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="principle_repayment_term" />
							</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<xsl:for-each select="credit_position/item">
								<xsl:choose>
									<xsl:when test=". &gt; 1">
									<td class="bgRedFontWhite">
										<xsl:value-of select="."/>
									</td>
									</xsl:when>
									<xsl:otherwise>
										<td>
											<xsl:value-of select="." />
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
		</table>
		<xsl:call-template name="ccris_remark_legend" />
	</xsl:template>
	<!-- END CCRIS DETAILS INFO -->
	
	<!-- BEGIN REMARK LEGEND -->
	<xsl:template match="ccris_remark_legend" name="ccris_remark_legend">
		<xsl:if test="facilities_remark/item or legal_remark/item or status_remark/item">
			<br />
			<table border="0" width="100%" class="woborder highlight small">
				<tr>
					<td class="bold" colspan="4">REMARK LEGEND</td>
				</tr>
				<tr>
					<td width="25%" valign="top">
						<xsl:if test='facilities_remark/item'>
							<p class="bold uline">FACILITY</p>
							<table border="0" width="100%">
								<xsl:for-each select="facilities_remark/item">
								<tr>
									<td width="5%" valign="top"><xsl:value-of select="code" /></td>
									<td width="1%" valign="top">-</td>
									<td><xsl:value-of select="desc" /></td>
								</tr>
								</xsl:for-each>
							</table>
						</xsl:if>
					</td>
					
					<td width="25%" valign="top">
						<xsl:if test='status_remark/item'>
							<p class="bold uline">STATUS</p>
							<table border="0" width="100%">
								<xsl:for-each select="status_remark/item">
								<tr>
									<td width="5%" valign="top"><xsl:value-of select="code" /></td>
									<td width="1%" valign="top">-</td>
									<td><xsl:value-of select="desc" /></td>
								</tr>
								</xsl:for-each>
							</table>
						</xsl:if>
					</td>
					
					<td width="25%" valign="top">
						<xsl:if test='legal_remark/item'>
							<p class="bold uline">LEGAL STATUS</p>
							<table border="0" width="100%">
								<xsl:for-each select="legal_remark/item">
								<tr>
									<td width="5%" valign="top"><xsl:value-of select="code" /></td>
									<td width="1%" valign="top">-</td>
									<td><xsl:value-of select="desc" /></td>
								</tr>
								</xsl:for-each>
							</table>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- END REMARK LEGEND -->
	
	<!-- BEGIN CCRIS_INDIVIDUAL_INFO -->
	<xsl:template match="ccris_individual_info" name="ccris_individual_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION IN OUR DATABANK</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(*)">
					<tr>
						<td width="20%" class="bold">Name Of Subject</td>
						<td width="80%"><xsl:value-of select="name"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">IC / PP No</td>
						<td width="80%"><xsl:value-of select="old_ic"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">New IC No</td>
						<td width="80%"><xsl:value-of select="new_ic"/></td>
					</tr>
					<xsl:if test="note">
						<tr>
							<td colspan="2" class="bold red"><xsl:value-of select="note"/></td>
						</tr>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NOTE: There is no information available in our databank based on the particulars of the subject provided by you.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CCRIS_INDIVIDUAL_INFO -->
	
	<!-- BEGIN CCRIS_INDIVIDUAL_INFO -->
	<xsl:template match="aor_individual_info" name="aor_individual_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION IN OUR DATABANK</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(*)">
					<tr>
						<td width="20%" class="bold">Name Of Subject</td>
						<td width="80%"><xsl:value-of select="name"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">IC / PP No</td>
						<td width="80%"><xsl:value-of select="old_ic"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">New IC No</td>
						<td width="80%"><xsl:value-of select="new_ic"/></td>
					</tr>
					<xsl:if test="note">
						<tr>
							<td colspan="2" class="bold red"><xsl:value-of select="note"/></td>
						</tr>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NOTE: There is no information available in our databank based on the particulars of the subject provided by you.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CCRIS_INDIVIDUAL_INFO -->
	
	<!-- BEGIN CCRIS_INDIVIDUAL_ADDRESSES -->
	<xsl:template match="ccris_individual_addresses" name="ccris_individual_addresses">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="3" align="left">ADDRESS (S) IN BANKING &#38; EXPERIAN  DATABANK<br /><span class="small">NOTE: The address (s) stated below may not be the current or last known address of the subject</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="ccris_individual_address">
					<tr>
						<td width="75%" class="bold">Address</td>
						<td width="15%" class="bold">Date Captured</td>
						<td width="10%" class="bold">Source</td>
					</tr>
					<xsl:for-each select="ccris_individual_address">
						<tr>
							<td><xsl:value-of select="address"/></td>
							<td><xsl:value-of select="date_capture"/></td>
							<td><xsl:value-of select="source_from"/></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="3">NIL</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CCRIS_INDIVIDUAL_ADDRESSES -->
	
	<!-- BEGIN SPKC_INDIVIDUAL_INFO -->
	<xsl:template match="spkc_individual_info" name="spkc_individual_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION IN OUR DATABANK</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(*)">
					<tr>
						<td width="20%" class="bold">Name Of Subject</td>
						<td width="80%"><xsl:value-of select="name"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">IC / PP No</td>
						<td width="80%"><xsl:value-of select="old_ic"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">New IC No</td>
						<td width="80%"><xsl:value-of select="new_ic"/></td>
					</tr>
					<xsl:if test="note">
						<tr>
							<td colspan="2" class="bold red"><xsl:value-of select="note"/></td>
						</tr>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NOTE: There is no information available in our databank based on the particulars of the subject provided by you.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END SPKC_INDIVIDUAL_INFO -->
	
	<!-- BEGIN SPKC_INDIVIDUAL_ADDRESSES -->
	<xsl:template match="spkc_individual_addresses" name="spkc_individual_addresses">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="3" align="left">ADDRESS (S) IN ANGKASA, EXPERIAN &#38; BANKING DATABANK<br /><span class="small">NOTE: The address (s) stated below may not be the current or last known address of the subject</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="spkc_individual_address">
					<tr>
						<td width="75%" class="bold">Address</td>
						<td width="15%" class="bold">Date Captured</td>
						<td width="10%" class="bold">Source</td>
					</tr>
					<xsl:for-each select="spkc_individual_address">
						<tr>
							<td><xsl:value-of select="address"/></td>
							<td><xsl:value-of select="date_capture"/></td>
							<td><xsl:value-of select="source_from"/></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="3">NIL</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END SPKC_INDIVIDUAL_ADDRESSES -->

	<!-- BEGIN RAMCI ISCORE LEGEND -->
	<xsl:template name="ramci_iscore_legend">
		<xsl:choose>
			<xsl:when test="ramci_iscore_legend">
				<div>
					<img src="https://ct.experian.com.my/images/i_score_no_ccris_graph_full.png" />
				</div>
				<br />
				<xsl:call-template name="iscore_legend_text" />
				<br />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END RAMCI ISCORE LEGEND -->
	<!-- BEGIN RAMCI ISCORE LEGEND -->
	<xsl:template name="ramci_iscore_legend_gen2">
		<xsl:choose>
			<xsl:when test="ramci_iscore_legend_gen2">
				<div>
					<img src="http://img.experian.com.my/i_score_no_ccris_graph_full_gen2.png" width ="70%"/>
				</div>
				<br />
				<xsl:call-template name="iscore_legend_text" />
				<br />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END RAMCI ISCORE LEGEND -->

	<!-- BEGIN CCRIS ISCORE LEGEND -->
	<xsl:template name="ccris_iscore_legend">
		<xsl:choose>
			<xsl:when test="ccris_iscore_legend">
				<div>
					<img src="https://ct.experian.com.my/images/i_score_ccris_graph_full.png" />
				</div>
				<br />
				<xsl:call-template name="iscore_legend_text" />
				<br />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END CCRIS ISCORE LEGEND -->
	<!-- BEGIN CCRIS ISCORE LEGEND -->
	<xsl:template name="ccris_iscore_legend_gen2">
		<xsl:choose>
			<xsl:when test="ccris_iscore_legend_gen2">
				<div>
					<img src="http://img.experian.com.my/i_score_ccris_graph_full_gen2.png" width ="70%"/>
				</div>
				<br />
				<xsl:call-template name="iscore_legend_text" />
				<br />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END CCRIS ISCORE LEGEND -->

	<!-- BEGIN N/A ISCORE LEGEND -->
	<xsl:template name="na_iscore_legend">
		<xsl:choose>
			<xsl:when test="na_iscore_legend">
				<xsl:call-template name="iscore_legend_text" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END N/A ISCORE LEGEND -->

	<!-- BEGIN ISCORE LEGEND TEXT-->
	<xsl:template name="iscore_legend_text">
		<div>
			<p class="h3">Explanation</p>
			<p><strong>i-SCORE</strong><br />
			i-SCORE is a credit score, which is a numeric representation of an individual or corporation's credit worthiness, based on prevailing information available on the credit files at the time of scoring. The i-SCORE is calculated using advanced statistical modelling techniques, encapsulates comprehensive credit information (both banking and non-banking) from Experian to give you a simple 3 digits number to objectively assess your customers, business partners, vendors and others, for a better credit decision - the higher the number, the better the individual or corporation's credit worthiness.</p>
			<p><strong>Risk Grade</strong><br />
			Risk Grade is risk segmentation for i-SCORE range for easy understanding and application. It has 10 risk grades from 1 to 10.  A risk grade of "10" is considering the best.<br />
			For non-scored individual, the Risk Grade will be “N/A” as well.
			</p>
			<p><strong>Probability of Default (&#37;)</strong><br />
			It is the predicted likelihood of an individual or corporation not able to repay its debts within the next 12 months.<br /> 
			An individual with a higher probability of default is more risky than one with lower percentage.</p>
			<p><strong>Key Contributing Factors (KCF)</strong><br />
			Key Contributing Factors are the key factors that have impact on why the individual or corporation's i-SCORE cannot be higher. It lists out the top 2 factors that lower the credit score.</p>
			<p><strong>Non-Scored Segment</strong><br />
			The following are 3 scenarios that entity will fall under non-scored segment with i-SCORE = N/A:<br />
			<!--<img src="https://www.ramcreditinfo.com.my/images/iscore_legend_na_kcf.png" />-->
			<table class="legendtext" width="100%" border="0">
				<tr>
					<th>i-SCORE</th>
					<th>Risk Grade</th>
					<th>Key Contributing Factors (KCF)</th>
				</tr>
				<tr>
					<td rowspan="3">A "N/A" will be shown</td>
					<td rowspan="3">A "N/A" will be shown</td>
					<td>Entity has insufficient or no CCRIS and Experian data available for the scoring</td>
				</tr>	
				<tr>
					<td>Entity is below the age of 18 years old</td>
				</tr>
				<tr>			
					<td>Entity has bankruptcy status as per CCRIS or Experian record</td>
				</tr>	
			</table>
			</p>
		</div>
		<br />
	</xsl:template>
	<!-- END ISCORE LEGEND TEXT-->

	<!-- BEGIN RAMCI ISCORE COMMERCIAL LEGEND -->
	<xsl:template name="commercial_iscore_legend">
		<xsl:choose>
			<xsl:when test="commercial_iscore_legend">
				<div>
					<img src="https://ct.experian.com.my/images/i_score_ccris_commercial_graph_full.png" />
				</div>
				<br />
				<xsl:call-template name="iscore_commercial_legend_text" />
				<br />
				<br />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END RAMCI ISCORE LEGEND -->
	<!-- BEGIN RAMCI ISCORE COMMERCIAL LEGEND -->
	<xsl:template name="commercial_iscore_legend_gen2">
		<xsl:choose>
			<xsl:when test="commercial_iscore_legend_gen2">
				<div>
					<img src="http://img.experian.com.my/i_score_ccris_commercial_graph_full_gen2.PNG" width ="70%"/>
				</div>
				<br />
				<xsl:call-template name="iscore_commercial_legend_text_gen2" />
				<br />
				<br />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END RAMCI ISCORE LEGEND -->

	<!-- BEGIN CCRIS ISCORE SOL&PROP LEGEND -->
	<xsl:template name="solprop_iscore_legend">
		<xsl:choose>
			<xsl:when test="solprop_iscore_legend">
				<div>
					<img src="https://ct.experian.com.my/images/i_score_ccris_solprop_graph_full.png" />
				</div>
				<br />
				<xsl:call-template name="iscore_commercial_legend_text" />
				<br />
				<br />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END CCRIS ISCORE LEGEND -->
	<!-- BEGIN CCRIS ISCORE SOL&PROP LEGEND -->
	<xsl:template name="solprop_iscore_legend_gen2">
		<xsl:choose>
			<xsl:when test="solprop_iscore_legend_gen2">
				<div>
					<img src="http://img.experian.com.my/i_score_ccris_solprop_graph_full_gen2.PNG" width ="70%"/>
				</div>
				<br />
				<xsl:call-template name="iscore_commercial_legend_text_gen2" />
				<br />
				<br />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END CCRIS ISCORE LEGEND -->

	<!-- BEGIN N/A ISCORE COMMERCIAL LEGEND -->
	<xsl:template name="commercial_na_iscore_legend">
		<xsl:choose>
			<xsl:when test="commercial_na_iscore_legend">
				<xsl:call-template name="iscore_commercial_legend_text" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END N/A ISCORE LEGEND -->
	<!-- BEGIN N/A ISCORE COMMERCIAL LEGEND -->
	<xsl:template name="commercial_na_iscore_legend_gen2">
		<xsl:choose>
			<xsl:when test="commercial_na_iscore_legend_gen2">
				<xsl:call-template name="iscore_commercial_legend_text_gen2" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- END N/A ISCORE LEGEND -->

	<!-- BEGIN ISCORE COMMERCIAL LEGEND TEXT-->
	<xsl:template name="iscore_commercial_legend_text">
		<div>
			<p class="h3">Explanation</p>
			<p><strong>i-SCORE</strong><br />
			i-SCORE is a credit score, which is a numeric representation of an individual or corporation's credit worthiness, based on prevailing information available on the credit files at the time of scoring. The i-SCORE is calculated using advanced statistical modelling techniques, encapsulates comprehensive credit information (both banking and non-banking) from Experian to give you a simple 3 digits number to objectively assess your customers, business partners, vendors and others, for a better credit decision - the higher the number, the better the individual or corporation's credit worthiness.</p>
			<p><strong>Risk Grade</strong><br />
			Risk Grade is risk segmentation for i-SCORE range for easy understanding and application. It has 10 risk grades from 1 to 10.  A risk grade of “10” is considering the best.<br />
			For non-scored individual, the Risk Grade will be “N/A” as well.
			</p>
			<p><strong>Probability of Default (&#37;)</strong><br />
			It is the predicted likelihood of an individual or corporation not able to repay its debts within the next 12 months.<br /> 
			An individual with a higher probability of default is more risky than one with lower percentage.</p>
			<p><strong>Key Contributing Factors (KCF)</strong><br />
			Key Contributing Factors are the key factors that have impact on why the individual or corporation's i-SCORE cannot be higher. It lists out the top 2 factors that lower the credit score.</p>
			<p><strong>Non-Scored Segment</strong><br />
			The following are 3 scenarios that entity will fall under non-scored segment with i-SCORE = N/A:<br />
			<!--<img src="https://www.ramcreditinfo.com.my/images/iscore_legend_commercial_na_kcf.png" />-->
			<table class="legendtext" width="100%" border="0">
				<tr>
					<th>i-SCORE</th>
					<th>Risk Grade</th>
					<th>Key Contributing Factors (KCF)</th>
				</tr>
				<tr>
					<td rowspan="2">A "N/A" will be shown</td>
					<td rowspan="2">A "N/A" will be shown</td>
					<td>Entity has insufficient or no CCRIS and Experian data available for the scoring</td>
				</tr>
				<tr>
					<td class="show_border">Entity has bankruptcy status as per CCRIS or Experian record</td>
				</tr>
			</table>
			</p>
		</div>
		<br />
	</xsl:template>
	<!-- END ISCORE COMMERCIAL LEGEND TEXT-->
	
	<!-- BEGIN ISCORE COMMERCIAL LEGEND TEXT-->
	<xsl:template name="iscore_commercial_legend_text_gen2">
		<div>
			<p class="h3">Explanation</p>
			<p><strong>i-SCORE</strong><br />
			i-SCORE is a credit score, which is a numeric representation of an individual or corporation's credit worthiness, based on prevailing information available on the credit files at the time of scoring. The i-SCORE is calculated using advanced statistical modelling techniques, encapsulates comprehensive credit information (both banking and non-banking) from Experian to give you a simple 3 digits number to objectively assess your customers, business partners, vendors and others, for a better credit decision - the higher the number, the better the individual or corporation's credit worthiness.</p>
			<p><strong>Risk Grade</strong><br />
			Risk Grade is risk segmentation for i-SCORE range for easy understanding and application. It has 10 risk grades from 1 to 10.  A risk grade of "10" is considering the best.<br />
			For non-scored individual, the Risk Grade will be "N/A" as well.
			</p>
			<p><strong>Probability of Default (&#37;)</strong><br />
			It is the predicted likelihood of an individual or corporation not able to repay its debts within the next 12 months.<br /> 
			An individual with a higher probability of default is more risky than one with lower percentage.</p>
			<p><strong>Key Contributing Factors (KCF)</strong><br />
			Key Contributing Factors are the key factors that have impact on why the individual or corporation's i-SCORE cannot be higher. It lists out the top 2 factors that lower the credit score.</p>
			<p><strong>Non-Scored Segment</strong><br />
			The following are 2 scenarios that entity will fall under non-scored segment with i-SCORE = N/A:<br />
			<!--<img src="http://credittrack.uat.my.ramci.local/images/iscore_legend_commercial_na_kcf.png" />-->
			<table class="legendtext" width="100%" border="0">
				<tr>
					<th>i-SCORE</th>
					<th>Risk Grade</th>
					<th>Key Contributing Factors (KCF)</th>
				</tr>
				<tr>
					<td rowspan="2">A "N/A" will be shown</td>
					<td rowspan="2">A "N/A" will be shown</td>
					<td>Entity has insufficient or no CCRIS and Experian data available for the scoring</td>
				</tr>
				<tr>
					<td class="show_border">Entity has bankruptcy status as per CCRIS or Experian record</td>
				</tr>
			</table>
			</p>
		</div>
		<br />
	</xsl:template>
	<!-- END ISCORE COMMERCIAL LEGEND TEXT-->
	
	<!-- BEGIN LEGEND -->
	<xsl:template match="xml/legend" name="legend">
	<div class="section" style="page-break-before:always;">
		<p class="h2 blue uline">LEGENDS:</p>
		<xsl:choose>
			<xsl:when test="ccrp_data = 1">
				<p class="font12 bold blue uline">SUMMARY - SCORE INTERPRETATION</p>
			</xsl:when>
			<xsl:otherwise>
				<p class="font12 bold blue uline">SECTION 1: SUMMARY - SCORE INTERPRETATION</p>
			</xsl:otherwise>
		</xsl:choose>		
		<p class="h3">i-Score Scale, Probability of Default (PD) and Distribution based on Development Sample</p>
		<xsl:call-template name="ramci_iscore_legend" />
		<xsl:call-template name="ccris_iscore_legend" />
		<xsl:call-template name="na_iscore_legend" />
		<xsl:call-template name="commercial_iscore_legend" />
		<xsl:call-template name="solprop_iscore_legend" />
		<xsl:call-template name="commercial_na_iscore_legend" />
			<xsl:choose>
				<xsl:when test="ccrp_data = 1">
					<p class="font12 bold blue uline">BANKING CREDIT INFORMATION</p>
				</xsl:when>
				<xsl:otherwise>
					<p class="font12 bold blue uline">SECTION 2: BANKING CREDIT INFORMATION</p>
				</xsl:otherwise>
			</xsl:choose>
			<div>
				<p class="h3">Banking Information Warning</p>
				<p>From the system, the user may see CCRIS Warning Message with the meaning as per below:</p>
				<ol type="i">
					<li>Pending Verification - the profile force added by a user awaiting verification by NRD/ROC/ROB of the profile.</li>
					<li>Rejected - the profile had been submitted to NRD for verification but it was rejected due to non-existence of record in the NRD database.</li>
					<li>Deceased - the profile had been submitted to NRD for verification but according to the NRD records, the individual is already "deceased".</li>
					<li>Wound-up - the company had been reported as wound-up by ROC.</li>
				</ol>
			</div>
			<p class="h3">Capacity</p>
			<p>Refers to whether the loan is taken directly or indirectly by the customer</p>
			<ol type="i">
				<li>Own = the credit facility is obtained by the borrower himself.</li>
				<li>Joint = the credit facility is obtained by the borrower himself one of the borrowers in a joint application, eg. in a joint housing loan.</li>
				<li>Sole = the credit facility is obtained by the sole proprietorship in which the borrower is the owner.</li>
				<li>Partner = the credit facility is obtained by the partnership in which the borrower is one of the partners.</li>
				<li>Prof = the credit facility is obtained by the professional body eg. (i.e. lawyers, doctors, accountants who are not registered with ROB) in which the borrower is one of the partners.</li>
			</ol>
			<xsl:choose>
				<xsl:when test="ccrp_data = 1"></xsl:when>
				<xsl:otherwise>
					<p>For more legends, please refer to User Guide</p>
				</xsl:otherwise>
			</xsl:choose>
	</div>
	</xsl:template>
	<!-- END LEGEND -->
	
	<!-- BEGIN LEGEND GEN2 -->
	<xsl:template match="xml/legend_gen2" name="legend_gen2">
	<div class="section" style="page-break-before:always;">
		<p class="h2 blue uline">LEGENDS:</p>
		<xsl:choose>
			<xsl:when test="ccrp_data = 1">
				<p class="font12 bold blue uline">SECTION 1: SUMMARY - SCORE INTERPRETATION</p>
			</xsl:when>
			<xsl:otherwise>				
				<xsl:choose>
					<xsl:when test="commercial_iscore_legend_gen2">
						<p class="font12 bold blue uline">SECTION 1: I-SCORE RANGE AND PROBABILITY OF DEFAULT</p>
					</xsl:when>
					<xsl:when test="ccris_iscore_legend_gen2">
						<p class="font12 bold blue uline">SECTION 1: SUMMARY - SCORE INTERPRETATION</p>
					</xsl:when>
					<xsl:when test="solprop_iscore_legend_gen2">
						<p class="font12 bold blue uline">SECTION 1: I-SCORE RANGE AND PROBABILITY OF DEFAULT </p>
					</xsl:when>
					<xsl:otherwise>
						<p class="font12 bold blue uline">SECTION 1: SUMMARY - SCORE INTERPRETATION </p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>		
		<!--p class="h3">i-Score Scale, Probability of Default (PD) and Distribution based on Development Sample</p-->
		<xsl:call-template name="ramci_iscore_legend_gen2" />
		<xsl:call-template name="ccris_iscore_legend_gen2" />
		<xsl:call-template name="na_iscore_legend" />
		<xsl:call-template name="commercial_iscore_legend_gen2" />
		<xsl:call-template name="solprop_iscore_legend_gen2" />
		<xsl:call-template name="commercial_na_iscore_legend_gen2" />
			<xsl:choose>
				<xsl:when test="ccrp_data = 1">
					<p class="font12 bold blue uline">BANKING CREDIT INFORMATION</p>
				</xsl:when>
				<xsl:otherwise>
					<p class="font12 bold blue uline">SECTION 2: BANKING CREDIT INFORMATION</p>
				</xsl:otherwise>
			</xsl:choose>
			<div>
				<p class="h3 uline">Banking Information Warning</p>
				<p>From the system, the user may see CCRIS Warning Message with the meaning as per below:</p>
				<ol type="i">
					<li>Pending Verification - the profile force added by a user awaiting verification by NRD/ROC/ROB of the profile.</li>
					<li>Rejected - the profile had been submitted to NRD for verification but it was rejected due to non-existence of record in the NRD database.</li>
					<li>Deceased - the profile had been submitted to NRD for verification but according to the NRD records, the individual is already "deceased".</li>
					<li>Wound-up - the company had been reported as wound-up by ROC.</li>
				</ol>
			</div>
			
			<div>
				<p class="h3 uline">Secured Facility</p>
				<p>Refer to loan which the borrower pledges some asset as collateral for the loan, which then becomes a secured debt owed to the creditor who gives the loan.</p>
			</div>

			<div>
				<p class="h3 uline">Unsecured Facility</p>
				<p>Refer to loan that is not collateralized by a lien on specific assets of the borrower.</p>
			</div>

			<div>
				<p class="h3 uline">Credit Card average utilization last 6 months</p>
				<p>[(monthly credit card total outstanding balance/ total limit) for last 6 months]*100<br/>
				The ratio of credit card utilized amount compared to your credit limit for the last 6 months.</p>
			</div>

			<div>
				<p class="h3 uline">Other Revolving Credits average utilization last 6 months</p>
				<p>[(monthly other revolving credits facility total outstanding balance / total limit) for last 6 months]*100<br/>
				The ratio of all other revolving loans outstanding amount compared to the total limit for the last 6 months. It includes Overdraft, revolving credit facility, share margin financing facility and other such revolving facilities.</p>
			</div>

			<p class="h3 uline">Capacity</p>
			<p>Refers to whether the loan is taken directly or indirectly by the customer</p>
			<ol type="i">
				<li>Own = the credit facility is obtained by the borrower himself.</li>
				<li>Joint = the credit facility is obtained by the borrower himself one of the borrowers in a joint application, eg. in a joint housing loan.</li>
				<li>Sole = the credit facility is obtained by the sole proprietorship in which the borrower is the owner.</li>
				<li>Partner = the credit facility is obtained by the partnership in which the borrower is one of the partners.</li>
				<li>Prof = the credit facility is obtained by the professional body eg. (i.e. lawyers, doctors, accountants who are not registered with ROB) in which the borrower is one of the partners.</li>
			</ol>
			<xsl:choose>
				<xsl:when test="ccrp_data = 1"></xsl:when>
				<xsl:otherwise>
					<p>For more legends, please refer to User Guide</p>
				</xsl:otherwise>
			</xsl:choose>
	</div>
	</xsl:template>
	<!-- END LEGEND GEN2 -->
	
	<!-- BEGIN AOR LEGEND -->
	<xsl:template match="xml/aor_legend" name="aor_legend">
		<p>For more legends, please refer to User Guide</p>
	</xsl:template>
	<!-- END AOR LEGEND -->
	
	<!-- BEGIN PCRP BANKING INFO -->
	<xsl:template match="banking_info_pcrp" name="banking_info_pcrp">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">BANKING CREDIT INFORMATION</th>
			</tr>
			<tr>
				<td colspan="2"><em>Note: The following information has been extracted from Bank Negara Malaysia. The information is confidential and shall not be disclosed to any other person. We do not warrant as to its accuracy, correctness or completeness. If there is any inconsistency, inaccuracies or missing details or information, please contact Experian Consumer Support Department for assistance.</em></td>
			</tr>
			<tr>
				<td class="bold" colspan="2">Subject Status</td>
			</tr>
			<tr>
				<td class="bold" width="30%">Warning Remark</td>
				<td  width="70%">
					<xsl:choose>
						<xsl:when test="string-length(ccris_banking_warning)">
							<xsl:value-of select="ccris_banking_warning"/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<br/>
		<table border="0" width="100%" class="full_border_2p">
			<tr>
				<td class="background_DAEEF3 bold" rowspan="3">No.</td>
				<td class="background_DAEEF3 bold" rowspan="3">Approval<br/>date</td>
				<td class="background_DAEEF3 bold" rowspan="3">Status</td>
				<td class="background_DAEEF3 bold" rowspan="3">Capacity</td>
				<td class="background_DAEEF3 bold" rowspan="3">Lender</td>
				<td class="background_DAEEF3 bold" rowspan="3">Branch<br />Code</td>
				<td class="background_DAEEF3 bold" rowspan="3">Facility</td>
				<td class="background_DAEEF3 bold" rowspan="3">Total Outstanding<br/>Balance (RM)</td>
				<td class="background_DAEEF3 bold" rowspan="3">Date Balance Updated</td>
				<td class="background_DAEEF3 bold" rowspan="3">Limit (RM)</td>
				<td class="background_DAEEF3 bold" rowspan="3">Principal<br/>Repayment<br/>Term</td>
				<td class="background_DAEEF3 bold" rowspan="3">Collateral Type</td>
				<td class="background_DAEEF3 bold" colspan="12" align="center">Installment In Arrears for Last 12 Months</td>
				<td class="background_DAEEF3 bold" rowspan="3">Legal Status</td>
				<td class="background_DAEEF3 bold" rowspan="3">Date Status Updated</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold justify" colspan="12"><div class="left"><xsl:value-of select="ccris_banking_details/end_year"/></div>
				<xsl:if test="not(ccris_banking_details/start_year = ccris_banking_details/end_year)">
					<div class="right"><xsl:value-of select="ccris_banking_details/start_year"/></div>
				</xsl:if>
				<div class="clear"></div>
				</td>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="count(ccris_banking_details/month/item)">
						<xsl:for-each select="ccris_banking_details/month/item">
							<td class="background_DAEEF3 bold"><xsl:value-of select="."/></td>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold" colspan="12">CREDIT ACCOUNTS (Including Subject&#39;s own/ joint/ sole-proprietor/ partnership accounts)</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
			</tr>
			<xsl:if test="ccris_banking_details/outstanding_credit/item">
				<xsl:for-each select="ccris_banking_details/outstanding_credit/item">
					<xsl:variable name="master_position">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<xsl:for-each select="master/item">
						<tr>
							<xsl:choose>
								<xsl:when test="not(date = '')">
									<td>
										<xsl:value-of select="$master_position"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="date"/>
							</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>
								<xsl:value-of select="branch_code"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(limit) > 0">
									<td>
										<xsl:value-of select="format-number(limit, '###,###.00')" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(legal_status) >0">
									<td>
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
					
					<xsl:for-each select="sub_account/item/item">
						<tr>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="status" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="facility" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(total_outstanding_balance) >0">
									<td>
										<xsl:choose>
											<xsl:when test="total_outstanding_balance = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(total_outstanding_balance, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="balance_updated_date" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(installment_amount) >0">
									<td>
										<xsl:choose>
											<xsl:when test="installment_amount = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>

											<xsl:when test="installment_amount[number(.) &lt; 0]">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(installment_amount, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="principle_repayment_term" />
							</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<xsl:for-each select="credit_position/item">
								<td>
									<xsl:value-of select="." />
								</td>
							</xsl:for-each>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td class="bold">TOTAL<br />OUTSTANDING<br />BALANCE:</td>
				<td class="bold">
					<xsl:value-of select="format-number(sum(ccris_banking_details/outstanding_credit/item/sub_account/item/item/total_outstanding_balance[number(.)=number(.)]), '###,##0.00')" />
				</td>
				<td class="bold">TOTAL<br />LIMIT:</td>
				<td class="bold">
					<xsl:value-of select="format-number(sum(ccris_banking_details/outstanding_credit/item/master/item/limit[number(.)=number(.)]), '###,##0.00')" />
				</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold fontRed" colspan="12">SPECIAL ATTENTION ACCOUNTS</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
			</tr>
			<xsl:if test="ccris_banking_details/special_attention_account/item">
				<xsl:for-each select="ccris_banking_details/special_attention_account/item">
					<xsl:variable name="master_position">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<xsl:for-each select="master/item">
						<tr>
							<xsl:choose>
								<xsl:when test="not(date = '')">
									<td>
										<xsl:value-of select="$master_position"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="date"/>
							</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>
								<xsl:value-of select="branch_code"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(limit) > 0">
									<td>
										<xsl:value-of select="format-number(limit, '###,###.00')" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(legal_status) >0">
									<td class="bgRedFontWhite">
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap bgRedFontWhite">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
					
					<xsl:for-each select="sub_account/item/item">
						<tr>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="facility" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(total_outstanding_balance) >0">
									<td>
										<xsl:choose>
											<xsl:when test="total_outstanding_balance = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(total_outstanding_balance, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="balance_updated_date" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(installment_amount) >0">
									<td>
										<xsl:choose>
											<xsl:when test="installment_amount = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>

											<xsl:when test="installment_amount[number(.) &lt; 0]">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(installment_amount, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="principle_repayment_term" />
							</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<xsl:for-each select="credit_position/item">
								<td>
									<xsl:value-of select="." />
								</td>
							</xsl:for-each>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold" colspan="11" align="left">APPLICATION FOR CREDIT</td>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
			</tr>
			<xsl:choose>
				<xsl:when test="ccris_banking_details/credit_application/item">
					<xsl:for-each select="ccris_banking_details/credit_application/item">
						<tr>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td class="nowrap">
								<xsl:value-of select="application_date"/>
							</td>
							<td>
								<xsl:value-of select="status"/>
							</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>
								<xsl:value-of select="branch_code"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="format-number(amount_applied[number(.)=number(.)], '###,##0.00')"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td class="bold">TOTAL<br />LIMIT:</td>
						<td class="bold">
							<xsl:value-of select="format-number(sum(ccris_banking_details/credit_application/item/amount_applied[number(.)=number(.)]), '###,##0.00')" />
						</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="25">NO RECORD ON FILE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<xsl:call-template name="ccris_remark_legend_pcrp" />
	</xsl:template>
	<!-- END PCRP BANKING INFO -->
	
	<!-- BEGIN PCRP REMARK LEGEND -->
	<xsl:template match="ccris_remark_legend_pcrp" name="ccris_remark_legend_pcrp">
		<xsl:if test="ccris_banking_details/branch_remark/item">
			<br />
			<table border="0" width="100%" class="nostyle highlight small">
				<tr>
					<td class="bold" colspan="4">NOTES</td>
				</tr>
				<tr>
					<td width="25%" valign="top">
						<xsl:if test='ccris_banking_details/branch_remark/item'>
							<p class="bold uline">Branch Code:</p>
							<table border="0" width="100%">
								<xsl:for-each select="ccris_banking_details/branch_remark/item">
									<tr>
										<td class="bold uline" colspan="3"><xsl:value-of select="bank" /></td>
									</tr>
									<xsl:for-each select="branches/branch">
										<tr>
											<td width="10%" valign="top"><xsl:value-of select="code" /></td>
											<td width="1%" valign="top">-</td>
											<td width="89%" ><xsl:value-of select="desc" /></td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</table>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br />
	</xsl:template>
	<!-- END PCRP REMARK LEGEND -->
    

    <!-- BEGIN CCRP BANKING INFO -->
	<xsl:template match="banking_info_ccrp" name="banking_info_ccrp">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">BANKING CREDIT INFORMATION</th>
			</tr>
			<tr>
				<td colspan="2"><em>Note: The following information has been extracted from Bank Negara Malaysia. The information is confidential and shall not be disclosed to any other person. We do not warrant as to its accuracy, correctness or completeness. If there is any inconsistency, inaccuracies or missing details or information, please contact Experian Consumer Support Department for assistance.</em></td>
			</tr>
			<tr>
				<td class="bold" colspan="2">Subject Status</td>
			</tr>
			<tr>
				<td class="bold" width="30%">Warning Remark</td>
				<td  width="70%">
					<xsl:choose>
						<xsl:when test="string-length(ccris_banking_warning)">
							<xsl:value-of select="ccris_banking_warning"/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<td align="left" colspan="3" class="bold">Total no. of Credit Applications</td>
			</tr>
			<tr>
				<td>&#160;</td>
				<td class="bold">No. of Applications</td>
				<td class="bold">Total Amount (RM)</td>
			</tr>
			<tr>
				<td class="bold">A. Approved for past 12 months</td>
				<td>
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_credit_report/approved_count">
							<xsl:value-of select="ccris_banking_summary/summary_credit_report/approved_count"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_credit_report/approved_amount">
							<xsl:value-of select="format-number(ccris_banking_summary/summary_credit_report/approved_amount, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="bold">B. Pending</td>
				<td>
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_credit_report/pending_count">
							<xsl:value-of select="ccris_banking_summary/summary_credit_report/pending_count"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_credit_report/pending_amount">
							<xsl:value-of select="format-number(ccris_banking_summary/summary_credit_report/pending_amount, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left" colspan="4">SUMMARY OF POTENTIAL &#38; CURRENT LIABILITIES</th>
			</tr>
			<tr>
				<td>&#160;</td>
				<td class="bold">Outstanding (RM) <br /><span class="small">(Exclude FEC)</span></td>
				<td class="bold">Total Limit (RM) <br /><span class="small">(Exclude FEC)</span></td>
				<td class="bold">FEC Limit (RM)</td>
			</tr>
			<tr>
				<td class="bold">As Borrower</td>
				<td>
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_liabilities/borrower/outstanding">
							<xsl:value-of select="format-number(ccris_banking_summary/summary_liabilities/borrower/outstanding, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_liabilities/borrower/total_limit">
							<xsl:value-of select="format-number(ccris_banking_summary/summary_liabilities/borrower/total_limit, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_liabilities/borrower/fec_limit">
							<xsl:value-of select="format-number(ccris_banking_summary/summary_liabilities/borrower/fec_limit, '###,##0.00')"/>
						</xsl:when>
						<xsl:otherwise>
							0.00
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="ccris_banking_summary/summary_liabilities/guarantor">
				<tr>
					<td class="bold">As Guarantor</td>
					<td>
						<xsl:choose>
							<xsl:when test="ccris_banking_summary/summary_liabilities/guarantor/outstanding">
								<xsl:value-of select="format-number(ccris_banking_summary/summary_liabilities/borrower/outstanding, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="ccris_banking_summary/summary_liabilities/guarantor/total_limit">
								<xsl:value-of select="format-number(ccris_banking_summary/summary_liabilities/guarantor/total_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="ccris_banking_summary/summary_liabilities/guarantor/fec_limit">
								<xsl:value-of select="format-number(ccris_banking_summary/summary_liabilities/guarantor/fec_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0.00
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="ccris_banking_summary/summary_liabilities/total">
				<tr>
					<td class="bold">Total</td>
					<td>&#160;</td>
					<td>
						<xsl:choose>
							<xsl:when test="ccris_banking_summary/summary_liabilities/total/total_limit">
								<xsl:value-of select="format-number(ccris_banking_summary/summary_liabilities/total/total_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="ccris_banking_summary/summary_liabilities/total/fec_limit">
								<xsl:value-of select="format-number(ccris_banking_summary/summary_liabilities/total/fec_limit, '###,##0.00')"/>
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="bold fontRed">Legal Action Taken</td>
				<td colspan="3">
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_liabilities/legal_action_taken">
							<xsl:value-of select="ccris_banking_summary/summary_liabilities/legal_action_taken"/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="bold fontRed">Special Attention Account</td>
				<td colspan="3">
					<xsl:choose>
						<xsl:when test="ccris_banking_summary/summary_liabilities/special_attention_account">
							<xsl:value-of select="ccris_banking_summary/summary_liabilities/special_attention_account"/>
						</xsl:when>
						<xsl:otherwise>
							NIL
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<br/>
		<table border="0" width="100%" class="full_border_2p">
			<tr>
				<td class="background_DAEEF3 bold" rowspan="3">No.</td>
				<td class="background_DAEEF3 bold" rowspan="3">Approval<br/>date</td>
				<td class="background_DAEEF3 bold" rowspan="3">Status</td>
				<td class="background_DAEEF3 bold" rowspan="3">Capacity</td>
				<td class="background_DAEEF3 bold" rowspan="3">Lender</td>
				<td class="background_DAEEF3 bold" rowspan="3">Branch<br />Code</td>
				<td class="background_DAEEF3 bold" rowspan="3">Facility</td>
				<td class="background_DAEEF3 bold" rowspan="3">Total Outstanding<br/>Balance (RM)</td>
				<td class="background_DAEEF3 bold" rowspan="3">Date Balance Updated</td>
				<td class="background_DAEEF3 bold" rowspan="3">Limit (RM)</td>
				<td class="background_DAEEF3 bold" rowspan="3">Principal<br/>Repayment<br/>Term</td>
				<td class="background_DAEEF3 bold" rowspan="3">Collateral Type</td>
				<td class="background_DAEEF3 bold" colspan="12" align="center">Installment In Arrears for Last 12 Months</td>
				<td class="background_DAEEF3 bold" rowspan="3">Legal Status</td>
				<td class="background_DAEEF3 bold" rowspan="3">Date Status Updated</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold justify" colspan="12"><div class="left"><xsl:value-of select="ccris_banking_details/end_year"/></div>
				<xsl:if test="not(ccris_banking_details/start_year = ccris_banking_details/end_year)">
					<div class="right"><xsl:value-of select="ccris_banking_details/start_year"/></div>
				</xsl:if>
				<div class="clear"></div>
				</td>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="count(ccris_banking_details/month/item)">
						<xsl:for-each select="ccris_banking_details/month/item">
							<td class="background_DAEEF3 bold"><xsl:value-of select="."/></td>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
						<th>&#160;</th>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold" colspan="12">CREDIT ACCOUNTS (Including Subject&#39;s own/ joint/ sole-proprietor/ partnership accounts)</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
			</tr>
			<xsl:if test="ccris_banking_details/outstanding_credit/item">
				<xsl:for-each select="ccris_banking_details/outstanding_credit/item">
					<xsl:variable name="master_position">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<xsl:for-each select="master/item">
						<tr>
							<xsl:choose>
								<xsl:when test="not(date = '')">
									<td>
										<xsl:value-of select="$master_position"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="date"/>
							</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>
								<xsl:value-of select="branch_code"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(limit) > 0">
									<td>
										<xsl:value-of select="format-number(limit, '###,###.00')" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(legal_status) >0">
									<td class="bgRedFontWhite">
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap bgRedFontWhite">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
					
					<xsl:for-each select="sub_account/item/item">
						<tr>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="status" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="facility" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(total_outstanding_balance) >0">
									<td>
										<xsl:choose>
											<xsl:when test="total_outstanding_balance = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(total_outstanding_balance, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="balance_updated_date" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(installment_amount) >0">
									<td>
										<xsl:choose>
											<xsl:when test="installment_amount = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>

											<xsl:when test="installment_amount[number(.) &lt; 0]">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(installment_amount, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="principle_repayment_term" />
							</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<xsl:for-each select="credit_position/item">
								<td>
									<xsl:value-of select="." />
								</td>
							</xsl:for-each>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td class="bold">TOTAL<br />OUTSTANDING<br />BALANCE:</td>
				<td class="bold">
					<xsl:value-of select="format-number(sum(ccris_banking_details/outstanding_credit/item/sub_account/item/item/total_outstanding_balance[number(.)=number(.)]), '###,##0.00')" />
				</td>
				<td class="bold">TOTAL<br />LIMIT:</td>
				<td class="bold">
					<xsl:value-of select="format-number(sum(ccris_banking_details/outstanding_credit/item/master/item/limit[number(.)=number(.)]), '###,##0.00')" />
				</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold fontRed" colspan="12">SPECIAL ATTENTION ACCOUNTS</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
				<td class="background_DAEEF3 bold">&#160;</td>
			</tr>
			<xsl:if test="ccris_banking_details/special_attention_account/item">
				<xsl:for-each select="ccris_banking_details/special_attention_account/item">
					<xsl:variable name="master_position">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<xsl:for-each select="master/item">
						<tr>
							<xsl:choose>
								<xsl:when test="not(date = '')">
									<td>
										<xsl:value-of select="$master_position"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="date"/>
							</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>
								<xsl:value-of select="branch_code"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(limit) > 0">
									<td>
										<xsl:value-of select="format-number(limit, '###,###.00')" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<xsl:choose>
								<xsl:when test="string-length(legal_status) >0">
									<td class="bgRedFontWhite">
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap bgRedFontWhite">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="legal_status" />
									</td>
									<td class="nowrap">
										<xsl:value-of select="legal_status_date" />
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
					
					<xsl:for-each select="sub_account/item/item">
						<tr>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="facility" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(total_outstanding_balance) >0">
									<td>
										<xsl:choose>
											<xsl:when test="total_outstanding_balance = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(total_outstanding_balance, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="nowrap">
								<xsl:value-of select="balance_updated_date" />
							</td>
							<xsl:choose>
								<xsl:when test="string-length(installment_amount) >0">
									<td>
										<xsl:choose>
											<xsl:when test="installment_amount = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>

											<xsl:when test="installment_amount[number(.) &lt; 0]">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(installment_amount, '###,###.00')" />
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="principle_repayment_term" />
							</td>
							<td>
								<xsl:value-of select="collateral_type" />
							</td>
							<xsl:for-each select="credit_position/item">
								<td>
									<xsl:value-of select="." />
								</td>
							</xsl:for-each>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<tr>
				<td class="background_DAEEF3 bold" colspan="11" align="left">APPLICATION FOR CREDIT</td>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
				<th>&#160;</th>
			</tr>
			<xsl:choose>
				<xsl:when test="ccris_banking_details/credit_application/item">
					<xsl:for-each select="ccris_banking_details/credit_application/item">
						<tr>
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td class="nowrap">
								<xsl:value-of select="application_date"/>
							</td>
							<td>
								<xsl:value-of select="status"/>
							</td>
							<td>
								<xsl:value-of select="capacity"/>
							</td>
							<td>
								<xsl:value-of select="lender_type"/>
							</td>
							<td>
								<xsl:value-of select="branch_code"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>
								<xsl:value-of select="format-number(amount_applied[number(.)=number(.)], '###,##0.00')"/>
							</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
							<td>&#160;</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td class="bold">TOTAL<br />LIMIT:</td>
						<td class="bold">
							<xsl:value-of select="format-number(sum(ccris_banking_details/credit_application/item/amount_applied[number(.)=number(.)]), '###,##0.00')" />
						</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
						<td>&#160;</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="25">NO RECORD ON FILE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<xsl:call-template name="ccris_remark_legend_ccrp" />
	</xsl:template>
	<!-- END CCRP BANKING INFO -->    

	<!-- BEGIN CCRP REMARK LEGEND -->
	<xsl:template match="ccris_remark_legend_ccrp" name="ccris_remark_legend_ccrp">
		<xsl:if test="ccris_banking_details/branch_remark/item">
			<br />
			<table border="0" width="100%" class="nostyle highlight small">
				<tr>
					<td class="bold" colspan="4">NOTES</td>
				</tr>
				<tr>
					<td width="25%" valign="top">
						<xsl:if test='ccris_banking_details/branch_remark/item'>
							<p class="bold uline">Branch Code:</p>
							<table border="0" width="100%">
								<xsl:for-each select="ccris_banking_details/branch_remark/item">
									<tr>
										<td class="bold uline" colspan="3"><xsl:value-of select="bank" /></td>
									</tr>
									<xsl:for-each select="branches/branch">
										<tr>
											<td width="10%" valign="top"><xsl:value-of select="code" /></td>
											<td width="1%" valign="top">-</td>
											<td width="89%" ><xsl:value-of select="desc" /></td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</table>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br />
	</xsl:template>
	<!-- END CCRP REMARK LEGEND -->
        
        <!-- BEGIN CCRIS ENTITY SELECTED BY YOU SECTION -->
	<xsl:template match="ccris_selected_by_you" name="ccris_selected_by_you">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">CCRIS ENTITY SELECTED BY YOU</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Entity Name</td>
				<td width="80%"><xsl:value-of select="entity_name"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Entity ID No. 1</td>
				<td width="80%"><xsl:value-of select="entity_id"/></td>
			</tr>
            <tr>
				<td width="20%" class="bold">Entity ID No. 2</td>
				<td width="80%"><xsl:value-of select="entity_id2"/></td>
			</tr>
		</table>
                <br />
	</xsl:template>
	<!-- END CCRIS ENTITY SELECTED BY YOU SECTION -->

	<!-- BEGIN i-SCORE SECTION -->
	<xsl:template match="i_score" name="i_score">
		<div style="page-break-before:always;">
		<br />		
		<div style='font-size: 28px;'>i-SCORE</div>
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="14" align="left" class="show_border">CREDIT SCORE<br /><span class="small">Note: The i-SCORE is a credit score, which is a numeric representation of an individual or corporate's credit worthiness, based on prevailing information available on the credit files at the time of scoring. i-SCORE does not provide any conclusive evaluation or credit decisions for credit grantors.</span></th>
			</tr>
			<tr>
				<td width="30%" class="bold">i-SCORE</td>
				<xsl:choose>
					<xsl:when test="not(i_score = 0)">
						<td width="70%" colspan="13"><b><xsl:value-of select="i_score"/></b></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="70%" colspan="13">N/A</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td width="30%" class="bold" rowspan="2">Risk Grade</td>
				<xsl:choose>
					<xsl:when test="not(risk_grade = 0)">
						<td width="5%" align="center" class="risk_grade_not_active" rowspan="2">Higher Risk</td>
						<xsl:choose>
							<xsl:when test="i_score_risk_grade_format_consumer">
								<xsl:call-template name="i_score_risk_grade_format_consumer" />
							</xsl:when>
							<xsl:when test="i_score_risk_grade_format_commercial">
								<xsl:call-template name="i_score_risk_grade_format_commercial" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="i_score_risk_grade_fromat"></xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<td width="5%" class="risk_grade_not_active" rowspan="2">Lower Risk</td>
					</xsl:when>
					<xsl:otherwise>
						<td width="70%" colspan="12">N/A</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="not(risk_grade = 0)">						
						<xsl:call-template name="i_score_risk_grade_loop">
							<xsl:with-param name="num" select="number(1)" />
							<xsl:with-param name="risk_grade" select="risk_grade" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<td width="70%" colspan="12">N/A</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>		
            <tr>
				<td width="30%" class="bold">Key Contributing Factors<br />(Why the Score is not Higher>)</td>
				<td width="70%" colspan="14" class="no-padding">
					<xsl:choose>
						<xsl:when test="count(key_factor/item) ">
							<xsl:for-each select="key_factor/item">
								<p>&#8226;&#160;<xsl:value-of select="."/></p>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							N/A
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
        <br />
		</div>
        </xsl:template>
        <!-- END i-SCORE SECTION -->

	<!-- BEGIN i-SCORE SECTION -->
	<xsl:template match="i_score_ccrp" name="i_score_ccrp">
		<br />		
		<div style='font-size: 28px;'>i-SCORE</div>
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="14" align="left" class="show_border">CREDIT SCORE<br /><span class="small">Note: The i-SCORE is a credit score, which is a numeric representation of an individual or corporate's credit worthiness, based on prevailing information available on the credit files at the time of scoring. i-SCORE does not provide any conclusive evaluation or credit decisions for credit grantors.</span></th>
			</tr>
			<tr>
				<td width="30%" class="bold">i-SCORE</td>
				<xsl:choose>
					<xsl:when test="not(i_score = 0)">
						<td width="70%" colspan="13"><b><xsl:value-of select="i_score"/></b></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="70%" colspan="13">N/A</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td width="30%" class="bold" rowspan="2">Risk Grade</td>
				<xsl:choose>
					<xsl:when test="not(risk_grade = 0)">
						<td width="5%" align="center" class="risk_grade_not_active" rowspan="2">Higher Risk</td>
						<xsl:choose>
							<xsl:when test="i_score_risk_grade_format_commercial">
								<xsl:call-template name="i_score_risk_grade_format_commercial" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="i_score_risk_grade_fromat"></xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>						
						<td width="5%" class="risk_grade_not_active" rowspan="2">Lower Risk</td>
					</xsl:when>
					<xsl:otherwise>
						<td width="70%" colspan="12">N/A</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<xsl:choose>
					<xsl:when test="not(risk_grade = 0)">						
						<xsl:call-template name="i_score_risk_grade_loop">
							<xsl:with-param name="num" select="number(1)" />
							<xsl:with-param name="risk_grade" select="risk_grade" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<td width="70%" colspan="12">N/A</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>		
            <tr>
				<td width="30%" class="bold">Key Contributing Factors<br />(Why the Score is not Higher>)</td>
				<td width="70%" colspan="14" class="no-padding">
					<xsl:choose>
						<xsl:when test="count(key_factor/item) ">
							<xsl:for-each select="key_factor/item">
								<p>&#8226;&#160;<xsl:value-of select="."/></p>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							N/A
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
        <br />
        </xsl:template>
        <!-- END i-SCORE SECTION -->
		
        <!-- BEGIN i-SCORE RISK GRADE LOOP SECTION -->
        <xsl:template name="i_score_risk_grade_loop">
        	<xsl:param name="num" />
        	<xsl:param name="risk_grade" />
        	<xsl:if test="not($num = 11)">
        		<xsl:choose>
					<xsl:when test="$risk_grade = $num">
						<td width="6%" class="risk_grade_active"><xsl:value-of select="$num" /></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="6%" class="risk_grade_not_active"><xsl:value-of select="$num" /></td>
					</xsl:otherwise>
				</xsl:choose>
        		<xsl:call-template name="i_score_risk_grade_loop">
        			<xsl:with-param name="num" select="$num + 1" />
        			<xsl:with-param name="risk_grade" select="$risk_grade" />
        		</xsl:call-template>
        	</xsl:if>
        </xsl:template>
        <!-- END i-SCORE RISK GRADE LOOP SECTION -->

        <!-- BEGIN i-SCORE RISK GRADE FORMAT SECTION -->
		<xsl:template name="i_score_risk_grade_fromat">
			<xsl:choose>
				<xsl:when test="grade_format='WEAK'">
					<td colspan="3" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="3" class="risk_grade_not_active">WEAK</td>
				</xsl:otherwise>				
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='FAIR'">
					<td colspan="2" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="2" class="risk_grade_not_active">FAIR</td>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='GOOD'">
					<td colspan="2" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="2" class="risk_grade_not_active">GOOD</td>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='STRONG'">
					<td colspan="3" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="3" class="risk_grade_not_active">STRONG</td>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:template>			
        <!-- END i-SCORE RISK GRADE FORMAT SECTION -->
		
        <!-- BEGIN i-SCORE RISK GRADE FORMAT SECTION -->
		<xsl:template name="i_score_risk_grade_format_consumer">
			<xsl:choose>
				<xsl:when test="grade_format='WEAK'">
					<td colspan="4" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="4" class="risk_grade_not_active">WEAK</td>
				</xsl:otherwise>				
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='FAIR'">
					<td colspan="2" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="2" class="risk_grade_not_active">FAIR</td>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='GOOD'">
					<td colspan="2" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="2" class="risk_grade_not_active">GOOD</td>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='STRONG'">
					<td colspan="2" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="2" class="risk_grade_not_active">STRONG</td>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:template>			
        <!-- END i-SCORE RISK GRADE FORMAT SECTION -->
		
        <!-- BEGIN i-SCORE RISK GRADE FORMAT SECTION -->
		<xsl:template name="i_score_risk_grade_format_commercial">
			<xsl:choose>
				<xsl:when test="grade_format='WEAK'">
					<td colspan="3" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="3" class="risk_grade_not_active">WEAK</td>
				</xsl:otherwise>				
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='FAIR'">
					<td colspan="3" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="3" class="risk_grade_not_active">FAIR</td>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='GOOD'">
					<td colspan="2" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="2" class="risk_grade_not_active">GOOD</td>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="grade_format='STRONG'">
					<td colspan="2" class="risk_grade_active"><xsl:value-of select="grade_format" /></td>
				</xsl:when>
				<xsl:otherwise>
					<td colspan="2" class="risk_grade_not_active">STRONG</td>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:template>			
        <!-- END i-SCORE RISK GRADE FORMAT SECTION -->		
		
		
        <!-- BEGIN i-SCORE PCRP SECTION -->
        <xsl:template match="i_score_pcrp" name="i_score_pcrp">
		<div style='font-size: 28px;'>i-SCORE</div>
		<table>
			<tr>
				<td width="760">
					<table border="0" width="100%" class="full_border">
						<tr>
							<th colspan="14" align="left" class="show_border">CREDIT SCORE<br /><span class="small">NOTE: The i-SCORE is a credit score, which is a numeric representation of an individual's credit worthiness, based on prevailing information available on the credit files at the time of scoring. The majority of credit grantors use some sort of credit scoring model to help predict what kind of credit risk you may be. Other factors, such as your salary and length of employment, may also be considered by credit grantors when you apply for a loan. As a risk assessment tool, i-SCORE does not provide any conclusive, evaluation or credit decisions for credit grantors.</span></th>
						</tr>
						<tr>
							<td width="30%" class="bold">i-SCORE</td>
							<xsl:choose>
								<xsl:when test="not(i_score = 0)">
									<td width="70%" colspan="13"><xsl:value-of select="i_score"/></td>
								</xsl:when>
								<xsl:otherwise>
									<td width="70%" colspan="13">N/A</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
						<tr>
							<td width="30%" class="bold" rowspan="2">Risk Grade</td>
							<xsl:choose>
								<xsl:when test="not(risk_grade = 0)">
									<td width="5%" align="center" rowspan="2">Higher Risk</td>
									<xsl:choose>
										<xsl:when test="i_score_risk_grade_format_consumer">
											<xsl:call-template name="i_score_risk_grade_format_consumer" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="i_score_risk_grade_fromat"></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<td width="5%" rowspan="2">Lower Risk</td>
								</xsl:when>
								<xsl:otherwise>
									<td width="70%" colspan="12">N/A</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
						<tr>
							<xsl:choose>
								<xsl:when test="not(risk_grade = 0)">						
									<xsl:call-template name="i_score_risk_grade_loop">
										<xsl:with-param name="num" select="number(1)" />
										<xsl:with-param name="risk_grade" select="risk_grade" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<td width="70%" colspan="12">N/A</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>						
			            <tr>
							<td width="30%" class="bold">Key Contributing Factors<br />(Why the Score is not Higher>)</td>
							<td width="70%" colspan="14" class="no-padding">
								<xsl:choose>
									<xsl:when test="count(key_factor/item) ">
										<xsl:for-each select="key_factor/item">
											<p>&#8226;&#160;<xsl:value-of select="."/></p>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										N/A
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td colspan="14" class="no-padding">
								<p class="h3_pcrp">Boosting Your Credit Score</p>
								<p>Your credit score change when new information is reported by your creditors. So your score will improve over time when you manage your credit responsibility. Here are some general ways to improve your credit score:</p>
							</td>
						</tr>
						<tr>
							<td colspan="5" class="no-padding">
								<p>&#10003; Pay your bills on time</p>
								<p>&#10003; Do not have any overdue accounts or information such as bankruptcy and legal action on your credit report</p>
								<p>&#10003; Keep balances low on credit cards</p>
							</td>
							<td colspan="9" class="no-padding">
								<p>&#10003; Apply for and open new credit accounts only when you need them</p>
								<p>&#10003; Check your credit report regularly for accuracy</p>
								<p>&#10003; If you have missed payments, get current and stay current</p>
								<p>&#10003; Pay off debt rather than moving it between credit cards</p>
							</td>
						</tr>
						<tr>
							<td colspan="14" class="no-padding">
								<p class="h3_pcrp">Improving Your Credit Score Can Help You:</p>
							</td>
						</tr>
						<tr>
							<td colspan="5" class="no-padding">
								<p>&#10003; Lower your interest rates</p>
								<p>&#10003; Speed up credit application approvals</p>
							</td>
							<td colspan="9" class="no-padding">
								<p>&#10003; Reduce deposits required by Telcos, utilities, etc.</p>
								<p>&#10003; Get better offers for credit card, housing loan, car loan, mortgage, etc.</p>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">
					<p class="h3">Credit Score &amp; Risk Grade</p>
					<table border="0" width="100%" class="full_border">
						<tr>
							<th width="100">i-SCORE</th><th width="100">Risk Grade</th>
						</tr>
						<tr>
							<td align="center">&lt;360</td>
							<td align="center">1</td>
						</tr>
						<tr>
							<td align="center">361 - 420</td>
							<td align="center">2</td>
						</tr>
						<tr>
							<td align="center">421 - 460</td>
							<td align="center">3</td>
						</tr>
						<tr>
							<td align="center">461 - 540</td>
							<td align="center">4</td>
						</tr>
						<tr>
							<td align="center">541 - 580</td>
							<td align="center">5</td>
						</tr>
						<tr>
							<td align="center">581 - 620</td>
							<td align="center">6</td>
						</tr>
						<tr>
							<td align="center">621 - 660</td>
							<td align="center">7</td>
						</tr>
						<tr>
							<td align="center">661 - 700</td>
							<td align="center">8</td>
						</tr>
						<tr>
							<td align="center">701 - 740</td>
							<td align="center">9</td>
						</tr>
						<tr>
							<td align="center">&gt;740</td>
							<td align="center">10</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
                <br />
        </xsl:template>
        <!-- END i-SCORE PCRP SECTION -->
	
	<!-- BEGIN CCRIS_SUPP_INDIVIDUAL_ADDRESSES -->
	<xsl:template match="ccris_supp_individual_addresses" name="ccris_supp_individual_addresses">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="3" align="left">ADDRESS(S) IN BANKING &#38; RAMCI DATABANK<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="ccris_supp_individual_address">
					<tr>
						<td width="20%" class="bold">Date Captured</td>
						<td width="20%" class="bold">Source</td>
						<td width="60%" class="bold">Address</td>
					</tr>
					<xsl:for-each select="ccris_supp_individual_address">
						<tr>
							<td><xsl:value-of select="date_capture"/></td>
							<td><xsl:value-of select="source_from"/></td>
							<td><xsl:value-of select="address"/></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="3">NIL</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CCRIS_SUPP_INDIVIDUAL_ADDRESSES -->
	
	<!-- BEGIN CCRIS_SUPP_CONTACT_INFO -->
	<xsl:template match="ccris_supp_contact_info" name="ccris_supp_contact_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">CONTACT NUMBER IN BANKING</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(item)">
			<!--<xsl:if test='item'>-->
					<tr>
						<td width="20%" class="bold">Date Loaded</td>
						<td width="80%" class="bold">Phone No.</td>
					</tr>
					<xsl:for-each select="item">
					<tr>
						<td><xsl:value-of select="date_loaded" /></td>
						<td><xsl:value-of select="phone_no" /></td>
					</tr>
					</xsl:for-each>
			<!--	</xsl:if>-->
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NIL</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CCRIS_SUPP_CONTACT_INFO -->
	
	<!-- BEGIN CCRIS_SUPP_OCCUPATION_INFO -->
	<xsl:template match="ccris_supp_occupation_info" name="ccris_supp_occupation_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="3" align="left">OCCUPATION IN BANKING</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(item)">
			<!--<xsl:if test='item'>-->
					<tr>
						<td width="20%" class="bold">Date Loaded</td>
						<td width="25%" class="bold">Occupation</td>
						<td width="55%" class="bold">Employer</td>
					</tr>
					<xsl:for-each select="item">
					<tr>
						<td><xsl:value-of select="date_loaded" /></td>
						<td><xsl:value-of select="occupation" /></td>
						<td><xsl:value-of select="employer" /></td>
					</tr>
					</xsl:for-each>
			<!--	</xsl:if>-->
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="3">NIL</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CCRIS_SUPP_OCCUPATION_INFO -->	
        <!--ITJR 653/17 - Add Bankruptcy Flag-->
        <!-- BEGIN CCRIS_SUPP_BANKRUPTCY_INFO -->
	<xsl:template match="ccris_supp_bankruptcy_info" name="ccris_supp_bankruptcy_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="4" align="left" class="show_border">BANKRUPTCY HIT <br /><span class="small">Note: The following information on legal / winding up / bankruptcy proceedings may not be current. This Suit(s) may have been dismissed, withdrawn or struck off (eg: it may have been held that the subject is not liable as alleged in the claim, if at all or the case against a Defendant may have been struck off or the alleged debt may have been settled after the entry of the information in our database). The person or company listed as the litigant in the suit may have a similar name as the subject whom/which you seek information on. Whilst the Subject&#39;s IC number (if available) or Company Number (if available) or other identification may indicate that the person named in the action is the Subject, we cannot determine or confirm that the litigant is in fact the subject on whom/which information is sought. Please check with subject(s) concerned for confirmation.</span></th>
			</tr>
                        <tr>
                            <td width="40%" class="bold">Name</td>
                            <td width="25%" class="bold">IC / PP No</td>
                            <td width="40%" class="bold">New IC No</td>
                            <td width="25%" class="bold">Bankruptcy</td>
			</tr>
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="old_ic" /></td>
                            <td><xsl:value-of select="new_ic" /></td>
                            <td><xsl:value-of select="bankruptcy_hit" /></td>
			</tr>
		</table>
	</xsl:template>
	<!-- END CCRIS_SUPP_BANKRUPTCY_INFO -->	
    <!--ITJR 653/17 - Add Bankruptcy Flag-->
    <!-- BEGIN CCRIS_SUPP_WINDUP_INFO -->
	<xsl:template match="ccris_supp_windup_info" name="ccris_supp_windup_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="3" align="left" class="show_border">WINDING UP HIT <br /><span class="small">Note: The following information on legal / winding up / bankruptcy proceedings may not be current. This Suit(s) may have been dismissed, withdrawn or struck off (eg: it may have been held that the subject is not liable as alleged in the claim, if at all or the case against a Defendant may have been struck off or the alleged debt may have been settled after the entry of the information in our database). The person or company listed as the litigant in the suit may have a similar name as the subject whom/which you seek information on. Whilst the Subject&#39;s IC number (if available) or Company Number (if available) or other identification may indicate that the person named in the action is the Subject, we cannot determine or confirm that the litigant is in fact the subject on whom/which information is sought. Please check with subject(s) concerned for confirmation.</span></th>
			</tr>
                        <tr>
                            <td width="40%" class="bold">Name</td>
                            <td width="25%" class="bold">Registration No</td>
                            <td width="25%" class="bold">Winding Up</td>
			</tr>
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="registration_no" /></td>
                            <td><xsl:value-of select="windup_hit" /></td>
			</tr>
		</table>
	</xsl:template>
	<!-- END CCRIS_SUPP_WINDUP_INFO -->	
</xsl:stylesheet>