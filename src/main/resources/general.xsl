<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="bottom_term">
		<p class="no-margin liteblue bold">Experian Information Services (Malaysia) Sdn. Bhd. (532271-T) is certified to ISO/IEC 27001:2013, Cert. No: ISM 00290</p>
		<p class="small liteblue term">NOTICE: The information provided by Experian Information Services (Malaysia) Sdn. Bhd. (EXPERIAN) in this report is based on information which has been compiled from public sources and third parties. We do not guarantee the accuracy of the information provided by EXPERIAN. While we have used our best endeavours to ensure that the data is complete and accurate, we do not accept any liability for errors, omissions, incomplete information or non-current data and a purchaser or user of the information in this Report shall verify the accuracy of the information on its own. The information furnished is <u>STRICTLY CONFIDENTIAL</u> and should not be disclosed to any party including the subject concerned. The information in this report is not for evaluation or a comment on the credit-worthiness of the subject nor is it any advice, analysis, observation, representation or comment on the credit risk of the subject person or company/business or any other entity on whom/which the information is provided. EXPERIAN shall not be liable for any conclusions drawn by you/the user of any of the information found in this report. Please notify &amp; contact EXPERIAN promptly of any questions regarding the accuracy of the information contained in this report to the Customer Service Division at: No 17-9 &amp; 19-9, 9th Floor, The Boulevard, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur, Malaysia or call: +60326151111.</p>
	</xsl:template>
	
	<xsl:template match="report_date">
	</xsl:template>
	
	<xsl:template match="token">
	</xsl:template>
  
	<!-- BEGIN INPUT REQUEST -->
	<xsl:template match="input_request" name="input_request">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">PARTICULARS OF THE SUBJECT PROVIDED BY YOU</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name Of Subject</td>
				<td width="80%"><xsl:value-of select="search_name"/></td>
			</tr>
			<xsl:if test="search_id">
				<tr>
					<td width="20%" class="bold">Local No</td>
					
						<!-- <td width="80%"><xsl:value-of select="search_id"/></td> -->
						<xsl:choose>
							<xsl:when test="string-length(search_id2) = 12 ">
								<td width="80%"><xsl:value-of select= "concat ( search_id2, ' (' , search_id, ') ')"/> </td>
							</xsl:when>
							<xsl:when test="string-length(search_id) = 12 ">
								<td width="80%"><xsl:value-of select= "concat ( search_id, ' (' , search_id2, ') ')"/> </td>
							</xsl:when>
							<xsl:otherwise>
								<td width="80%"><xsl:value-of select="search_id"/></td>
							</xsl:otherwise>
						</xsl:choose>
						
				</tr>
			</xsl:if>
			
			<!-- <xsl:if test="reg_no">
				<tr>
					<td width="20%" class="bold">Registration No</td>
					<td width="80%"><xsl:value-of select="reg_no"/></td>
				</tr>
			</xsl:if>	 -->

			<xsl:if test="reg_no">
				<tr>
					<td width="20%" class="bold">Registration No</td>
					
						
						<xsl:choose>
							<xsl:when test="string-length(reg_no2) = 12 ">
								<td width="80%"><xsl:value-of select= "concat ( reg_no2, ' (' , reg_no, ') ')"/> </td>
							</xsl:when>
							<xsl:when test="string-length(reg_no) = 12 ">
								<td width="80%"><xsl:value-of select= "concat ( reg_no, ' (' , reg_no2, ') ')"/> </td>
							</xsl:when>
							<xsl:otherwise>
								<td width="80%"><xsl:value-of select="reg_no"/></td>
							</xsl:otherwise>
						</xsl:choose>
						
				</tr>
			</xsl:if>		
			<xsl:if test="old_ic">
				<tr>
					<td width="20%" class="bold">IC / PP No</td>
					<td width="80%"><xsl:value-of select="old_ic"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="new_ic">
				<tr>
					<td width="20%" class="bold">New IC No</td>
					<td width="80%"><xsl:value-of select="new_ic"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="subscriber_refno">
				<tr>
					<td width="20%" class="bold">Your Ref. No</td>
					<td width="80%"><xsl:value-of select="subscriber_refno"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="date_of_birth">
				<tr>
					<td width="20%" class="bold">Date of Birth</td>
					<td width="80%"><xsl:value-of select="date_of_birth"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="nationality">
				<tr>
					<td width="20%" class="bold">Nationality</td>
					<td width="80%"><xsl:value-of select="nationality"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="relationship">
				<tr>
					<td width="20%" class="bold">Relationship</td>
					<td width="80%"><xsl:value-of select="relationship"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- END INPUT REQUEST -->
  
	<!-- BEGIN DATABANK INFO -->
	<!-- CRK COOPERATIVE DETAILS -->
	<xsl:template match="cooperative_info">
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
				<td width="80%"><xsl:value-of select="reg_no"/></td>
			</tr>
		</table>
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">ADDRESS(S) IN OUR DATABANK<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
			</tr>
			<tr>
				<td width="20%" class="bold">Registered Address</td>
				<td width="80%"><xsl:value-of select="address"/></td>
			</tr>
		</table>
	</xsl:template>
	
	<!-- CRI INFO -->
	<xsl:template name="cri_person_details" match="person_details">
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
		<xsl:if test="addresses">
			<br />
			<table border="0" width="100%" class="full_border">
				<tr>
					<th colspan="2" align="left">ADDRESS(S) IN OUR DATABANK<br /><span class="small">NOTE: The address (s) stated below may not be the current or last known address of the subject</span></th>
				</tr>
				<xsl:choose>
					<xsl:when test="count(addresses/address)">
						<tr>
							<td width="80%" class="bold">Address</td>
							<td width="20%" class="bold">Date Captured</td>
						</tr>
						<xsl:for-each select="addresses/address">
							<tr>
								<td width="80%"><xsl:value-of select="address"/></td>
								<xsl:choose>
									<xsl:when test="datechanged">
										<td width="20%"><xsl:value-of select="datechanged"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td width="20%">-</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td colspan="2">NO INFORMATION AVAILABLE</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</table>
		</xsl:if>
	</xsl:template>
	
	<!-- PERSONAL INFORMATION PCR BEGIN -->
	<xsl:template name="person_details_pcr" match="person_details_pcr">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">A. PERSONAL INFORMATION</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(*)">
					<tr>
						<td width="20%" class="bold">Name Of Subject</td>
						<td width="80%"><xsl:value-of select="name"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">I/C No. (New)</td>
						<td width="80%"><xsl:value-of select="new_ic"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">I/C No. (Old)/Passport No./Other ID</td>
						<td width="80%"><xsl:value-of select="old_ic"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">Address</td>
						<td width="80%">
							<xsl:choose>
								<xsl:when test="addresses/address[1]">
									<xsl:value-of select="addresses/address/address"/>
								</xsl:when>
								<xsl:otherwise>
									NO INFORMATION AVAILABLE
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>		
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NOTE: There is no information available in our databank based on the particulars of the subject provided by you.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<br />
	</xsl:template>
	<!-- PERSONAL INFORMATION PCR END -->
  
	<!-- FOR CRB - INFORMATION IN OUR DATABANK -->
	<xsl:template match="business_title">
		<xsl:if test="count(*) > 0">
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
					<td width="80%"><xsl:value-of select="reg_no"/></td> -->
					
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
				<xsl:if test="note">
					<tr>
						<td colspan="2" class="bold red"><xsl:value-of select="note"/></td>
					</tr>
				</xsl:if>
			</table>
		</xsl:if>
	</xsl:template>
  
	<!-- FS company info -->
	<xsl:template name="fs_company_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION IN OUR DATABANK</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name Of Subject</td>
				<td width="80%"><xsl:value-of select="company_name"/></td>
			  </tr>
			  <tr>
				<td width="20%" class="bold">Local No</td>
				<td width="80%"><xsl:value-of select="local_no"/></td>
			  </tr>
		</table>
	</xsl:template>
	
	<!-- CI company info -->
	<xsl:template match="company_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION IN OUR DATABANK</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name Of Subject</td>
				<td width="80%"><xsl:value-of select="company_name"/></td>
			  </tr>
			  
			<xsl:choose>
				<xsl:when test="new_reg_no">
					<tr>
						<td width="20%" class="bold">Local No</td>
						<td width="80%"><xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/> </td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td width="20%" class="bold">Local No</td>
						<td width="80%"><xsl:value-of select="local_no"/></td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
			  
			  
			  <xsl:if test="note">
				<tr>
					<td colspan="2" class="bold red"><xsl:value-of select="note"/></td>
				</tr>
			  </xsl:if>
		</table>
		<xsl:if test="addresses">
			<br />
			<table border="0" width="100%" class="full_border">
				<tr>
					<th align="left">ADDRESS(S) IN OUR DATABANK<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
					<th align="left">Date Captured</th>
				</tr>
				<xsl:for-each select="addresses/*">
					<tr>
						<td width="85%"><xsl:value-of select="address" /></td>
						<td><xsl:value-of select="date_capture" /></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
		
	<!-- COMPANY INFORMATION CCR1 BEGIN -->
	<xsl:template name="ccr1_company_info" match="ccr1_company_info">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">COMPANY INFORMATION</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(*)">
					<tr>
						<td width="20%" class="bold">Name Of Subject</td>
						<td width="80%"><xsl:value-of select="company_name"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">Company Registration No</td>
						<td width="80%"><xsl:value-of select="local_no"/></td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NOTE: There is no information available in our databank based on the particulars of the subject provided by you.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- COMPANY INFORMATION CCR1 END -->
  
	<!-- BEGIN COMPANY DETAIL -->
	<xsl:template match="company_details">
		<xsl:variable name="total_authorised_capital_formatted">
			<xsl:choose>
				<xsl:when test="total_authorised_capital = 0">
					<xsl:value-of select="'0.00'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="format-number(total_authorised_capital, '###,###,###.00')" />  
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="total_paid_up_capital_formatted">
			<xsl:choose>
				<xsl:when test="total_paid_up_capital = 0">
					<xsl:value-of select="'0.00'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="format-number(total_paid_up_capital, '###,###,###.00')" />  
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">COMPANY DETAILS<br /><span class="small">NOTE: The following company details are extracted from SSM. There may be changes to the corporate details of the Subject company which may not be available to the public.</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="new_reg_no">
					<tr>
						<td width="20%" class="bold">Local No</td>
						<td width="80%"><xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/> </td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td width="20%" class="bold">Local No</td>
						<td width="80%"><xsl:value-of select="local_no"/></td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
			<tr>
				<td width="20%" class="bold">Company Name</td>
				<td width="80%"><xsl:value-of select="company_name"/></td>
			</tr>
			<xsl:if test="former_name">
				<xsl:for-each select="former_name/item">
					<tr>
						<xsl:choose>
							<xsl:when test="(position()) = 1">
								<td width="20%" class="bold">Former Name</td>
							</xsl:when>
							<xsl:otherwise>
								<td width="20%" class="bold"></td>
							</xsl:otherwise>
						</xsl:choose>
						<td width="80%"><xsl:value-of select="."/></td>
					</tr>
				</xsl:for-each>      
			</xsl:if>
			<tr>
				<td width="20%" class="bold">Incorporation Date</td>
				<td width="80%"><xsl:value-of select="incorporation_date"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Type</td>
				<td width="80%"><xsl:value-of select="company_type"/></td>
			</tr>
			<xsl:if test="share_market">
				<tr>
					<td width="20%" class="bold">Market</td>
					<td width="80%"><xsl:value-of select="share_market"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="listing_date">
				<tr>
					<td width="20%" class="bold">Listing Date</td>
					<td width="80%"><xsl:value-of select="listing_date"/></td>
				</tr>
			</xsl:if>
			
			<tr>
				<td width="20%" class="bold">Status</td>
				<td width="80%"><xsl:value-of select="company_status"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Private Exempt Company</td>
				<td width="80%">
					<xsl:choose>
						<xsl:when test="private_exempt_co">
							Yes (<xsl:value-of select="private_exempt_co"/>)
						</xsl:when>
						<xsl:otherwise>
							N/A
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td width="20%" class="bold">Business Address</td>
				<td width="80%"><xsl:value-of select="addresses/business_address"/></td>
			</tr>
			<xsl:if test="addresses/registered_address">
				<tr>
					<td width="20%" class="bold">Registered Address</td>
					<td width="80%"><xsl:value-of select="addresses/registered_address"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="total_authorised_capital">
				<tr>
					<td width="20%" class="bold">Total Authorised Capital</td>
					<td width="80%">RM <xsl:value-of select="$total_authorised_capital_formatted" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="total_paid_up_capital">
				<tr>
					<td width="20%" class="bold">Total Issued and Paid Up Capital</td>
					<td width="80%">RM <xsl:value-of select="$total_paid_up_capital_formatted" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="nature_businesses">
				<xsl:for-each select="nature_businesses/nature_business">
					<tr>
						<xsl:choose>
							<xsl:when test="(position()) = 1">
								<td width="20%" class="bold">Nature of Business</td>
							</xsl:when>
							<xsl:otherwise>
								<td width="20%" class="bold"></td>
							</xsl:otherwise>
						</xsl:choose>
						<td width="80%"><xsl:value-of select="."/></td>
					</tr>
				</xsl:for-each>      
			</xsl:if>
			<xsl:if test="auditor/auditor_name">
				<tr>
					<td width="20%" class="bold">Auditor</td>
					<td width="80%"><xsl:value-of select="auditor/auditor_name"/> <xsl:value-of select="auditor/auditor_financial_year"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="auditor/auditor_address">
				<tr>
					<td width="20%" class="bold">Auditor&#39;s Address</td>
					<td width="80%"><xsl:value-of select="auditor/auditor_address"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="remark | amended_pn17 | pn17 | gn13">
				<tr>
					<td width="20%" class="font12 bold">Remark</td>
					<td width="80%" class="font12 bold">
						<xsl:if test="remark and string-length(remark) &gt; 1">
						<xsl:for-each select="remark/item">
								<xsl:value-of select="."/><br /><br />
							</xsl:for-each>	
						</xsl:if>
						<xsl:if test="amended_pn17 and string-length(amended_pn17) &gt; 1">
							<xsl:value-of select="amended_pn17"/><br />
						</xsl:if>
						<xsl:if test="pn17 and string-length(pn17) &gt; 1">
							<xsl:value-of select="pn17"/><br />
						</xsl:if>
						<xsl:if test="gn13 and string-length(gn13) &gt; 1">
							<xsl:value-of select="gn13"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="last_financial_filed">
				<tr>
					<td width="20%" class="bold">Last Financial Filed</td>
					<td width="80%"><xsl:value-of select="last_financial_filed"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td width="20%" class="bold">Last Updated by Experian</td>
				<td width="80%"><xsl:value-of select="last_ramci_update"/></td>
			</tr>
		</table>
		
		<xsl:if test="summary_share_capital">
			<xsl:variable name="summary_total_authorised_capital_formatted">
				<xsl:choose>
					<xsl:when test="summary_share_capital/authorised/total = 0">
						<xsl:value-of select="'0.00'" />
					</xsl:when>
					<xsl:when test="string-length(summary_share_capital/authorised/total) > 0">
						<xsl:value-of select="format-number(summary_share_capital/authorised/total, '###,###,###.00')" />  
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'0.00'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="summary_total_paid_up_capital_formatted">
				<xsl:choose>
					<xsl:when test="summary_share_capital/issued_paid_up/total = 0">
						<xsl:value-of select="'0.00'" />
					</xsl:when>
					<xsl:when test="string-length(summary_share_capital/issued_paid_up/total) > 0">
						<xsl:value-of select="format-number(summary_share_capital/issued_paid_up/total, '###,###,###.00')" />  
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'0.00'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<br />
			<table border="0" width="100%" class="full_border">
				<tr>
					<th colspan="4" align="left">SUMMARY OF SHARE CAPITAL</th>
				</tr>
				<xsl:choose>
					<xsl:when test="count(summary_share_capital/authorised/*) > 1">                  
						<tr>
							<td class="bold" width="30%">Total Authorized(RM)  <xsl:value-of select="$summary_total_authorised_capital_formatted"/></td>
							<td class="bold" width="20%" align="right">AMOUNT</td>
							<td class="bold" width="20%" align="right">DIVIDED INTO</td>
							<td class="bold" width="30%" align="right">NOMINAL VALUE<br />(Sen)</td>
						</tr>
						<xsl:for-each select="summary_share_capital/authorised/*">
							<xsl:if test="name() != 'total'">
								<xsl:variable name="share_type">
									<xsl:choose>
										<xsl:when test="name() = 'ordinary'">
											<xsl:value-of select="'ORDINARY'" />                
										</xsl:when>
										<xsl:when test="name() = 'ordinary-A'">
											<xsl:value-of select="'ORDINARY SHARE A'" />                
										</xsl:when>
										<xsl:when test="name() = 'ordinary-B'">
											<xsl:value-of select="'ORDINARY SHARE B'" />                
										</xsl:when>
										<xsl:when test="name() = 'preference'">
											<xsl:value-of select="'PREFERENCE'" />                
										</xsl:when>
										<xsl:when test="name() = 'preference-A'">
											<xsl:value-of select="'PREFERENCE SHARE A'" />                
										</xsl:when>
										<xsl:when test="name() = 'preference-B'">
											<xsl:value-of select="'PREFERENCE SHARE B'" />                
										</xsl:when>
										<xsl:when test="name() = 'others'">
											<xsl:value-of select="'OTHERS'" />                
										</xsl:when>
									</xsl:choose>
								</xsl:variable>
								<tr>
									<td class="bold"><xsl:value-of select="$share_type" /></td>
									<td align="right"><xsl:value-of select="amount" /></td>
									<td align="right"><xsl:value-of select="divided_into" /></td>
									<td align="right"><xsl:value-of select="normal_value_sen" /></td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td colspan="4" class="bold">Total Authorized (RM)  <xsl:value-of select="$summary_total_authorised_capital_formatted"/></td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="count(summary_share_capital/issued_paid_up/*) > 1">                  
						<tr>
							<td class="bold" width="30%">Total Issued(RM)  <xsl:value-of select="$summary_total_paid_up_capital_formatted"/></td>
							<td class="bold" width="20%" align="right">CASH</td>
							<td class="bold" width="20%" align="right">OTHERWISE THAN CASH</td>
							<td class="bold" width="30%" align="right">NOMINAL VALUE (Sen)</td>
						</tr>
						<xsl:for-each select="summary_share_capital/issued_paid_up/*">
							<xsl:if test="name() != 'total'">
								<xsl:variable name="share_type">
									<xsl:choose>
										<xsl:when test="name() = 'ordinary'">
											<xsl:value-of select="'ORDINARY'" />                
										</xsl:when>
										<xsl:when test="name() = 'ordinary-A'">
											<xsl:value-of select="'ORDINARY SHARE A'" />                
										</xsl:when>
										<xsl:when test="name() = 'ordinary-B'">
											<xsl:value-of select="'ORDINARY SHARE B'" />                
										</xsl:when>
										<xsl:when test="name() = 'preference'">
											<xsl:value-of select="'PREFERENCE'" />                
										</xsl:when>
										<xsl:when test="name() = 'preference-A'">
											<xsl:value-of select="'PREFERENCE SHARE A'" />                
										</xsl:when>
										<xsl:when test="name() = 'preference-B'">
											<xsl:value-of select="'PREFERENCE SHARE B'" />                
										</xsl:when>
										<xsl:when test="name() = 'others'">
											<xsl:value-of select="'OTHERS'" />                
										</xsl:when>
									</xsl:choose>
								</xsl:variable>
								<tr>
									<td class="bold"><xsl:value-of select="$share_type" /></td>
									<td align="right"><xsl:value-of select="cash" /></td>
									<td align="right"><xsl:value-of select="non-cash" /></td>
									<td align="right"><xsl:value-of select="normal_value_sen" /></td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td colspan="4" class="bold">Total Issued (RM)  <xsl:value-of select="$summary_total_paid_up_capital_formatted"/></td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- END COMPANY DETAIL -->
  
	<!-- INVOICE LEGEND -->
	<xsl:template name="invoice_note">
		<table class="woborder highlight" border="0">
		  <tr>
			<td class="bold red normal-text">
			  <u>NOTE:</u>
			</td>
		  </tr>
		  <tr>
			<td class="normal-text">Please click <img id="imgplus" src="/images/plus.png" width="10px" height="9px" /> to view detailed transaction.</td>
		  </tr>
		</table>
	</xsl:template>
	<!-- END OF INVOICE LEGEND -->
	
	<!-- BEGIN FINANCIAL STATEMENT LEGEND-->
	<xsl:template name="finance_legend">
		<table class="woborder highlight" border="0">
		  <tr>
			<td class="bold red normal-text">
			  <u>LEGEND:</u>
			</td>
		  </tr>
		  <tr>
			<td class="normal-text"><strong>NA: </strong>Information not available from SSM</td>
		  </tr>
		</table>
	</xsl:template>
	<!-- END FINANCIAL STATEMENT LEGEND-->
	
	<!-- BEGIN FINANCIAL YEAR CONTROL FOR 5 YEARS FI OR 3 YEARS FI -->
	<xsl:template match="financial_statement">
		<xsl:if test="count(item) > 0">
			<xsl:choose>
				<xsl:when test="count(item) = 5">
					<br />
					<xsl:call-template name="financial_statement_5" />
				</xsl:when>
				<xsl:otherwise>
					<br />
					<xsl:call-template name="financial_statement_3" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>		
	<!-- END FINANCIAL YEAR CONTROL FOR 5 YEARS FI OR 3 YEARS FI -->
	
	<!-- BEGIN FINANCIAL STATEMENT 3 YEARS -->
	<xsl:template name="financial_statement_3">
			<table border="0" width="100%" class="full_border">
				<tr>
					<th align="left">COMPANY FINANCIAL STATEMENT<br /><span class="small">The following information has been extracted from SSM Computer printout search. We do not warrant as to its accuracy, correctness or completeness. In some cases, the financials may not reconcile. If there is any inconsistencies, inaccuracies or missing details or information, please contact Experian customer service for assistance.</span></th>
				</tr>
				<tr>
					<td class="bold">FINANCIAL SUMMARY</td>
				</tr>
				<tr>
					<td>
						<table border="0" width="100%" class="woborder">
							<tr>
								<td width="31%" class="bold normal-text">Consolidated Accounts</td>
								<xsl:for-each select="item/financial_summary/consolidated_accounts"> 
									<td width="23%" align="center" colspan="2" class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">Auditor's Name</td>
								<xsl:for-each select="item/auditor/auditor_name"> 
									<td width="13.8%" align="center" colspan="2" class="normal-text">
										<xsl:call-template name="text_wrapper">
										   <xsl:with-param name="text" select="."/>
										   <xsl:with-param name="size" select="10"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">Financial Year End</td>
								<xsl:for-each select="item/financial_summary/financial_year_end">
									<td width="13.8%" align="center" colspan="2" class="normal-text"><xsl:value-of select="." /></td>
								<!--	<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="8%" align="center" class="nowrap normal-text">% Change</td>
										</xsl:otherwise>
									</xsl:choose> -->
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">UnQualified Reports (Y/N)</td>
								<xsl:for-each select="item/financial_summary/unqualified_reports">
									<td width="23%" align="center" colspan="2" class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">Date of Tabling</td>
								<xsl:for-each select="item/auditor/tabling_date">
									<td width="13.8%" align="center" colspan="2" class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="30%" class="bold normal-text">Units</td>
								<xsl:for-each select="item/financial_summary/units">
									<td width="23%" align="center" colspan="2" class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							<tr>
								<td colspan="{(((count(item/financial_summary/units)) * 2) + 1)}">&#160;</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="bold">BALANCE SHEET</td>
				</tr>
				<tr>
					<td>
						<table border="0" width="100%" class="woborder">
							<tr>
								<td width="31%" class="bold normal-text">Financial Year End</td>
								<xsl:for-each select="item/financial_summary/financial_year_end">
									<td width="15%" align="right" class="bold normal-text"><xsl:value-of select="." /></td>
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="8%" align="center" class="bold nowrap normal-text">% Change</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Non Current Assets</td>
								<xsl:for-each select="item/balance_sheet/non_current_assets">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../non_current_assets_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../non_current_assets_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Current Assets</td>
								<xsl:for-each select="item/balance_sheet/current_assets">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../current_assets_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../current_assets_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>          
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Total Assets</td>
								<xsl:for-each select="item/balance_sheet/total_assets">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../total_assets_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../total_assets_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td colspan="{((count(item/balance_sheet/total_assets)) * 2 + 1 )}">&#160;</td>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Paid-up Capital</td>
								<xsl:for-each select="item/balance_sheet/paidup_capital">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../paidup_capital_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../paidup_capital_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Share Application Account</td>
								<xsl:for-each select="item/balance_sheet/share_application_account">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../share_application_account_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../share_application_account_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Share Premium &amp; Other Reserves</td>
								<xsl:for-each select="item/balance_sheet/share_premium_and_other_reserves">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../share_premium_and_other_reserves_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../share_premium_and_other_reserves_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Accumulated Profit Carried Forward</td>
								<xsl:for-each select="item/balance_sheet/accumulated_profit_forward">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../accumulated_profit_forward_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../accumulated_profit_forward_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Minority Interest</td>
								<xsl:for-each select="item/balance_sheet/minority_interest">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../minority_interest_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../minority_interest_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Total Equity</td>
								<xsl:for-each select="item/balance_sheet/total_equity">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../total_equity_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../total_equity_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td colspan="{((count(item/balance_sheet/total_equity)) * 2 + 1 )}">&#160;</td>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Non Current Liabilities</td>
								<xsl:for-each select="item/balance_sheet/non_current_liabilities">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../non_current_liabilities_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../non_current_liabilities_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Current Liabilities</td>
								<xsl:for-each select="item/balance_sheet/current_liabilities">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../current_liabilities_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../current_liabilities_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Total Liabilities</td>
								<xsl:for-each select="item/balance_sheet/total_liabilities">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../total_liabilities_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../total_liabilities_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td colspan="{((count(item/balance_sheet/total_liabilities)) * 2 + 1)}">&#160;</td>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Total Equity &amp; Liabilities</td>
								<xsl:for-each select="item/balance_sheet/total_equity_and_liabilities">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../total_equity_and_liabilities_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../total_equity_and_liabilities_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<xsl:if test="count(item/notes) > 0">
								<tr>
									<td colspan="{((count(item/balance_sheet/total_equity_and_liabilities)) * 2 + 1)}">&#160;</td>
								</tr>
								<tr>
									<td colspan="{((count(item/balance_sheet/total_equity_and_liabilities)) * 2 + 1)}" class="normal-text"><xsl:value-of select="item/notes" /></td>
								</tr>
							</xsl:if> 
						</table>
						<xsl:call-template name="finance_legend" />
					</td>
				</tr>
				<tr>
					<td class="bold">PROFIT AND LOSS ACCOUNT</td>
				</tr>
				<tr>
					<td>
						<table border="0" width="100%" class="woborder">
							<tr>
								<td width="31%" class="bold normal-text">Financial Year End</td>
								<xsl:for-each select="item/financial_summary/financial_year_end">
									<td width="15%" align="right" class="bold normal-text"><xsl:value-of select="." /></td>
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="8%" align="center">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="8%" align="center" class="bold nowrap normal-text">% Change</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Revenue</td>
								<xsl:for-each select="item/profit_loss/revenue">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../revenue_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../revenue_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Profit/(Loss) Before Tax</td>
								<xsl:for-each select="item/profit_loss/pl_before_tax">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../pl_before_tax_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../pl_before_tax_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Profit/(Loss) After Tax</td>
								<xsl:for-each select="item/profit_loss/pl_after_tax">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../pl_after_tax_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../pl_after_tax_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Minority Interest</td>
								<xsl:for-each select="item/profit_loss/minority_interest">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../minority_interest_percent[position()] = 'NA'">
													<td width="8%" align="center">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../minority_interest_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Net Dividend</td>
								<xsl:for-each select="item/profit_loss/net_dividend">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<xsl:choose>
												<xsl:when test="../net_dividend_percent[position()] = 'NA'">
													<td width="8%" align="center" class="normal-text">&#160;</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="8%" align="center" class="normal-text"><xsl:value-of select="../net_dividend_percent[position()]" />%</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
						</table>
						<xsl:call-template name="finance_legend" />
					</td>
				</tr>
				<tr>
					<td class="bold">KEY FINANCIAL RATIOS</td>
				</tr>
				<tr>
					<td>
						<table border="0" width="100%" class="woborder">
							<tr>
								<td width="31%" class="bold normal-text">Financial Year End</td>
								<xsl:for-each select="item/financial_summary/financial_year_end">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="23%" align="center" class="bold normal-text" colspan="2"><xsl:value-of select="." /></td>
										</xsl:when>
										<xsl:otherwise>
											<td width="23%" align="center" class="bold normal-text" colspan="2"><xsl:value-of select="." /></td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Current Ratio [Times]</td>
								<xsl:for-each select="item/key_financial_ratios/current_ratio_times">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Profit Before Tax Margin[%]</td>
								<xsl:for-each select="item/key_financial_ratios/profit_before_tax_margin">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Profit After Tax Margin[%]</td>
								<xsl:for-each select="item/key_financial_ratios/profit_after_tax_margin">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Earnings Per Share [RM]</td>
								<xsl:for-each select="item/key_financial_ratios/earnings_per_share_RM">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Dividend Per Share [RM]</td>
								<xsl:for-each select="item/key_financial_ratios/dividend_per_share_RM">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Return On Equity[%]</td>
								<xsl:for-each select="item/key_financial_ratios/return_on_equity">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Return on Assets[%]</td>
								<xsl:for-each select="item/key_financial_ratios/return_on_assets">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Gearing Ratio (Times)</td>
								<xsl:for-each select="item/key_financial_ratios/gearing_ratio">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%">&#160;</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											<td width="8%" align="center">&#160;</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
						</table>
						<xsl:call-template name="finance_legend" />
					</td>
				</tr>
			</table>
	</xsl:template>
	<!-- END FINANCIAL STATEMENT 3 YEARS -->
	
	<!-- BEGIN FINANCIAL STATEMENT 5 YEARS -->
		<xsl:template name="financial_statement_5">
			<table border="1" width="100%" class="full_border">
				<tr>
					<th align="left">COMPANY FINANCIAL STATEMENT<br /><span class="small">The following information has been extracted from SSM Computer printout search. We do not warrant as to its accuracy, correctness or completeness. In some cases, the financials may not reconcile. If there is any inconsistencies, inaccuracies or missing details or information, please contact Experian customer service for assistance.</span></th>
				</tr>
				<tr>
					<td class="bold">FINANCIAL SUMMARY</td>
				</tr>
				<tr>
					<td>
						<table border="0" width="100%" class="woborder">
							<tr>
								<td width="31%" class="bold normal-text">Consolidated Accounts</td>
								<xsl:for-each select="item/financial_summary/consolidated_accounts"> 
									<td width="13.8%" align="center" class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">Auditor's Name</td>
								<xsl:for-each select="item/auditor/auditor_name"> 
									<td width="13.8%" align="center"  class="normal-text">
										<xsl:call-template name="text_wrapper">
										   <xsl:with-param name="text" select="."/>
										   <xsl:with-param name="size" select="10"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">Financial Year End</td>
								<xsl:for-each select="item/financial_summary/financial_year_end">
									<td width="13.8%" align="center"  class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">UnQualified Reports (Y/N)</td>
								<xsl:for-each select="item/financial_summary/unqualified_reports">
									<td width="13.8%" align="center"  class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">Date of Tabling</td>
								<xsl:for-each select="item/auditor/tabling_date">
									<td width="13.8%" align="center"  class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							
							<tr>
								<td width="31%" class="bold normal-text">Units</td>
								<xsl:for-each select="item/financial_summary/units">
									<td width="13.8%" align="center" class="normal-text"><xsl:value-of select="." /></td>
								</xsl:for-each>
							</tr>
							<tr>
								<!-- <td colspan="{(((count(item/financial_summary/units)) * 2) + 1)}">&#160;</td> -->
								<td colspan="6">&#160;</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="bold">BALANCE SHEET</td>
				</tr>
				<tr>
					<td>
						<table border="0" width="100%" class="woborder">
							<tr>
								<td width="31%" class="bold normal-text">Financial Year End</td>
								<xsl:for-each select="item/financial_summary/financial_year_end">
									<td width="13.8%" align="right" class="bold normal-text"><xsl:value-of select="." /></td>
									
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Non Current Assets</td>
								<xsl:for-each select="item/balance_sheet/non_current_assets">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Current Assets</td>
								<xsl:for-each select="item/balance_sheet/current_assets">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											         
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Total Assets</td>
								<xsl:for-each select="item/balance_sheet/total_assets">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<!-- <td colspan="{((count(item/balance_sheet/total_assets)) * 2 + 1 )}">&#160;</td> -->
								<td colspan="6">&#160;</td>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Paid-up Capital</td>
								<xsl:for-each select="item/balance_sheet/paidup_capital">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Share Application Account</td>
								<xsl:for-each select="item/balance_sheet/share_application_account">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Share Premium &amp; Other Reserves</td>
								<xsl:for-each select="item/balance_sheet/share_premium_and_other_reserves">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Accumulated Profit Carried Forward</td>
								<xsl:for-each select="item/balance_sheet/accumulated_profit_forward">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Minority Interest</td>
								<xsl:for-each select="item/balance_sheet/minority_interest">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Total Equity</td>
								<xsl:for-each select="item/balance_sheet/total_equity">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<!-- <td colspan="{((count(item/balance_sheet/total_equity)) * 2 + 1 )}">&#160;</td> -->
								<td colspan="6">&#160;</td>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Non Current Liabilities</td>
								<xsl:for-each select="item/balance_sheet/non_current_liabilities">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Current Liabilities</td>
								<xsl:for-each select="item/balance_sheet/current_liabilities">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Total Liabilities</td>
								<xsl:for-each select="item/balance_sheet/total_liabilities">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<!-- <td colspan="{((count(item/balance_sheet/total_liabilities)) * 2 + 1)}">&#160;</td> -->
								<td colspan="6">&#160;</td>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Total Equity &amp; Liabilities</td>
								<xsl:for-each select="item/balance_sheet/total_equity_and_liabilities">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="total normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<!--<xsl:if test="count(item/notes) > 0">-->
							<xsl:if test="item/notes != ''">
								<tr>
									<td colspan="{((count(item/balance_sheet/total_equity_and_liabilities)) * 2 + 1)}">&#160;</td>
								</tr>
								<tr>
									<td colspan="{((count(item/balance_sheet/total_equity_and_liabilities)) * 2 + 1)}" class="normal-text"><xsl:value-of select="item/notes" /></td>
								</tr>
							</xsl:if> 
						</table>
						<xsl:call-template name="finance_legend" />
					</td>
				</tr>
				<tr>
					<td class="bold">PROFIT AND LOSS ACCOUNT</td>
				</tr>
				<tr>
					<td>
						<table border="0" width="100%" class="woborder">
							<tr>
								<td width="31%" class="bold normal-text">Financial Year End</td>
								<xsl:for-each select="item/financial_summary/financial_year_end">
									<td width="13.8%" align="right" class="bold normal-text"><xsl:value-of select="." /></td>
									
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Revenue</td>
								<xsl:for-each select="item/profit_loss/revenue">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Profit/(Loss) Before Tax</td>
								<xsl:for-each select="item/profit_loss/pl_before_tax">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Profit/(Loss) After Tax</td>
								<xsl:for-each select="item/profit_loss/pl_after_tax">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Minority Interest</td>
								<xsl:for-each select="item/profit_loss/minority_interest">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Net Dividend</td>
								<xsl:for-each select="item/profit_loss/net_dividend">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
						</table>
						<xsl:call-template name="finance_legend" />
					</td>
				</tr>
				<tr>
					<td class="bold">KEY FINANCIAL RATIOS</td>
				</tr>
				<tr>
					<td>
						<table border="0" width="100%" class="woborder">
							<tr>
								<td width="31%" class="bold normal-text">Financial Year End</td>
								<xsl:for-each select="item/financial_summary/financial_year_end">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="center" class="bold normal-text"><xsl:value-of select="." /></td>
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="center" class="bold normal-text"><xsl:value-of select="." /></td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Current Ratio [Times]</td>
								<xsl:for-each select="item/key_financial_ratios/current_ratio_times">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
				
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
									
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Profit Before Tax Margin[%]</td>
								<xsl:for-each select="item/key_financial_ratios/profit_before_tax_margin">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Profit After Tax Margin[%]</td>
								<xsl:for-each select="item/key_financial_ratios/profit_after_tax_margin">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Earnings Per Share [RM]</td>
								<xsl:for-each select="item/key_financial_ratios/earnings_per_share_RM">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Dividend Per Share [RM]</td>
								<xsl:for-each select="item/key_financial_ratios/dividend_per_share_RM">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Return On Equity[%]</td>
								<xsl:for-each select="item/key_financial_ratios/return_on_equity">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Return on Assets[%]</td>
								<xsl:for-each select="item/key_financial_ratios/return_on_assets">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
							<tr>
								<td width="31%" class="bold normal-text">Gearing Ratio (Times)</td>
								<xsl:for-each select="item/key_financial_ratios/gearing_ratio">
									<xsl:choose>
										<xsl:when test="position() = last()">
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:when>
										<xsl:otherwise>
											<td width="13.8%" align="right" class="normal-text"><xsl:value-of select="." /></td>
											
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</tr>
						</table>
						<xsl:call-template name="finance_legend" />
					</td>
				</tr>
			</table>
	</xsl:template>
	<!-- END FINANCIAL STATEMENT 5 YEARS-->
	
	<!-- BEGIN PREVIOUS ENQUIRY -->
	<xsl:template match="previous_enquiry" name="previous_enquiry">
		<xsl:if test="finance">
			<br />
			<table border="0" width="100%" class="full_border">
				<tr>
					<th colspan="14" align="left">FINANCIAL RELATED SEARCH COUNT<br /><span class="small">(The number of times that the Subject has been searched by Financial Institutions via CrediTrack)</span></th>
				</tr>
				<tr>
					<td class="bold" align="center">Year</td>
					<td class="bold" align="center">Total</td>
					<td class="bold" align="center">Jan</td>
					<td class="bold" align="center">Feb</td>
					<td class="bold" align="center">Mar</td>
					<td class="bold" align="center">Apr</td>
					<td class="bold" align="center">May</td>
					<td class="bold" align="center">Jun</td>
					<td class="bold" align="center">Jul</td>
					<td class="bold" align="center">Aug</td>
					<td class="bold" align="center">Sep</td>
					<td class="bold" align="center">Oct</td>
					<td class="bold" align="center">Nov</td>
					<td class="bold" align="center">Dec</td>
				</tr>
				<xsl:for-each select="finance/item">
					<tr>
						<td class="bold" align="center"><xsl:value-of select="year" /></td>
						<td align="center"><xsl:value-of select="yearly_count" /></td>
						<xsl:for-each select="month/item">
							<td align="center"><xsl:value-of select="." /></td>
						</xsl:for-each>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		
		<xsl:if test="commercial">
			<br />
			<table border="0" width="100%" class="full_border">
				<tr>
					<th colspan="14" align="left">COMMERCIAL RELATED SEARCH COUNT<br /><span class="small">(The number of times that the Subject has been searched by Business Corporations via CrediTrack)</span></th>
				</tr>
				<tr>
					<td class="bold" align="center">Year</td>
					<td class="bold" align="center">Total</td>
					<td class="bold" align="center">Jan</td>
					<td class="bold" align="center">Feb</td>
					<td class="bold" align="center">Mar</td>
					<td class="bold" align="center">Apr</td>
					<td class="bold" align="center">May</td>
					<td class="bold" align="center">Jun</td>
					<td class="bold" align="center">Jul</td>
					<td class="bold" align="center">Aug</td>
					<td class="bold" align="center">Sep</td>
					<td class="bold" align="center">Oct</td>
					<td class="bold" align="center">Nov</td>
					<td class="bold" align="center">Dec</td>
				</tr>
				<xsl:for-each select="commercial/item">
					<tr>
						<td class="bold" align="center"><xsl:value-of select="year" /></td>
						<td align="center"><xsl:value-of select="yearly_count" /></td>
						<xsl:for-each select="month/item">
							<td align="center"><xsl:value-of select="." /></td>
						</xsl:for-each>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>	
	<!-- END PREVIOUS ENQUIRY -->
  
	<!-- BEGIN COOPERATIVE DETAIL -->
	<xsl:template match="cooperative_details">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">CO-OPERATIVE DETAILS<br /><span class="small">NOTE: The above details are extracted from the registrar. There may be changes to the details of the Subject entity which may not be available to the public.</span></th>
			</tr>
			<xsl:for-each select="cooperative_detail">
				<tr>
					<td width="20%" class="bold">Registration No</td>
					<td width="80%"><xsl:value-of select="reg_no"/></td>
				</tr>
				<tr>
					<td width="20%" class="bold">Company Name</td>
					<td width="80%"><xsl:value-of select="name"/></td>
				</tr>
				<xsl:if test="former_name">
					<xsl:for-each select="former_name/item">
						<tr>
							<xsl:choose>
								<xsl:when test="(position()) = 1">
									<td width="20%" class="bold">Former Name</td>
								</xsl:when>
								<xsl:otherwise>
									<td width="20%" class="bold">&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td width="80%"><xsl:value-of select="."/></td>
						</tr>
					</xsl:for-each>
				</xsl:if>
				<tr>
					<td width="20%" class="bold">Incorporation Date</td>
					<td width="80%"><xsl:value-of select="incorporation_date"/></td>
				</tr>
				<tr>
					<td width="20%" class="bold">Status</td>
					<td width="80%">Cooperatives</td>
				</tr>
				<tr>
					<td width="20%" class="bold">Registered Address</td>
					<td width="80%"><xsl:value-of select="address"/></td>
				</tr>
				<xsl:if test="principal_activity">
					<xsl:for-each select="principal_activity/item">
						<tr>
							<xsl:choose>
								<xsl:when test="(position()) = 1">
									<td width="20%" class="bold">Principal Activity</td>
								</xsl:when>
								<xsl:otherwise>
									<td width="20%" class="bold">&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td width="80%"><xsl:value-of select="."/></td>
						</tr>
					</xsl:for-each>
				</xsl:if>
				<tr>
					<td width="20%" class="bold">Last Updated by Experian</td>
					<td width="80%"><xsl:value-of select="last_updated"/></td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- END COOPERATIVE DETAIL -->
  
	<!-- BEGIN COOPERATIVE COMMITTEE -->
	<xsl:template match="committee">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="4" align="left">COMMITTEE</th>
			</tr>
			<tr>
				<td width="25%" class="bold">Name</td>
				<td width="30%" class="bold">Address</td>
				<td width="20%" class="bold">IC No</td>
				<td width="25%" class="bold">Position</td>
			</tr>
			<xsl:for-each select="item">
				<tr>
					<td width="25%">
						<xsl:value-of select="name" /><br />
						<xsl:for-each select="name_detail">
							<xsl:if test="birthday">          
								BirthDt : <xsl:value-of select="birthday" />
							</xsl:if>
							<xsl:if test="remark">
								<xsl:value-of select="remark" /><br/>
							</xsl:if>
							<xsl:if test="position() != last()">
								<br />
							</xsl:if>
						</xsl:for-each>
					</td>
					<td width="30%"><xsl:value-of select="address" /></td>
					<td width="20%">
						<xsl:if test="old_ic">
							<xsl:value-of select="old_ic" /><br />
						</xsl:if>
						<xsl:value-of select="new_ic" />
					</td>
					<td width="25%"><xsl:value-of select="position" /></td>
				</tr>
			</xsl:for-each>
		</table>                  
	</xsl:template>
	<!-- END COOPERATIVE COMMITTEE -->
    
	<!-- BEGIN LEGAL SUIT -->
	<xsl:template name="legal_suit_details">
		
		<xsl:if test="defendant_name | old_ic | new_ic | local_no | reg_no | plaintiff_name">
			<tr>
				<xsl:if test="defendant_name">
					<td width="20%" class="bold">Defendant Name</td>
					<td width="30%"><xsl:value-of select="defendant_name"/>
						<xsl:if test="name_match = 1">
							<span class="red">&#160;(Name Match Only*)</span>
						</xsl:if>
					</td>
				</xsl:if>
				<xsl:if test="plaintiff_name">
					<td width="20%" class="bold">Plaintiff Name</td>
					<td width="30%"><xsl:value-of select="plaintiff_name"/></td>
				</xsl:if>
				<xsl:if test="old_ic | new_ic">
					<td width="20%" class="bold">ID/ IC No</td>
					<td width="30%">
						<xsl:call-template name="getBothICPPNo">
							<xsl:with-param name="newic">
								<xsl:value-of select="new_ic"/>
							</xsl:with-param>
							<xsl:with-param name="oldic">
								<xsl:value-of select="old_ic"/>
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</xsl:if>
				
				<xsl:if test="local_no">
					<td width="20%" class="bold">Local No.</td>
					<!-- <td width="30%"><xsl:value-of select="local_no"/></td> -->
					
					<xsl:choose>
						<xsl:when test="new_reg_no">
							<td width="30%"><xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/> </td>
						</xsl:when>
						<xsl:otherwise>
							<td width="30%"><xsl:value-of select="id"/></td>
						</xsl:otherwise>
					</xsl:choose>
					
				</xsl:if>
				
				<xsl:if test="reg_no">
					<td width="20%" class="bold">Reg No.</td>
					<!-- <td width="30%"><xsl:value-of select="reg_no"/></td> -->
					
					<xsl:choose>
						<xsl:when test="new_reg_no">
							<td width="30%"><xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/> </td>
						</xsl:when>
						<xsl:otherwise>
							<td width="30%"><xsl:value-of select="id"/></td>
						</xsl:otherwise>
					</xsl:choose>
					
				</xsl:if>
			</tr>
		</xsl:if>
		<xsl:if test="defendant_address">
			<tr>
				<td width="20%" class="bold">Defendant Address</td>
				<td width="30%"><xsl:value-of select="defendant_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="case_no">
			<tr>
				<td width="20%" class="bold">Case No.</td>
				<td width="30%"><xsl:value-of select="case_no"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor">
			<tr>
				<td width="20%" class="bold">Solicitor</td>
				<td width="30%"><xsl:value-of select="solicitor"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor_address">
			<tr>
				<td width="20%" class="bold">Solicitor Address</td>
				<td width="30%"><xsl:value-of select="solicitor_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor_tel | solicitor_fax">
			<tr>
				<td width="20%" class="bold">Solicitor Tel</td>
				<xsl:choose>
					<xsl:when test="solicitor_tel !=''">
						<td width="30%"><xsl:value-of select="solicitor_tel"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="30%">&#160;</td>
					</xsl:otherwise>
				</xsl:choose>
				
				
				<td width="20%" class="bold">Solicitor Fax</td>
				<xsl:choose>
					<xsl:when test="solicitor_fax !=''">
						<td width="30%"><xsl:value-of select="solicitor_fax"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="30%">&#160;</td>
					</xsl:otherwise>
				</xsl:choose>	
			</tr>
		</xsl:if>
		<xsl:if test="solicitor_email | solicitor_ref">
			<tr>
				<td width="20%" class="bold">Solicitor Email</td>
				<xsl:choose>
					<xsl:when test="solicitor_email">
						<td width="30%"><xsl:value-of select="solicitor_email"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="30%">&#160;</td>
					</xsl:otherwise>
				</xsl:choose>
				
				<td width="20%" class="bold">Solicitor Ref.</td>
				<xsl:choose>
					<xsl:when test="solicitor_ref">
						<td width="30%"><xsl:value-of select="solicitor_ref"/></td>
					</xsl:when>
					<xsl:otherwise>
						<td width="30%">&#160;</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</xsl:if>
		<xsl:if test="plaintiff">
			<tr>
				<td width="20%" class="bold">Plaintiff</td>
				<td width="30%"><xsl:value-of select="plaintiff"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if> 
		<xsl:if test="plaintiff_address">
			<tr>
				<td width="20%" class="bold">Plaintiff Address</td>
				<td width="30%"><xsl:value-of select="plaintiff_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="plaintiff_details/plaintiff_detail">
			<tr>
				<td width="20%" class="bold">Plaintiff</td>
				<xsl:choose>
					<xsl:when test="icppregno | old_ic | new_ic | local_no | reg_no">
						<xsl:variable name="localno"><xsl:value-of select="icppregno" /></xsl:variable>
						
						<xsl:variable name="type"><xsl:value-of select="plaintiff_type" /></xsl:variable>
						<xsl:variable name="name">
							<xsl:call-template name="escapeQuotes">
								<xsl:with-param name="txt">
									<xsl:value-of select="plaintiff"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<!--
						<xsl:variable name="js_link">
							<xsl:value-of select="concat('javascript:purchase_order(', $apos, $type, $apos, ',', $apos, $localno, $apos, ',', $apos, $name, $apos, ',',  $apos, '', $apos, ')')" />
						</xsl:variable>
						-->
						<td width="30%">
							<xsl:variable name="link_name"><xsl:value-of select="plaintiff" /></xsl:variable>
							<xsl:variable name="director_oldic"></xsl:variable>
							<xsl:call-template name="buildQuickPurchaseLink">
								<xsl:with-param name="type">
									<xsl:value-of select="$type"/>
								</xsl:with-param>
								<xsl:with-param name="director_newic">
									<xsl:value-of select="$localno"/>
								</xsl:with-param>
								<xsl:with-param name="director_name">
									<xsl:value-of select="$name"/>
								</xsl:with-param>
								<xsl:with-param name="director_oldic">
									<xsl:value-of select="$director_oldic"/>
								</xsl:with-param>
								<xsl:with-param name="link_name">
									<xsl:value-of select="$link_name"/>
								</xsl:with-param>
							</xsl:call-template>
							<!--					
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="$js_link" />
								</xsl:attribute>
								<xsl:value-of select="plaintiff" />
							</xsl:element>
							-->
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td width="30%"><xsl:value-of select="plaintiff" /></td>
					</xsl:otherwise>
				</xsl:choose>
			
				<xsl:choose>
					<xsl:when test="icppregno | old_ic | new_ic | local_no | reg_no">
						<xsl:if test="old_ic | new_ic | icppregno">
						
							<xsl:if test="plaintiff_type='B'">
								<td width="20%" class="bold">Reg No.</td>
							</xsl:if>
							
							<xsl:if test="plaintiff_type='C'">
								<td width="20%" class="bold">Local No.</td>
							</xsl:if>
							
							<xsl:if test="plaintiff_type='I'">
								<td width="20%" class="bold">ID/ IC No</td>
							</xsl:if>

							<xsl:variable name="localno"><xsl:value-of select="icppregno" /></xsl:variable>
							<xsl:variable name="type"><xsl:value-of select="plaintiff_type" /></xsl:variable>
							<xsl:variable name="name">
								<xsl:call-template name="escapeQuotes">
									<xsl:with-param name="txt">
										<xsl:value-of select="plaintiff"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<!--
							<xsl:variable name="js_link">
								<xsl:value-of select="concat('javascript:purchase_order(', $apos, $type, $apos, ',', $apos, $localno, $apos, ',', $apos, $name, $apos, ',',  $apos, '', $apos, ')')" />
							</xsl:variable>
							-->
							<td width="30%">
								<!-- <xsl:variable name="link_name"><xsl:value-of select="icppregno" /></xsl:variable> -->
								
								<xsl:variable name="link_name">
									<xsl:choose>
										<xsl:when test="new_reg_no">
											<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="icppregno" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								
								<xsl:variable name="director_oldic"></xsl:variable>
								<xsl:call-template name="buildQuickPurchaseLink">
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$localno"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
										<xsl:value-of select="$director_oldic"/>
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
								<!--
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="$js_link" />
									</xsl:attribute>
									<xsl:value-of select="icppregno" />
								</xsl:element>
								-->
							</td>
						</xsl:if>

					</xsl:when>
					<xsl:otherwise>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</xsl:otherwise>

				</xsl:choose>
			</tr>
			<tr>
				<td width="20%" class="bold">Plaintiff Address</td>
				<td width="30%"><xsl:value-of select="plaintiff_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:for-each>
		<xsl:for-each select="claim_details/claim_detail">
			<xsl:if test="amount_claim">
				<tr>
					<td width="20%" class="bold">Amount Claimed</td>
					<td width="30%"><xsl:value-of select="amount_claim"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="claim_nature">
				<tr>
					<td width="20%" class="bold">Claim Category</td>
					<td width="30%"><xsl:value-of select="claim_nature"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
		</xsl:for-each>						
		<xsl:if test="proclamation_of_sale">
			<tr>
				<td width="20%" class="bold">Proclamation of Sale</td>
				<td width="30%"><xsl:value-of select="proclamation_of_sale"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="petition_date">
			<tr>							
				<td width="20%" class="bold">Petition Date</td>
				<td width="30%"><xsl:value-of select="petition_date"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="summon_date">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">SUMMONS</td>
				<td width="20%" class="bold">Summon Date</td>
				<td width="30%"><xsl:value-of select="summon_date"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="hearing_date">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">HEARING</td>
				<td width="20%" class="bold">Hearing Date</td>
				<td width="30%"><xsl:value-of select="hearing_date"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="judgement_date">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">JUDGEMENT</td>
				<td width="20%" class="bold">Judgement Date</td>
				<td width="30%"><xsl:value-of select="judgement_date"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="jic_date">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">JUDGEMENT IN CONSENT</td>
				<td width="20%" class="bold">JIC Date</td>
				<td width="30%"><xsl:value-of select="jic_date"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="jid_date">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">JUDGEMENT IN DEFAULT</td>
				<td width="20%" class="bold">JID Date</td>
				<td width="30%"><xsl:value-of select="jid_date"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="settled_status_date | settled_letter_dated">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">SETTLED</td>
				<xsl:if test="settled_status_date">
					<td width="20%" class="bold">Settled Date</td>
					<td width="30%"><xsl:value-of select="settled_status_date"/></td>
				</xsl:if>
				
				<xsl:if test="settled_letter_dated">
					<td width="20%" class="bold">Settled Letter Dated</td>
					<td width="30%"><xsl:value-of select="settled_letter_dated"/></td>
				</xsl:if>
			</tr>
		</xsl:if>

		<xsl:if test="withdrawn_status_date | withdrawn_letter_dated">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">WITHDRAWN</td>
				<xsl:if test="withdrawn_status_date">
					<td width="20%" class="bold">Withdrawn Date</td>
					<td width="30%"><xsl:value-of select="withdrawn_status_date"/></td>
				</xsl:if>
				
				<xsl:if test="withdrawn_letter_dated">
					<td width="20%" class="bold">Letter Dated</td>
					<td width="30%"><xsl:value-of select="withdrawn_letter_dated"/></td>
				</xsl:if>
			</tr>
		</xsl:if>

		<xsl:if test="pending_status_date">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">PENDING</td>
				<td width="20%" class="bold">Pending Date</td>
				<td width="30%"><xsl:value-of select="pending_status_date"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="closed_status_as_at_date">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE CLOSED</td>
				<td width="20%" class="bold">As at Date</td>
				<td width="30%"><xsl:value-of select="closed_status_as_at_date"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="pending_status_as_at_date">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE PENDING</td>
				<td width="20%" class="bold">As at Date</td>
				<td width="30%"><xsl:value-of select="pending_status_as_at_date"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="case_settled = 'Y'">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE SETTLED</td>
				<td width="20%" class="bold"></td>
				<td width="30%"></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="case_withdrawn = 'Y'">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE WITHDRAWN</td>
				<td width="20%" class="bold"></td>
				<td width="30%"></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="petition_ref">
			<tr>							
				<td width="20%" class="bold">Petition Ref.</td>
				<td width="30%"><xsl:value-of select="petition_ref"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>						
		<xsl:if test="suit_ref">
			<tr>							
				<td width="20%" class="bold">Suit Ref.</td>
				<td width="30%"><xsl:value-of select="suit_ref"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="special_remark">
			<tr>
				<td width="20%" class="bold">Special Remark</td>
				<td width="30%"><xsl:value-of select="special_remark"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="property_location">
			<tr>
				<td width="20%" class="bold">Property Location</td>
				<td width="30%"><xsl:value-of select="property_location"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="property_description">
			<tr>
				<td width="20%" class="bold">Property Description</td>
				<td width="30%"><xsl:value-of select="property_description"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="auctioneer">
			<tr>
				<td width="20%" class="bold">Auctioneer</td>
				<td width="30%"><xsl:value-of select="auctioneer"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="reserve_price1">
			<tr>
				<td width="20%" class="bold">Reserve Price 1</td>
				<td width="30%">RM<xsl:value-of select="reserve_price1"/></td>
				<td width="20%" class="bold">Auction Date 1</td>
				<td width="30%"><xsl:value-of select="auction_date1"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="suit_ref1">
			<tr>
				<td width="20%" class="bold">Suit Ref. 1</td>
				<td width="30%"><xsl:value-of select="suit_ref1"/> / <xsl:value-of select="suit_ref_date1"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="reserve_price2">
			<tr>
				<td width="20%" class="bold">Reserve Price 2</td>
				<td width="30%">RM<xsl:value-of select="reserve_price2"/></td>
				<td width="20%" class="bold">Auction Date 2</td>
				<td width="30%"><xsl:value-of select="auction_date2"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="suit_ref2">
			<tr>
				<td width="20%" class="bold">Suit Ref. 2</td>
				<td width="30%"><xsl:value-of select="suit_ref2"/> / <xsl:value-of select="suit_ref_date2"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="reserve_price3">
			<tr>
				<td width="20%" class="bold">Reserve Price 3</td>
				<td width="30%">RM<xsl:value-of select="reserve_price3"/></td>
				<td width="20%" class="bold">Auction Date 3</td>
				<td width="30%"><xsl:value-of select="auction_date3"/></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="suit_ref3">
			<tr>
				<td width="20%" class="bold">Suit Ref. 3</td>
				<td width="30%"><xsl:value-of select="suit_ref3"/> / <xsl:value-of select="suit_ref_date3"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:for-each select="suit_remark/*">
			<tr>
				<td width="20%" class="bold">
					<xsl:if test="(position()) = 1">Remark</xsl:if>
				</td>
				<td width="30%"><xsl:value-of select="remarks"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:for-each>
		
		
		<xsl:if test="count(defendant_details) > 0">
			<tr>
				<td colspan="4" class="bold show_border">Defendant(s) mentioned in the case above: <xsl:value-of select="case_no"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Name</td>
				<td width="30%" class="bold">IC/PP No/Local No/RegNo</td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
			<xsl:for-each select="defendant_details/defendant_detail">
				<tr>
					<xsl:variable name="defendant_name">
						<xsl:call-template name="escapeQuotes">
							<xsl:with-param name="txt">
								<xsl:value-of select="defendant_name"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					
					<xsl:choose>
						<xsl:when test="defendant_type">
							<xsl:choose>
								<xsl:when test="defendant_type = 'I'">
									<xsl:variable name="icppno">
										<xsl:call-template name="getICPPNoPriorityNewIC">
											<xsl:with-param name="newic">
												<xsl:value-of select="defendant_newic"/>
											</xsl:with-param>
											<xsl:with-param name="oldic">
												<xsl:value-of select="defendant_oldic"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<td width="20%">
										<xsl:variable name="link_name"><xsl:value-of select="defendant_name" /></xsl:variable>
										<xsl:variable name="type">I</xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$icppno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$defendant_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, $icppno, $apos, ',', $apos, $defendant_name, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="defendant_name" />
										</xsl:element>
										-->
									</td>
									<td width="30%">
										<xsl:variable name="link_name"><xsl:value-of select="defendant_id" /></xsl:variable>
										<xsl:variable name="type">I</xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$icppno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$defendant_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, $icppno, $apos, ',', $apos, $defendant_name, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="defendant_id" />
										</xsl:element>
										-->
									</td>
								</xsl:when>
								<xsl:when test="defendant_type = 'U'">
									<td width="20%"><xsl:value-of select="defendant_name" /></td>
									<td width="30%"><xsl:value-of select="defendant_id" /></td>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="defendant_localno">
										<xsl:value-of select="defendant_regno" />
									</xsl:variable>
									<td width="20%">
										<xsl:variable name="link_name"><xsl:value-of select="defendant_name" /></xsl:variable>
										<xsl:variable name="type"><xsl:value-of select="defendant_type" /></xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$defendant_localno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$defendant_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, defendant_type, $apos, ',', $apos, $defendant_localno, $apos, ',', $apos, $defendant_name, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="defendant_name" />
										</xsl:element>
										-->
									</td>
									<td width="30%">
										<!-- <xsl:variable name="link_name"><xsl:value-of select="defendant_id" /></xsl:variable> -->
										
										<xsl:variable name="link_name">
											<xsl:choose>
												<xsl:when test="new_reg_no">
													<td width="80%"><xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/> </td>
												</xsl:when>
												<xsl:otherwise>
													<td width="80%"><xsl:value-of select="defendant_id"/></td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										
										<xsl:variable name="type"><xsl:value-of select="defendant_type" /></xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$defendant_localno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$defendant_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, defendant_type, $apos, ',', $apos, $defendant_localno, $apos, ',', $apos, $defendant_name, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="defendant_id" />
										</xsl:element>
										-->
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<td width="20%"><xsl:value-of select="defendant_name"/></td>
							<td width="30%"><xsl:value-of select="defendant_id"/></td>
						</xsl:otherwise>              
					</xsl:choose>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
		
		
		<xsl:if test="other_defendant_details">
			<tr>
				<td colspan="4" class="show_border bold">Other Defendant(s) mentioned in the case above: <xsl:value-of select="case_no"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Name</td>
				<td width="30%" class="bold">IC/PP No/Local No/RegNo</td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
			<xsl:for-each select="other_defendant_details/*">
				<tr>
					<xsl:variable name="other_defendant_name_temp">
						<xsl:call-template name="escapeQuotes">
							<xsl:with-param name="txt">
								<xsl:value-of select="other_defendant_name"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="other_defendant_type">
							<xsl:choose>
								<xsl:when test="other_defendant_type = 'I'">
									<xsl:variable name="icppno">
										<xsl:call-template name="getICPPNoPriorityNewIC">
											<xsl:with-param name="newic">
												<xsl:value-of select="other_defendant_newic"/>
											</xsl:with-param>
											<xsl:with-param name="oldic">
												<xsl:value-of select="other_defendant_oldic"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<td width="20%">
										<xsl:variable name="link_name"><xsl:value-of select="other_defendant_name" /></xsl:variable>
										<xsl:variable name="type">I</xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$icppno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$other_defendant_name_temp"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, $icppno, $apos, ',', $apos, $other_defendant_name_temp, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="other_defendant_name" />
										</xsl:element>
										-->
									</td>
									<td width="30%">
										<xsl:variable name="link_name"><xsl:value-of select="other_defendant_id" /></xsl:variable>
										<xsl:variable name="type">I</xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$icppno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$other_defendant_name_temp"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, $icppno, $apos, ',', $apos, $other_defendant_name_temp, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="other_defendant_id" />
										</xsl:element>
										-->
									</td>
								</xsl:when>
								<xsl:when test="other_defendant_type = 'U'">
									<td width="20%"><xsl:value-of select="other_defendant_name" /></td>
									<td width="30%"><xsl:value-of select="other_defendant_id" /></td>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="other_defendant_localno"><xsl:value-of select="other_defendant_regno" /></xsl:variable>
									<td width="20%">
										<xsl:variable name="link_name"><xsl:value-of select="other_defendant_name" /></xsl:variable>
										<xsl:variable name="type"><xsl:value-of select="other_defendant_type" /></xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$other_defendant_localno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$other_defendant_name_temp"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, other_defendant_type, $apos, ',', $apos, $other_defendant_localno, $apos, ',', $apos, $other_defendant_name_temp, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="other_defendant_name" />
										</xsl:element>
										-->
									</td>
									<td width="30%">
										<!-- <xsl:variable name="link_name"><xsl:value-of select="other_defendant_id" /></xsl:variable> -->
										
										<xsl:variable name="link_name">
											<xsl:choose>
												<xsl:when test="new_reg_no">
													<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="other_defendant_id" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										
										<xsl:variable name="type"><xsl:value-of select="other_defendant_type" /></xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$other_defendant_localno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$other_defendant_name_temp"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, other_defendant_type, $apos, ',', $apos, $other_defendant_localno, $apos, ',', $apos, $other_defendant_name_temp, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="other_defendant_id" />
										</xsl:element>
										-->
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<td width="20%"><xsl:value-of select="other_defendant_name"/></td>
							<td width="30%"><xsl:value-of select="other_defendant_id"/></td>
						</xsl:otherwise>              
					</xsl:choose>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<!-- BEGIN LEGAL SUIT BY REGNO PCR -->
	<xsl:template name="legal_suit_by_regno_pcr" match="xml/legal_suit_by_regno_pcr">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<th colspan="4" align="left" class="show_border">C. LEGAL ACTION</th>
				</tr>
				<tr>
					<td colspan="4"><em>Note: The following information on legal/winding-up/bankruptcy proceedings may not be current. This suit(s) may have been dismissed, withdrawn or struck-off (e.g it may have been held that the Subject is not liable as alledged in the claim, if at all or the case against a Defendant may have been struck-off or the alledged debt may have been settled after the entry of the information in our database)</em></td>
				</tr>
				<tr>
					<td colspan="4" class="show_border">
						<table border="0" class="woborder" width="100%">
							<tr>
								<td class="bold normal-text">LEGAL SUITS - SUBJECT AS DEFENDANT</td>
								<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(*)" /></td>
							</tr>
						</table>
					</td>				
				</tr>
				<xsl:call-template name="legal_suit_by_regno_details" />
			</table>
	</xsl:template>
	<!-- END LEGAL SUIT BY REGNO PCR -->
	
	<!-- BEGIN LEGAL SUIT BY REGNO CCR1 -->
	<xsl:template name="legal_suit_by_regno_ccr1" match="legal_suit_by_regno_ccr1">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<th colspan="4" align="left" class="show_border">LEGAL ACTION<br /><span class="small">Note: The following information on legal / winding up / bankruptcy proceedings may not be current. This Suit(s) may have been dismissed, withdrawn or struck off (eg: it may have been held that the subject is not liable as alleged in the claim, if at all or the case against a Defendant may have been struck off or the alleged debt may have been settled after the entry of the information in our database). The person or company listed as the litigant in the suit may have a similar name as the subject whom/which you seek information on. Whilst the Subject&#39;s IC number (if available) or Company Number (if available) or other identification may indicate that the person named in the action is the Subject, we cannot determine or confirm that the litigant is in fact the subject on whom/which information is sought. Please check with subject(s) concerned for confirmation.</span></th>
				</tr>
				<tr>
					<td colspan="4" class="show_border">
						<table border="0" class="woborder" width="100%">
							<tr>
								<td class="bold normal-text">LEGAL SUITS</td>
								<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(*)" /></td>
							</tr>
						</table>
					</td>				
				</tr>
				<xsl:call-template name="legal_suit_by_regno_details" />
			</table>
	</xsl:template>
	<!-- END LEGAL SUIT BY REGNO CCR1 -->
	
	<!-- BEGIN LEGAL SUIT BY REGNO -->
	<xsl:template name="legal_suit_by_regno" match="legal_suit_by_regno">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<th colspan="4" align="left" class="show_border">LEGAL ACTION<br /><span class="small">Note: The following information on legal / winding up / bankruptcy proceedings may not be current. This Suit(s) may have been dismissed, withdrawn or struck off (eg: it may have been held that the subject is not liable as alleged in the claim, if at all or the case against a Defendant may have been struck off or the alleged debt may have been settled after the entry of the information in our database). The person or company listed as the litigant in the suit may have a similar name as the subject whom/which you seek information on. Whilst the Subject&#39;s IC number (if available) or Company Number (if available) or other identification may indicate that the person named in the action is the Subject, we cannot determine or confirm that the litigant is in fact the subject on whom/which information is sought. Please check with subject(s) concerned for confirmation.</span></th>
				</tr>
				<tr>
					<td colspan="4" class="show_border">
						<table border="0" class="woborder" width="100%">
							<tr>
								<td class="bold normal-text">LEGAL SUITS - SUBJECT AS DEFENDANT</td>
								<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(*)" /></td>
							</tr>
						</table>
					</td>				
				</tr>
				<xsl:call-template name="legal_suit_by_regno_details" />
			</table>
	</xsl:template>
	<!-- END LEGAL SUIT BY REGNO -->
	
	<xsl:template name="legal_suit_by_regno_details">
				<xsl:choose>
					<xsl:when test="item">
					<!-- <ol> -->
						<xsl:for-each select="item[status_group='CWS']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:value-of select="position()" />. CASE WITHDRAWN / SETTLED</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="legal_suit_details" />
						</xsl:for-each>
						<xsl:for-each select="item[status_group='CCL']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:value-of select="position()" />. CASE CLOSED</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="legal_suit_details" />
						</xsl:for-each>
						<xsl:for-each select="item[status_group='JUD']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:value-of select="position()" />. JUDGEMENT / JUDGEMENT IN DEFAULT / JUDGEMENT IN CONSENT</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="legal_suit_details" />
						</xsl:for-each>
						<xsl:for-each select="item[status_group='CPD']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:value-of select="position()" />. CASE PENDING</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="legal_suit_details" />
						</xsl:for-each>
						<xsl:for-each select="item[status_group='OTH']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:value-of select="position()" />. LEGAL SUMMONS FILED</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="legal_suit_details" />
						</xsl:for-each>
					<!-- </ol> -->
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td class="show_border" colspan="4">NO INFORMATION AVAILABLE</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>	
	</xsl:template>
	
  	<!-- END LEGAL SUIT -->
	
	<!-- BEGIN PROCLAMATION/FORECLOSURE - MAIL -->
	<xsl:template name="legal_suit_proclamation_by_regno" match="legal_suit_proclamation_by_regno">
	<xsl:if test="count(*) > 0">
		<table border="0" width="100%" class="nobottom">
		<!-- <ol> -->
			<tr>
				<td colspan="4" class="show_border">
					<table border="0" class="woborder" width="100%">
						<tr>
							<td class="bold normal-text">PROCLAMATION OF SALE</td>
							<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(land_office/item) + count(CWS/item) + count(high_court/item)" /></td>
						</tr>
					</table>
				</td>				
			</tr>
			<xsl:variable name="hc_count">
				<xsl:value-of select="count(high_court/item)"/>
			</xsl:variable>
			<xsl:variable name="lo_count">
				<xsl:value-of select="count(land_office/item)"/>
			</xsl:variable>
			<xsl:variable name="cws_count">
				<xsl:value-of select="count(CWS/item)"/>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="CWS or high_court or land_office">
					<xsl:for-each select="CWS/item">
							<tr>
								<td colspan="4" class="show_border2">
									<table border="0" class="woborder" width="100%">
										<tr>
											<td class="bold normal-text"><xsl:value-of select="position()" />. CASE WITHDRAWN / SETTLED</td>
										</tr>
									</table>
								</td>	
							</tr>
						<xsl:call-template name="legal_suit_details" />
					</xsl:for-each>
					<xsl:for-each select="high_court/item">
							<tr>
								<td colspan="4" class="show_border2">
									<table border="0" class="woborder" width="100%">
										<tr>
											<td class="bold normal-text"><xsl:value-of select="position() + $cws_count" />. PROCLAMATION OF SALE UNDER HIGH COURT</td>
										</tr>
									</table>
								</td>	
							</tr>
						<xsl:call-template name="legal_suit_details" />
					</xsl:for-each>
					<xsl:for-each select="land_office/item">
							<tr>
								<td colspan="4" class="show_border2">
									<table border="0" class="woborder" width="100%">
										<tr>
											<td class="bold normal-text"><xsl:value-of select="position() + $cws_count + $hc_count" />. PROCLAMATION OF SALE UNDER LAND OFFICE</td>
										</tr>
									</table>
								</td>	
							</tr>
						<xsl:call-template name="legal_suit_details" />
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
						<tr>
							<td class="show_border" colspan="4">NO INFORMATION AVAILABLE</td>
						</tr>
				</xsl:otherwise>
			</xsl:choose>
		<!-- </ol> -->
		</table>
	</xsl:if>
	</xsl:template>
	<!-- END PROCLAMATION/FORECLOSURE -->
	
	<!-- BEGIN OTHER COURT CASE -->
	<xsl:template match="others_court_by_regno" name="others_court_by_regno">
		<xsl:if test="count(*) > 0">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<td colspan="4" class="show_border">
						<table border="0" class="woborder" width="100%">
							<tr>
								<td class="bold normal-text">OTHER COURT CASES</td>
								<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(*)" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<xsl:choose>
					<xsl:when test="item">
						<xsl:for-each select="item">
							<xsl:call-template name="others_court_details" />
							<xsl:if test="position() != last()">
								<tr>
									<td colspan="4" class="show_border">&#160;</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td class="show_border" colspan="4">NO INFORMATION AVAILABLE</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="others_court_details">
		<xsl:if test="case_no">
			<tr>
				<td width="20%" class="bold">Case No</td>
				<td width="30%"><xsl:value-of select="case_no"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="court_case_no">
			<tr>
				<td width="20%" class="bold">Court Case No</td>
				<td width="30%"><xsl:value-of select="court_case_no"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:for-each select="claims/claim">
			<tr>
				<xsl:choose>
					<xsl:when test="(position()) = 1">
						<td width="20%" class="bold">Amount Claimed</td>
					</xsl:when>
					<xsl:otherwise>
						<td width="20%" class="bold">&#160;</td>
					</xsl:otherwise>
				</xsl:choose>
				<td width="30%"><xsl:value-of select="." /></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:for-each>
		
		<xsl:if test="case_category">
			<tr>
				<td width="20%" class="bold">Case Category</td>
				<td width="30%"><xsl:value-of select="case_category" /></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:for-each select="charge_type/item">
			<tr>
				<xsl:choose>
					<xsl:when test="(position()) = 1">
						<td width="20%" class="bold">Charge Type</td>
					</xsl:when>
					<xsl:otherwise>
						<td width="20%" class="bold">&#160;</td>
					</xsl:otherwise>
				</xsl:choose>
				<td width="30%"><xsl:value-of select="." /></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:for-each>
		
		<xsl:for-each select="suit_status">
			<xsl:if test="hearing_date">
				<tr>
					<td width="20%" class="bold">Case Status</td>
					<td width="30%">HEARING</td>
					<td width="20%" class="bold">Hearing Date:</td>
					<td width="30%"><xsl:value-of select="hearing_date" /></td>
				</tr>
			</xsl:if>
        
			<xsl:if test="judgement_in_default">
				<tr>
					<td width="20%" class="bold">Case Status</td>
					<td width="30%">JUDGEMENT IN DEFAULT</td>
					<td width="20%" class="bold">JID Date:</td>
					<td width="30%"><xsl:value-of select="judgement_in_default" /></td>
				</tr>
			</xsl:if>
        
			<xsl:if test="status">
				<tr>
					<td width="20%" class="bold">Case Status</td>
					<td width="30%"><xsl:value-of select="status" /></td>
					<td width="20%" class="bold"><xsl:value-of select="title" /></td>
					<td width="30%"><xsl:value-of select="status_date" /></td>
				</tr>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="suit_ref">
			<tr>
				<td width="20%" class="bold">Suit Ref</td>
				<td width="30%"><xsl:value-of select="suit_ref"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:for-each select="court_remark/item">
			<tr>
				<xsl:choose>
					<xsl:when test="(position()) = 1">
						<td width="20%" class="bold">Remarks</td>
					</xsl:when>
					<xsl:otherwise>
						<td width="20%" class="bold">&#160;</td>
					</xsl:otherwise>
				</xsl:choose>
				<td width="30%"><xsl:value-of select="."/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>  
			</tr>
		</xsl:for-each>
		<xsl:if test="last_updated_date">
			<tr>
				<td width="20%" class="bold">Last Updated At</td>
				<td width="30%"><xsl:value-of select="last_updated_date"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="respondents">
			<tr>
				<td width="100%" class="show_border bold" colspan="4">Respondent/Petitioner(s)</td>
			</tr>
			<xsl:if test="respondents/name">
				<tr>
					<td width="20%" class="bold">Respondent/Petitioner Name</td>
					<td width="30%"><xsl:value-of select="respondents/name"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/old_ic">
				<tr>
					<td width="20%" class="bold">IC / PP No</td>
					<td width="30%"><xsl:value-of select="respondents/old_ic"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/new_ic">
				<tr>
					<td width="20%" class="bold">New IC No</td>
					<td width="30%"><xsl:value-of select="respondents/new_ic"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/local_no">
				<tr>
					<td width="20%" class="bold">Local No</td>
					<td width="30%"><xsl:value-of select="respondents/local_no"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/reg_no">
				<tr>
					<td width="20%" class="bold">Registration No</td>
					<td width="30%"><xsl:value-of select="respondents/reg_no"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/special_remark">
				<tr>
					<td width="20%" class="bold">Special Remark</td>
					<td width="30%"><xsl:value-of select="respondents/special_remark"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/address">
				<tr>
					<td width="20%" class="bold">Respondent/Petitioner Address</td>
					<td width="30%"><xsl:value-of select="respondents/address"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/solicitor_name">
				<tr>
					<td width="20%" class="bold">Respondent/Petitioner Solicitor</td>
					<td width="30%"><xsl:value-of select="respondents/solicitor_name"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/solicitor_address">
				<tr>
					<td width="20%" class="bold">Solicitor Address</td>
					<td width="30%"><xsl:value-of select="respondents/solicitor_address"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/solicitor_telephone">
				<tr>
					<td width="20%" class="bold">Solicitor Tel</td>
					<td width="30%"><xsl:value-of select="respondents/solicitor_telephone"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/solicitor_fax">
				<tr>
					<td width="20%" class="bold">Solicitor Fax</td>
					<td width="30%"><xsl:value-of select="respondents/solicitor_fax"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/solicitor_email">
				<tr>
					<td width="20%" class="bold">Solicitor Email</td>
					<td width="30%"><xsl:value-of select="respondents/solicitor_email"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
			<xsl:if test="respondents/solicitor_ref">
				<tr>
					<td width="20%" class="bold">Solicitor Ref</td>
					<td width="30%"><xsl:value-of select="respondents/solicitor_ref"/></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:if>
        
			<xsl:if test="respondents/others_respondents/others_respondent">
				<tr>
					<td width="100%" colspan="4" class="bold show_border">Other Respondent/Petitioner(s) mentioned in the case above:<xsl:value-of select="case_no" /></td>
				</tr>
				<tr>
					<td width="20%" class="bold">IC/PP No/Local No/RegNo</td>
					<td width="30%" class="bold">Name</td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
				<xsl:for-each select="respondents/others_respondents/others_respondent">
					<tr>
						<td width="20%"><xsl:value-of select="id" /></td>
						<td width="30%"><xsl:value-of select="name" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:for-each>
			</xsl:if>
		</xsl:if>
		<xsl:if test="appellants/appellant">
			<tr>
				<td class="show_border bold" colspan="4">Appellant(s)</td>
			</tr>
			<xsl:for-each select="appellants/appellant">
				<tr>
					<td width="20%" class="bold">Appellant Name</td>
					<td width="30%"><xsl:value-of select="name" /></td>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
				<xsl:if test="old_ic">
					<tr>
						<td width="20%" class="bold">IC / PP No</td>
						<td width="30%"><xsl:value-of select="old_ic" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="new_ic">
					<tr>
						<td width="20%" class="bold">New IC No</td>
						<td width="30%"><xsl:value-of select="new_ic" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="local_no">
					<tr>
						<td width="20%" class="bold">Local No</td>
						<td width="30%"><xsl:value-of select="local_no" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="reg_no">
					<tr>
						<td width="20%" class="bold">Registration No</td>
						<td width="30%"><xsl:value-of select="reg_no" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="special_remark">
					<tr>
						<td width="20%" class="bold">Special Remark</td>
						<td width="30%"><xsl:value-of select="special_remark" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="address">
					<tr>
						<td width="20%" class="bold">Appellant Address</td>
						<td width="30%"><xsl:value-of select="address" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="solicitor_name">
					<tr>
						<td width="20%" class="bold">Appellant Solicitor</td>
						<td width="30%"><xsl:value-of select="solicitor_name" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="solicitor_address">
					<tr>
						<td width="20%" class="bold">Solicitor Address</td>
						<td width="30%"><xsl:value-of select="solicitor_address" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="solicitor_telephone">
					<tr>
						<td width="20%" class="bold">Solicitor Tel</td>
						<td width="30%"><xsl:value-of select="solicitor_telephone" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="solicitor_fax">
					<tr>
						<td width="20%" class="bold">Solicitor Fax</td>
						<td width="30%"><xsl:value-of select="solicitor_fax" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="solicitor_email">
					<tr>
						<td width="20%" class="bold">Solicitor Email</td>
						<td width="30%"><xsl:value-of select="solicitor_email" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>
				<xsl:if test="solicitor_ref">
					<tr>
						<td width="20%" class="bold">Solicitor Ref</td>
						<td width="30%"><xsl:value-of select="solicitor_ref" /></td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
				</xsl:if>        
				<xsl:if test="others_appellants/others_appellant">
					<tr>
						<td width="100%" colspan="4" class="bold show_border">Other Appellant(s) mentioned in the case above: <xsl:value-of select="case_no" /></td>
					</tr>
					<tr>
						<td width="20%" class="bold">IC/PP No/Local No/RegNo</td>
						<td width="30%" class="bold">Name</td>
						<td width="20%">&#160;</td>
						<td width="30%">&#160;</td>
					</tr>
					<xsl:for-each select="others_appellants/others_appellant">
						<tr>
							<td width="20%"><xsl:value-of select="id" /></td>
							<td width="30%"><xsl:value-of select="name" /></td>
							<td width="20%">&#160;</td>
							<td width="30%">&#160;</td>
						</tr>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- END OTHER COURT CASE -->
	
	<!-- BEGIN OTHER KNOWN LEGAL SUIT -->
	<xsl:template match="others_known_legal_suit" name="others_known_legal_suit">
		<xsl:if test="count(item) > 0">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<td colspan="4" class="show_border">
						<table border="0" class="woborder" width="100%">
							<tr>
								<td class="bold normal-text">OTHER KNOWN LEGAL SUITS WITH LIMITED DETAILS - SUBJECT AS DEFENDANT</td>
								<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(item)" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<xsl:for-each select="item">
					<xsl:call-template name="legal_suit_details" />
					<xsl:if test="name_match = 1">
						<tr>
							<td colspan="4" class="show_border">Note: * The ID number of Defendant in this case is not available, we cannot determine or confirm that the litigant is in fact the Subject, please verify with the Subject concerned or purchase litigation details for confirmation.</td>
						</tr>
					</xsl:if>
					<tr>
						<td colspan="4" class="show_border">
							<xsl:variable name="suit_id"><xsl:value-of select="suit_id" />/<xsl:value-of select="/xml/input_request/product_code" /></xsl:variable>
							<xsl:call-template name="buildPurchaseSuitLink">
								<xsl:with-param name="suit_id">
									<xsl:value-of select="$suit_id"/>
								</xsl:with-param>
							</xsl:call-template>
							<!--
							<xsl:variable name="js_link">
								<xsl:value-of select="concat('javascript:purchase_suit(', $apos, $suit_id, $apos, ')')" />
							</xsl:variable>
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="$js_link" />
								</xsl:attribute>
								Click Here
							</xsl:element>
							-->
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- END OTHER KNOWN LEGAL SUIT -->
	
	<!-- BEGIN LEGAL SUIT BY PLAINTIFF -->
	<xsl:template match="legal_suit_by_plaintiff" name="legal_suit_by_plaintiff">
		<xsl:if test="count(item) > 0">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<td colspan="4" class="show_border">
						<table border="0" class="woborder" width="100%">
							<tr>
								<td class="bold normal-text">LEGAL SUITS - SUBJECT AS PLAINTIFF</td>
								<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(item)" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<xsl:for-each select="item">
					<xsl:call-template name="legal_suit_details" />
					<xsl:if test="position() != last()">
						<tr>
							<td colspan="4" class="show_border">&#160;</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="total > 10">
					<tr>
						<td colspan="4" class="show_border">&#160;</td>
					</tr>
					<tr>
						<td colspan="4" class="show_border red bold">Note: A total of <xsl:value-of select="total" /> cases traced under &quot;Legal Suits - Subject as Plaintiff&quot; but only up to 10 legal suits (recent years) will be shown under this section of report. </td>
					</tr>
				</xsl:if>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- END LEGAL SUIT BY PLAINTIFF -->
	
	<!-- BEGIN LEGAL PROCLAMATION HIGH COURT SUIT BY PLAINTIFF -->
	<xsl:template match="legal_suit_proclamation_by_plaintiff/high_court" name="legal_suit_by_plaintiff_hc">
		<xsl:if test="count(item) > 0">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<td colspan="4" class="show_border">
						<table border="0" class="woborder" width="100%">
							<tr>
								<td class="bold normal-text">PROCLAMATION OF SALE UNDER HIGH COURT - SUBJECT AS PLAINTIFF</td>
								<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(item)" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<xsl:for-each select="item">
					<xsl:call-template name="legal_suit_details" />
					<xsl:if test="position() != last()">
						<tr>
							<td colspan="4" class="show_border">&#160;</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="total > 10">
					<tr>
						<td colspan="4" class="show_border">&#160;</td>
					</tr>
					<tr>
						<td colspan="4" class="show_border red bold">Note: A total of <xsl:value-of select="total" /> cases traced under &quot;Proclamation of Sale Under High Court - Subject as Plaintiff&quot; but only up to 10 legal suits (recent years) will be shown under this section of report. </td>
					</tr>
				</xsl:if>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- END LEGAL PROCLAMATION HIGH COURT SUIT BY PLAINTIFF -->
	
	<!-- BEGIN LEGAL PROCLAMATION LAND OFFICE SUIT BY PLAINTIFF -->
	<xsl:template match="legal_suit_proclamation_by_plaintiff/land_office" name="legal_suit_by_plaintiff_lo">
		<xsl:if test="count(item) > 0">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<td colspan="4" class="show_border">
						<table border="0" class="woborder" width="100%">
							<tr>
								<td class="bold normal-text">PROCLAMATION OF SALE UNDER LAND OFFICE - SUBJECT AS PLAINTIFF</td>
								<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(item)" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<xsl:for-each select="item">
					<xsl:call-template name="legal_suit_details" />
					<xsl:if test="position() != last()">
						<tr>
							<td colspan="4" class="show_border">&#160;</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="total > 10">
					<tr>
						<td colspan="4" class="show_border">&#160;</td>
					</tr>
					<tr>
						<td colspan="4" class="show_border red bold">Note: A total of <xsl:value-of select="total" /> cases traced under &quot;Proclamation of Sale Under Land Office - Subject as Plaintiff&quot; but only up to 10 legal suits (recent years) will be shown under this section of report. </td>
					</tr>
				</xsl:if>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- END LEGAL PROCLAMATION LAND OFFICE SUIT BY PLAINTIFF -->
	
	<!-- BEGIN WINDING UP PETITION/ STRUCK OFF/ ORDER AND LIQUIDATION -->
	<xsl:template match="windup_petition_details">
		<br />
		<table border="0" width="100%" class="nobottom">
			<xsl:choose>
				<xsl:when test="(count(*)) > 0">
				<!-- <ol> -->
					<xsl:if test="windup_petition_detail[status_court='HC']">
						<tr>
							<td colspan="4" class="show_border">
								<table border="0" class="woborder" width="100%">
									<tr>
										<td class="bold normal-text">WINDING-UP ACTION</td>
										<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(windup_petition_detail)" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<xsl:for-each select="windup_petition_detail[status_court='HC' and status_group='CWS']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='HC' and status_group='CWS']" />CASE WITHDRAWN / SETTLED</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[status_court='HC' and status_group='DWU']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='HC' and status_group='DWU']" />DISCHARGED OF WOUND-UP ORDER</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[status_court='HC' and status_group='WUO']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='HC' and status_group='WUO']" />WOUND-UP ORDER</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[status_court='HC' and status_group='CCL']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='HC' and status_group='CCL']" />CASE CLOSED</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[status_court='HC' and status_group='CPD']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='HC' and status_group='CPD']" />CASE PENDING</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[status_court='HC' and status_group='OTH']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='HC' and status_group='OTH']" />WINDING-UP PETITION</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
					</xsl:if>
					
					<xsl:if test="windup_petition_detail[status_court='MV' or status_court='CV']">
						<tr>
							<td colspan="4" class="show_border">
								<table border="0" class="woborder" width="100%">
									<tr>
										<td class="bold normal-text">VOLUNTARY WOUND UP</td>
										<td class="italic-bold normal-text" align="right"></td>
									</tr>
								</table>
							</td>
						</tr>
						<xsl:for-each select="windup_petition_detail[(status_court='MV' or status_court='CV') and status_group='CWS']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[(status_court='MV' or status_court='CV') and status_group='CWS']" />CASE WITHDRAWN / SETTLED</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[(status_court='MV' or status_court='CV') and status_group='MVW']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[(status_court='MV' or status_court='CV') and status_group='MVW']" />MEMBER'S VOLUNTARY WINDING UP</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[(status_court='MV' or status_court='CV') and status_group='CVW']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[(status_court='MV' or status_court='CV') and status_group='CVW']" />CREDITOR'S VOLUNTARY WINDING UP</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
					</xsl:if>
					
					<xsl:if test="windup_petition_detail[status_court='ROC']">
						<tr>
							<td colspan="4" class="show_border">
								<table border="0" class="woborder" width="100%">
									<tr>
										<td class="bold normal-text">COMPANY STRUCK OFF</td>
										<td class="italic-bold normal-text" align="right"></td>
									</tr>
								</table>
							</td>
						</tr>
						<xsl:for-each select="windup_petition_detail[status_court='ROC' and status_group='CWS']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='ROC' and status_group='CWS']" />CASE WITHDRAWN / SETTLED</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[status_court='ROC' and status_group='SOF']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='ROC' and status_group='SOF']" />STRUCK OFF</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
						<xsl:for-each select="windup_petition_detail[status_court='ROC' and status_group='SON']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="windup_petition_detail[status_court='ROC' and status_group='SON']" />STRIKE OFF NOTICE</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="winding_details" />
						</xsl:for-each>
					</xsl:if>
					<!-- </ol> -->
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="show_border" colspan="4">NO WINDING UP ACTION IN OUR DATABANK</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END WINDING UP PETITION/ STRUCK OFF/ ORDER AND LIQUIDATION -->
	
	<!-- BEGIN WINDING UP DETAILS -->
	<xsl:template name="winding_details">
		<tr>
			<td width="20%" class="bold">Defendant Name</td>
			<td width="30%"><xsl:value-of select="defendant_name"/></td>
			<td width="20%" class="bold">&#160;</td>
			<td width="30%">&#160;</td>
		</tr>
		<xsl:for-each select="former_name_details/*">
			<tr>
				<td width="20%" class="bold">Former Name</td>
				<td width="30%"><xsl:value-of select="former_name"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:for-each>
		<tr>
			<td width="20%" class="bold">Local No</td>
			<td width="30%"> <!-- <xsl:value-of select="local_no"/></td> -->
				<xsl:choose>
					<xsl:when test="new_reg_no">
						<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="local_no"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td width="20%" class="bold">&#160;</td>
			<td width="30%">&#160;</td>
		</tr>
		<tr>
			<td width="20%" class="bold">Type/Court</td>
			<td width="30%"><xsl:value-of select="court"/></td>
			<td width="20%" class="bold">&#160;</td>
			<td width="30%">&#160;</td>
		</tr>
		<tr>
			<td width="20%" class="bold">Case No</td>
			<td width="30%"><xsl:value-of select="case_no"/></td>
			<td width="20%" class="bold">&#160;</td>
			<td width="30%">&#160;</td>
		</tr>
		<xsl:if test="petitioner">
			<tr>
				<td width="20%" class="bold">Petitioner</td>
				<td width="30%"><xsl:value-of select="petitioner"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="petitioner_solicitor">
			<tr>
				<td width="20%" class="bold">Petitioner&#39;s Solicitor</td>
				<td width="30%"><xsl:value-of select="petitioner_solicitor"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor_address">							
			<tr>
				<td width="20%" class="bold">Solicitor Address</td>
				<td width="30%"><xsl:value-of select="solicitor_address"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor_tel | solicitor_fax">
			<tr>
				<td width="20%" class="bold">Solicitor Tel</td>
				<td width="30%"><xsl:value-of select="solicitor_tel"/></td>
				<td width="20%" class="bold">Solicitor Fax</td>
				<td width="30%"><xsl:value-of select="solicitor_fax"/></td>
			</tr>
		</xsl:if>
        <xsl:if test="solicitor_email | solicitor_ref">
			<tr>
				<td width="20%" class="bold">Solicitor Email</td>
				<td width="30%"><xsl:value-of select="solicitor_email"/></td>
				<td width="20%" class="bold">Solicitor Ref.</td>
				<td width="30%"><xsl:value-of select="solicitor_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="liquidator">
			<tr>
				<td width="20%" class="bold">Liquidator</td>
				<td width="30%"><xsl:value-of select="liquidator"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="liquidator_icno">
			<tr>
				<td width="20%" class="bold">Liquidator&#39;s IC/PP No.</td>
				<td width="30%"><xsl:value-of select="liquidator_icno"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="liquidator_firm">
			<tr>
				<td width="20%" class="bold">Liquidator&#39;s Firm</td>
				<td width="30%"><xsl:value-of select="liquidator_firm"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="liquidator_address">
			<tr>
				<td width="20%" class="bold">Liquidator&#39;s Address</td>
				<td width="30%"><xsl:value-of select="liquidator_address"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="appointment_date | appointment_ref">
			<tr>
				<td width="20%" class="bold">Appointment Date</td>
				<td width="30%"><xsl:value-of select="appointment_date"/></td>
				<td width="20%" class="bold">Appointment Ref</td>
				<td width="30%"><xsl:value-of select="appointment_ref"/></td>
			</tr>
		</xsl:if> 
		<xsl:if test="date_of_inst_aff">
			<tr>
				<td width="20%" class="bold">Date of Inst Aff</td>
				<td width="30%"><xsl:value-of select="date_of_inst_aff"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="notice_date | notice_ref">
			<tr>
				<td width="20%" class="bold">Notice Date</td>
				<td width="30%"><xsl:value-of select="notice_date"/></td>
				<td width="20%" class="bold">Notice Ref.</td>
				<td width="30%"><xsl:value-of select="notice_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="petition_date | petition_ref">
			<tr>
				<td width="20%" class="bold">Petition Date</td>
				<td width="30%"><xsl:value-of select="petition_date"/></td>
				<td width="20%" class="bold">Petition Ref.</td>
				<td width="30%"><xsl:value-of select="petition_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="hearing_date">
			<tr>
				<td width="20%" class="bold">Hearing Date</td>
				<td width="30%"><xsl:value-of select="hearing_date"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="struck_off_date | struck_off_ref">
			<tr>
				<td width="20%" class="bold">Struck Off Date</td>
				<td width="30%"><xsl:value-of select="struck_off_date"/></td>
				<td width="20%" class="bold">Struck Off Ref.</td>
				<td width="30%"><xsl:value-of select="struck_off_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="wound_up_date | wound_up_ref">
			<tr>
				<td width="20%" class="bold">Wound-up Date</td>
				<td width="30%"><xsl:value-of select="wound_up_date"/></td>
				<td width="20%" class="bold">Wound-up Ref.</td>
				<td width="30%"><xsl:value-of select="wound_up_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="discharged_date | discharged_ref">
			<tr>
				<td width="20%" class="bold">Discharged Date</td>
				<td width="30%"><xsl:value-of select="discharged_date"/></td>
				<td width="20%" class="bold">Discharged Ref.</td>
				<td width="30%"><xsl:value-of select="discharged_ref"/></td>
			</tr>
		</xsl:if>              
		<xsl:if test="case_status">
			<tr>
				<td width="20%" class="bold">Case Status</td>
				<td width="30%"><xsl:value-of select="case_status"/></td>
				<xsl:if test="status_date">
					<td width="20%" class="bold">Status Date</td>
					<td width="30%"><xsl:value-of select="status_date"/></td>
				</xsl:if>
				<xsl:if test="letter_date">
					<td width="20%" class="bold">Letter Dated</td>
					<td width="30%"><xsl:value-of select="letter_date"/></td>
				</xsl:if>
			</tr>
		</xsl:if>
		
		<xsl:if test="case_status_as_at">
			<tr>
				<td width="20%" class="bold">Case Status</td>
				<td width="30%"><xsl:value-of select="case_status_as_at"/></td>
				<xsl:if test="status_date_as_at">
					<td width="20%" class="bold">As at Date</td>
					<td width="30%"><xsl:value-of select="status_date_as_at"/></td>
				</xsl:if>
			</tr>
		</xsl:if>
		
		<xsl:if test="case_settled = 'Y'">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE SETTLED</td>
				<td width="20%" class="bold"></td>
				<td width="30%"></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="case_withdrawn = 'Y'">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE WITHDRAWN</td>
				<td width="20%" class="bold"></td>
				<td width="30%"></td>
			</tr>
		</xsl:if>
		
		<xsl:for-each select="windup_remark/*">
			<tr>
				<td width="20%" class="bold">REMARK</td>
				<td width="30%"><xsl:value-of select="remark"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:for-each>
		
		<!--<xsl:if test="position() != last()">
		<tr>
			<td colspan="4" class="show_border">&#160;</td>
		</tr>
		</xsl:if>-->
	</xsl:template>
	<!-- END WINDING UP DETAILS -->
	
	<!-- BEGIN BANKRUPTCY PCR -->
	<xsl:template match="xml/person_bankruptcy_pcr" name="person_bankruptcy_pcr">
		<br />
		<table border="0" width="100%" class="nobottom">
			<tr>
				<th colspan="4" align="left" class="show_border">D. BANKRUPTCY ACTION<br /></th>
			</tr>
			<tr>
				<td colspan="4"><em>Note: The following information on legal/winding-up/bankruptcy proceedings may not be current. This suit(s) may have been dismissed, withdrawn or struck-off (e.g it may have been held that the Subject is not liable as alledged in the claim, if at all or the case against a Defendant may have been struck-off or the alledged debt may have been settled after the entry of the information in our database)</em></td>
			</tr>
			<tr>
				<td colspan="4" class="show_border">
					<table border="0" class="woborder" width="100%">
						<tr>
							<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(case/item)"/></td>
						</tr>
					</table>
				</td>
			</tr>
			<xsl:call-template name="person_bankruptcy_details" />
		</table>
	</xsl:template>
	<!-- END BANKRUPTCY PCR -->
	
	<!-- BEGIN BANKRUPTCY -->
	<xsl:template match="person_bankruptcy" name="person_bankruptcy">
		<br />
		<table border="0" width="100%" class="nobottom">
			<tr>
				<th colspan="4" align="left" class="show_border">BANKRUPTCY ACTION<br /><span class="small">Note: The following information on legal / winding up / bankruptcy proceedings may not be current. This Suit(s) may have been dismissed, withdrawn or struck off (eg: it may have been held that the subject is not liable as alleged in the claim, if at all or the case against a Defendant may have been struck off or the alleged debt may have been settled after the entry of the information in our database). The person or company listed as the litigant in the suit may have a similar name as the subject whom/which you seek information on. Whilst the Subject&#39;s IC number (if available) or Company Number (if available) or other identification may indicate that the person named in the action is the Subject, we cannot determine or confirm that the litigant is in fact the subject on whom/which information is sought. Please check with subject(s) concerned for confirmation.</span></th>
			</tr>
			<tr>
				<td colspan="4" class="show_border">
					<table border="0" class="woborder" width="100%">
						<tr>
							<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(case/item)"/></td>
						</tr>
					</table>
				</td>
			</tr>
			<xsl:call-template name="person_bankruptcy_details" />
		</table>
	</xsl:template>
	<!-- END BANKRUPTCY -->
	
	<!-- BEGIN BANKRUPTCY DETAILS-->
	<xsl:template name="person_bankruptcy_details">
			<xsl:choose>
				<xsl:when test="(count(case/item)) > 0">
				<!-- <ol> -->
						<xsl:for-each select="case/item[status_group='CWS']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:number format="1. " count="case/item[status_group='CWS']" />CASE WITHDRAWN / SETTLED</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="bankrupt_details" />
						</xsl:for-each>
						
						<xsl:for-each select="case/item[status_group='DAO']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:number format="1. " count="case/item[status_group='DAO']" />DISCHARGED OF ADJUDICATION ORDER</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="bankrupt_details" />
						</xsl:for-each>
						
						<xsl:for-each select="case/item[status_group='AAO']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:number format="1. " count="case/item[status_group='AAO']" />ANNULMENT OF ADJUDICATION ORDER</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="bankrupt_details" />
						</xsl:for-each>
						
						<xsl:for-each select="case/item[status_group='ROD']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:number format="1. " count="case/item[status_group='ROD']" />RECEIVING ORDER</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="bankrupt_details" />
						</xsl:for-each>
						
						<xsl:for-each select="case/item[status_group='AOD']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:number format="1. " count="case/item[status_group='AOD']" />ADJUDICATION ORDER</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="bankrupt_details" />
						</xsl:for-each>
						
						<xsl:for-each select="case/item[status_group='CCL']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:number format="1. " count="case/item[status_group='CCL']" />CASE CLOSED</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="bankrupt_details" />
						</xsl:for-each>
						
						<xsl:for-each select="case/item[status_group='CPD']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:number format="1. " count="case/item[status_group='CPD']" />CASE PENDING</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="bankrupt_details" />
						</xsl:for-each>
						
						<xsl:for-each select="case/item[status_group='OTH']">
								<tr>
									<td colspan="4" class="show_border2">
										<table border="0" class="woborder" width="100%">
											<tr>
												<td class="bold normal-text"><xsl:number format="1. " count="case/item[status_group='OTH']" />BANKRUPTCY NOTICE / PETITION</td>
											</tr>
										</table>
									</td>	
								</tr>
							<xsl:call-template name="bankrupt_details" />
						</xsl:for-each>
					<xsl:if test="remark">
						<tr>
							<td class="h3 red bold show_border" colspan="4"><xsl:value-of select="remark"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="oa_date">
						<tr>
							<td class="h3 red bold show_border" colspan="4">
								<p class="h3">OFFICIAL ASSIGNEE SEARCH</p>
								<p>Official Assignee search last updated by Experian on <xsl:value-of select="oa_date" /> on
									<xsl:if test="oldic_oa_date"> NRIC: <xsl:value-of select="newic_oa_date" /></xsl:if>
									<xsl:if test="newic_oa_date"> OLD IC: <xsl:value-of select="oldic_oa_date" /></xsl:if>
								confirmed that subject is NOT a bankrupt.</p>
							</td>
						</tr>
					</xsl:if>
				<!-- </ol> -->
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="4" class="show_border">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	<!-- END BANKRUPTY-->
	
	<!-- BEGIN BANKRUPT DETAILS -->
	<xsl:template name="bankrupt_details">
		<xsl:if test="defendant_name">
			<tr>
				<td width="20%" class="bold">Defendant Name</td>
				<td width="30%"><xsl:value-of select="defendant_name"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="old_ic | new_ic">
			<tr>
				<td width="20%" class="bold">IC / PP No</td>
				<td width="30%"><xsl:value-of select="old_ic"/></td>
				<td width="20%" class="bold">New IC No.</td>
				<td width="30%"><xsl:value-of select="new_ic"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="special_remark">
			<tr>
				<td width="20%" class="bold">Special Remark</td>
				<td width="30%"><xsl:value-of select="special_remark"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="defendant_address">
			<tr>
				<td width="20%" class="bold">Defendant Address</td>
				<td width="30%"><xsl:value-of select="defendant_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="plaintiff_address">
			<tr>
				<td width="20%" class="bold">Plaintiff Address</td>
				<td width="30%"><xsl:value-of select="plaintiff_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="case_no">
			<tr>
				<td width="20%" class="bold">Case No</td>
				<td width="30%"><xsl:value-of select="case_no"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="creditor">
			<tr>
				<td width="20%" class="bold">Creditor</td>
				<td width="30%"><xsl:value-of select="creditor"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="creditor_address">
			<tr>
				<td width="20%" class="bold">Creditor Address</td>
				<td width="30%"><xsl:value-of select="creditor_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor">
			<tr>
				<td width="20%" class="bold">Solicitor</td>
				<td width="30%"><xsl:value-of select="solicitor"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor_address">
			<tr>
				<td width="20%" class="bold">Solicitor Address</td>
				<td width="30%"><xsl:value-of select="solicitor_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor_tel | solicitor_fax">
			<tr>
				<td width="20%" class="bold">Solicitor Tel</td>
				<td width="30%"><xsl:value-of select="solicitor_tel"/></td>
				<td width="20%" class="bold">Solicitor Fax</td>
				<td width="30%"><xsl:value-of select="solicitor_fax"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="solicitor_email | solicitor_ref">
			<tr>
				<td width="20%" class="bold">Solicitor Email</td>
				<td width="30%"><xsl:value-of select="solicitor_email"/></td>
				<td width="20%" class="bold">Solicitor Ref</td>
				<td width="30%"><xsl:value-of select="solicitor_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="notice_date | notice_ref">
			<tr>
				<td width="20%" class="bold">Notice Date</td>
				<td width="30%"><xsl:value-of select="notice_date"/></td>
				<td width="20%" class="bold">Notice Ref</td>
				<td width="30%"><xsl:value-of select="notice_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="petition_date | petition_ref">
			<tr>
				<td width="20%" class="bold">Petition Date</td>
				<td width="30%"><xsl:value-of select="petition_date"/></td>
				<td width="20%" class="bold">Petition Ref</td>
				<td width="30%"><xsl:value-of select="petition_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="hearing_date">
			<tr>
				<td width="20%" class="bold">Hearing Date</td>
				<td width="30%"><xsl:value-of select="hearing_date"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="receiving_date | receiving_ref">
			<tr>
				<td width="20%" class="bold">Receiving Order Date</td>
				<td width="30%"><xsl:value-of select="receiving_date"/></td>
				<td width="20%" class="bold">Receiving Order Date Ref</td>
				<td width="30%"><xsl:value-of select="receiving_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="adjudication_order_date | adjudication_order_ref">
			<tr>
				<td width="20%" class="bold">Adjudication Order Date</td>
				<td width="30%"><xsl:value-of select="adjudication_order_date"/></td>
				<td width="20%" class="bold">Adjudication Order Date Ref</td>
				<td width="30%"><xsl:value-of select="adjudication_order_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="discharge_date">
			<tr>
				<td width="20%" class="bold">Discharge Date</td>
				<td width="30%"><xsl:value-of select="discharge_date"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="discharge_date_ref">
			<tr>
				<td width="20%" class="bold">Discharge Date Ref</td>
				<td width="30%"><xsl:value-of select="discharge_date_ref"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="annulment_date">
			<tr>
				<td width="20%" class="bold">Annulment Date</td>
				<td width="30%"><xsl:value-of select="annulment_date"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="annulment_date_ref">
			<tr>
				<td width="20%" class="bold">Annulment Date Ref</td>
				<td width="30%"><xsl:value-of select="annulment_date_ref"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="count(case_status) > 0">
			<tr>
				<xsl:if test="case_status/status">
					<td width="20%" class="bold">Status</td>
					<td width="30%"><xsl:value-of select="case_status/status"/></td>
				</xsl:if>
				
				<xsl:if test="case_status/settled_status_date">
					<td width="20%" class="bold">Settled Date</td>
					<td width="30%"><xsl:value-of select="case_status/settled_status_date"/></td>
				</xsl:if>
				
				<xsl:if test="case_status/settled_letter_dated">
					<td width="20%" class="bold">Settled Letter Date</td>
					<td width="30%"><xsl:value-of select="case_status/settled_letter_dated"/></td>
				</xsl:if>
				
				<xsl:if test="case_status/withdrawn_status_date">
					<td width="20%" class="bold">Withdrawn Date</td>
					<td width="30%"><xsl:value-of select="case_status/withdrawn_status_date"/></td>
				</xsl:if>
				
				<xsl:if test="case_status/withdrawn_letter_dated">
					<td width="20%" class="bold">Withdrawn Letter Date</td>
					<td width="30%"><xsl:value-of select="case_status/withdrawn_letter_dated"/></td>
				</xsl:if>
				
				<xsl:if test="case_status/pending_status_date">
					<td width="20%" class="bold">Pending Date</td>
					<td width="30%"><xsl:value-of select="case_status/pending_status_date"/></td>
				</xsl:if>
			
				<xsl:if test="case_status/status_date">
					<td width="20%" class="bold">Status Date</td>
					<td width="30%"><xsl:value-of select="case_status/status_date"/></td>
				</xsl:if>
			
				<xsl:if test="case_status/letter_dated">
					<td width="20%" class="bold">Letter Dated</td>
					<td width="30%"><xsl:value-of select="case_status/letter_dated"/></td>
				</xsl:if>
				
				<xsl:if test="case_status/pending_status_as_at_date">
					<td width="20%" class="bold">As at Date</td>
					<td width="30%"><xsl:value-of select="case_status/pending_status_as_at_date"/></td>
				</xsl:if>
			
				<xsl:if test="case_status/closed_status_as_at_date">
					<td width="20%" class="bold">As at Date</td>
					<td width="30%"><xsl:value-of select="case_status/closed_status_as_at_date"/></td>
				</xsl:if>
				
			</tr>
		</xsl:if>
		<xsl:if test="case_settled ='Y'">
			<tr>
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE SETTLED</td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="case_withdrawn ='Y'">
			<tr>
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE WITHDRAWN</td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="remark">
			<tr>
				<td width="20%" class="bold">Remark</td>
				<td width="30%"><xsl:value-of select="remark"/></td>
				<td width="20%" class="bold">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="(count(creditors/creditor)) > 0">
			<tr>
				<td colspan="4" class="bold show_border">Creditor(s) mentioned in the case above: <xsl:value-of select="case_no"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Name</td>
				<td width="30%" class="bold">IC/PP No/Local No/RegNo</td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
			<xsl:for-each select="creditors/creditor">
				<xsl:variable name="type">
					<xsl:value-of select="type"/>
				</xsl:variable>
				<xsl:variable name="apos">'</xsl:variable>
				<xsl:variable name="icppno">
					<xsl:choose>
						<xsl:when test="type = 'I'">
							<xsl:call-template name="getICPPNoPriorityNewIC">
								<xsl:with-param name="newic">
									<xsl:value-of select="new_ic"/>
								</xsl:with-param>
								<xsl:with-param name="oldic">
									<xsl:value-of select="old_ic"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="reg_no"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:variable name="combined_id">
					<xsl:choose>
						<xsl:when test="type = 'I'">
							<xsl:call-template name="getBothICPPNo">
								<xsl:with-param name="newic">
									<xsl:value-of select="new_ic"/>
								</xsl:with-param>
								<xsl:with-param name="oldic">
									<xsl:value-of select="old_ic"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="reg_no"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:variable name="name">
					<xsl:call-template name="escapeQuotes">
					<xsl:with-param name="txt">
						<xsl:value-of select="name"/>
					</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
						
				<tr>
					<xsl:choose>
						<xsl:when test="string-length($icppno) > 0">
							<td width="20%">
								<xsl:element name="a">
									<!-- HIDE IN B2B ONLY -->
									<!-- <xsl:attribute name="href">
										<xsl:value-of select="concat('javascript:purchase_order(', $apos, $type, $apos, ',', $apos, $icppno, $apos, ',', $apos, $name, $apos, ',',  $apos, '', $apos, ')')" />
									</xsl:attribute> -->
									<xsl:value-of select="name" />
								</xsl:element>
							</td>
							<td width="30%">
								<xsl:element name="a">
									<!-- HIDE IN B2B ONLY -->
									<!--<xsl:attribute name="href">
										<xsl:value-of select="concat('javascript:purchase_order(', $apos, $type, $apos, ',', $apos, $icppno, $apos, ',', $apos, $name, $apos, ',',  $apos, '', $apos, ')')" />
									</xsl:attribute> -->
									<xsl:value-of select="$combined_id" />
								</xsl:element>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td width="20%">
								<xsl:value-of select="name" />
							</td>
							<td width="30%">&#160;</td>
						</xsl:otherwise>
					</xsl:choose>
					<td width="20%">&#160;</td>
					<td width="30%">&#160;</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
		<!--<xsl:if test="position() != last()">
			<tr>
				<td colspan="4" class="show_border">&#160;</td>
			</tr>
		</xsl:if>-->
	</xsl:template>
	<!-- END BACKRUPT DETAILS -->
  
	<!-- BEGIN INTEREST IN WINDING UP / STRUCK OFF COMPANY -->	
	<xsl:template match="person_interest_in_struckoff_companies" name="person_interest_in_struckoff_companies">
	<xsl:if test="count(*) > 0">
		<br />
		<table border="0" width="100%" class="nobottom">
		<!-- <ol> -->
			<tr>
				<th colspan="4" align="left" class="show_border">SECRETARY / DIRECTOR/ SHAREHOLDER OF WINDING-UP/STRUCK OFF COMPANY &amp; OTHERS</th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(*)) > 0">
					<xsl:if test="person_interest_in_struckoff_company[status_court='HC']">
						<tr>
							<td colspan="4" class="show_border">
								<table border="0" class="woborder" width="100%">
									<tr>
										<td class="bold normal-text">WINDING UP ACTION</td>
										<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(person_interest_in_struckoff_company)" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='HC' and status_group='CWS']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='HC' and status_group='CWS']" />CASE WITHDRAWN / SETTLED</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='HC' and status_group='DWU']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='HC' and status_group='DWU']" />DISCHARGED OF WOUND-UP ORDER</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='HC' and status_group='WUO']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='HC' and status_group='WUO']" />WOUND-UP ORDER</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='HC' and status_group='CCL']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='HC' and status_group='CCL']" />CASE CLOSED</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='HC' and status_group='CPD']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='HC' and status_group='CPD']" />CASE PENDING</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='HC' and status_group='OTH']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='HC' and status_group='OTH']" />WINDING-UP PETITION</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
					</xsl:if>
					
					<xsl:if test="person_interest_in_struckoff_company[status_court='MV' or status_court='CV']">
						<tr>
							<td colspan="4" class="show_border">
								<table border="0" class="woborder" width="100%">
									<tr>
										<td class="bold normal-text">VOLUNTARY WOUND UP</td>
										<td class="italic-bold normal-text" align="right"></td>
									</tr>
								</table>
							</td>
						</tr>
						<xsl:for-each select="person_interest_in_struckoff_company[(status_court='MV' or status_court='CV') and status_group='CWS']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[(status_court='MV' or status_court='CV') and status_group='CWS']" />CASE WITHDRAWN / SETTLED</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[(status_court='MV' or status_court='CV') and status_group='MVW']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[(status_court='MV' or status_court='CV') and status_group='MVW']" />MEMBER'S VOLUNTARY WINDING UP</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[(status_court='MV' or status_court='CV') and status_group='CVW']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[(status_court='MV' or status_court='CV') and status_group='CVW']" />CREDITOR'S VOLUNTARY WINDING UP</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
					</xsl:if>
					
					<xsl:if test="person_interest_in_struckoff_company[status_court='ROC']">
						<tr>
							<td colspan="4" class="show_border">
								<table border="0" class="woborder" width="100%">
									<tr>
										<td class="bold normal-text">COMPANY STRUCK OFF</td>
										<td class="italic-bold normal-text" align="right"></td>
									</tr>
								</table>
							</td>
						</tr>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='ROC' and status_group='CWS']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='ROC' and status_group='CWS']" />CASE WITHDRAWN / SETTLED</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='ROC' and status_group='SOF']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='ROC' and status_group='SOF']" />STRUCK OFF</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
						<xsl:for-each select="person_interest_in_struckoff_company[status_court='ROC' and status_group='SON']">
									<tr>
										<td colspan="4" class="show_border2">
											<table border="0" class="woborder" width="100%">
												<tr>
													<td class="bold normal-text"><xsl:number format="1. " count="person_interest_in_struckoff_company[status_court='ROC' and status_group='SON']" />STRIKE OFF NOTICE</td>
												</tr>
											</table>
										</td>	
									</tr>
								<xsl:call-template name="interest_in_winding_up_struck_off_company" />
						</xsl:for-each>
					</xsl:if>
					
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="show_border" colspan="4">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		<!-- </ol> -->
		</table>
	</xsl:if>
	</xsl:template>
	<!-- END INTEREST IN WINDING UP / STRUCK OFF COMPANY -->
	
	<!-- INTEREST IN WINDING UP / STRUCK OFF COMPANY DETAILS -->
	<xsl:template name="interest_in_winding_up_struck_off_company">
		<xsl:if test="local_no">
			<tr>
				<td width="20%" class="bold">Local No</td>
				<td width="30%"><xsl:value-of select="local_no"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="company_name">
			<tr>
				<td width="20%" class="bold">Company Name</td>
				<td width="30%"><xsl:value-of select="company_name"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="registered_address">
			<tr>
				<td width="20%" class="bold">Registered Address</td>
				<td width="30%"><xsl:value-of select="registered_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="incorp_date | co_status">
			<tr>
				<td width="20%" class="bold">Incorporation Date</td>
				<td width="30%"><xsl:value-of select="incorp_date"/></td>
				<td width="20%" class="bold">Status</td>
				<td width="30%"><xsl:value-of select="co_status"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="auth_capital | paidup_capital">
			<tr>
				<td width="20%" class="bold">Authorised Capital</td>
				<td width="30%"><xsl:value-of select="auth_capital"/></td>
				<td width="20%" class="bold">Paid-up Capital</td>
				<td width="30%"><xsl:value-of select="paidup_capital"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="designation | shareholding">
			<tr>
				<td width="20%" class="bold">Designation</td>
				<td width="30%"><xsl:value-of select="designation"/></td>
				<td width="20%" class="bold">Shareholding</td>
				<td width="30%">
					<xsl:choose>
						<xsl:when test="shareholding">
							<xsl:value-of select="shareholding"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'0'"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="last_upd_date">
			<tr>
				<td width="20%" class="bold">Last Updated</td>
				<td width="30%"><xsl:value-of select="last_upd_date"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="court_type | place">
			<tr>
				<td width="20%" class="bold">Court / Type</td>
				<td width="30%"><xsl:value-of select="court_type"/></td>
				<td width="20%" class="bold">Place</td>
				<td width="30%"><xsl:value-of select="place"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="case_no | year">
			<tr>
				<td width="20%" class="bold">Case No</td>
				<td width="30%"><xsl:value-of select="case_no"/></td>
				<td width="20%" class="bold">Year</td>
				<td width="30%"><xsl:value-of select="year"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="petitioner">
			<tr>
				<td width="20%" class="bold">Petitioner</td>
				<td width="30%"><xsl:value-of select="petitioner"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="pet_solicitor">
			<tr>
				<td width="20%" class="bold">Petitioner&#39;s Sol.</td>
				<td width="30%"><xsl:value-of select="pet_solicitor"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="pet_solicitor_ref">
			<tr>
				<td width="20%" class="bold">Solicitor Ref.</td>
				<td width="30%"><xsl:value-of select="pet_solicitor_ref"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="petition_date | petition_ref">
			<tr>
				<td width="20%" class="bold">Petition Date</td>
				<td width="30%"><xsl:value-of select="petition_date"/></td>
				<td width="20%" class="bold">Petition Ref</td>
				<td width="30%"><xsl:value-of select="petition_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="notice_date | notice_ref">
			<tr>
				<td width="20%" class="bold">Notice Date</td>
				<td width="30%"><xsl:value-of select="notice_date"/></td>
				<td width="20%" class="bold">Notice Ref</td>
				<td width="30%"><xsl:value-of select="notice_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="hearing_date">
			<tr>
				<td width="20%" class="bold">Hearing Date</td>
				<td width="30%"><xsl:value-of select="hearing_date"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="wound_up_date | wound_up_ref">
			<tr>
				<td width="20%" class="bold">Wound-up Date</td>
				<td width="30%"><xsl:value-of select="wound_up_date"/></td>
				<td width="20%" class="bold">Wound-up Ref</td>
				<td width="30%"><xsl:value-of select="wound_up_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="struck_off_date | struck_off_ref">
			<tr>
				<td width="20%" class="bold">Struck-off Date</td>
				<td width="30%"><xsl:value-of select="struck_off_date"/></td>
				<td width="20%" class="bold">Struck-off Ref</td>
				<td width="30%"><xsl:value-of select="struck_off_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="discharge_date | discharge_ref">
			<tr>
				<td width="20%" class="bold">Discharge Date</td>
				<td width="30%"><xsl:value-of select="discharge_date"/></td>
				<td width="20%" class="bold">Discharge Ref</td>
				<td width="30%"><xsl:value-of select="discharge_ref"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="liquidator">
			<tr>
				<td width="20%" class="bold">Liquidator</td>
				<td width="30%"><xsl:value-of select="liquidator"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="liquidator_ic">
			<tr>
				<td width="20%" class="bold">Liquidator IC/PP No.</td>
				<td width="30%"><xsl:value-of select="liquidator_ic"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="liquidator_firm">
			<tr>
				<td width="20%" class="bold">Liquidator Firm</td>
				<td width="30%"><xsl:value-of select="liquidator_firm"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="liquidator_address">
			<tr>
				<td width="20%" class="bold">Liquidator Address</td>
				<td width="30%"><xsl:value-of select="liquidator_address"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		<xsl:if test="appointment_date | date_instrument_affected">
			<tr>
				<td width="20%" class="bold">Appointment Date</td>
				<td width="30%"><xsl:value-of select="appointment_date"/></td>
				<td width="20%" class="bold">Date of Instrument Affected</td>
				<td width="30%"><xsl:value-of select="date_instrument_affected"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="case_status">
			<tr>
				<td width="20%" class="bold">Case Status</td>
				<td width="30%"><xsl:value-of select="case_status"/></td>
				<xsl:if test="status_date">
					<td width="20%" class="bold">Status Date</td>
					<td width="30%"><xsl:value-of select="status_date"/></td>
				</xsl:if>
				<xsl:if test="status_as_at_date">
					<td width="20%" class="bold">As at Date</td>
					<td width="30%"><xsl:value-of select="status_as_at_date"/></td>
				</xsl:if>
				<xsl:if test="letter_dated">
					<td width="20%" class="bold">Letter Dated</td>
					<td width="30%"><xsl:value-of select="letter_dated"/></td>
				</xsl:if>
			</tr>
		</xsl:if>
		
		<xsl:if test="case_settled = 'Y'">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE SETTLED</td>
				<td width="20%" class="bold"></td>
				<td width="30%"></td>
			</tr>
		</xsl:if>
		
		<xsl:if test="case_withdrawn = 'Y'">
			<tr>							
				<td width="20%" class="bold">Case Status</td>
				<td width="30%">CASE WITHDRAWN 1111111</td>
				<td width="20%" class="bold"></td>
				<td width="30%"></td>
			</tr>
		</xsl:if>
		
		<xsl:for-each select="remarks/*">
			<tr>
				<td width="20%" class="bold">Remark</td>
				<td width="30%"><xsl:value-of select="."/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:for-each>
		<xsl:if test="director_remarks">
			<tr>
				<td width="20%" class="bold">Director Remark</td>
				<td width="30%"><xsl:value-of select="director_remarks"/></td>
				<td width="20%">&#160;</td>
				<td width="30%">&#160;</td>
			</tr>
		</xsl:if>
		
		<!--<xsl:if test="position() != last()">
			<tr>
				<td colspan="4" class="show_border">&#160;</td>
			</tr>
		</xsl:if>-->
	</xsl:template>
	<!-- END INTEREST IN WINDING UP / STRUCK OFF COMPANY DETAILS -->
	
	<!-- BEGIN INTEREST IN OTHER COMPANIES -->
	<xsl:template match="interests_in_other_company">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="6" align="left">INTEREST IN OTHER COMPANIES<br /><span class="small">NOTE: The following information relating to shareholding interest by the Subject may not be current. There may be changes which may not be currently available in our databank</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(*)) > 0">
					<tr>
						<td class="bold" width="15%">Local No</td>
						<td class="bold" width="35%">Company</td>
						<td class="bold" width="15%" align="right">Shareholding</td>
						<td class="bold" width="7%" align="right">%</td>
						<td class="bold" width="15%">Remarks</td>
						<td class="bold" width="13%">As At</td>
					</tr>
					<xsl:for-each select="item">
						<tr>
							<!-- <xsl:variable name="localno"><xsl:value-of select="local_no" /></xsl:variable> -->
							<xsl:variable name="localno">
								<xsl:choose>
									<xsl:when test="new_reg_no">
										<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="local_no" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:variable name="name">
								<xsl:call-template name="escapeQuotes">
									<xsl:with-param name="txt">
										<xsl:value-of select="company_name"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<!--
							<xsl:variable name="js_link">
								<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'C', $apos, ',', $apos, $localno, $apos, ',', $apos, $name, $apos, ',',  $apos, '', $apos, ')')" />
							</xsl:variable>
							-->
							<td width="15%">
								<xsl:variable name="link_name"><xsl:value-of select="$localno" /></xsl:variable>
								<xsl:variable name="type">C</xsl:variable>
								
								<xsl:call-template name="buildQuickPurchaseLink">
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$localno"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
										
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
								<!--
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="$js_link" />
									</xsl:attribute>
									<xsl:value-of select="local_no" />
								</xsl:element>
								-->
							</td>
							<td width="35%">
								<xsl:variable name="link_name"><xsl:value-of select="$name" /></xsl:variable>
								<xsl:variable name="type">C</xsl:variable>
								
								<xsl:call-template name="buildQuickPurchaseLink">
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$localno"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
										
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
								<!--
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="$js_link" />
									</xsl:attribute>
									<xsl:value-of select="company_name" />
								</xsl:element>
								-->
							</td>
							<td width="15%" align="right"><xsl:value-of select="format-number(shareholding, '###,###,###.00')" /></td>
							<td width="7%" align="right"><xsl:value-of select="share_percentage" /></td>
							<td width="15%"><xsl:value-of select="remark" /></td>
							<td width="13%"><xsl:value-of select="as_at" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="6">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<xsl:if test="(count(*)) > 0">		
			<div class="highlight">
				<p class="bold"><u>REMARK LEGEND</u></p>
				<p>Company Status as per SSM record: <span class="bold">WU</span> - Winding-Up, <span class="bold">DS</span> - Dissolved</p>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- END INTEREST IN OTHER COMPANIES -->
	
	<!-- BEGIN INTEREST IN OTHER COMPANIES - CP -->
	<xsl:template match="interests_in_other_companies">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="5" align="left">INTEREST IN OTHER COMPANIES<br /><span class="small">NOTE: The following information relating to shareholding interest by the Subject may not be current. There may be changes which may not be currently available in our databank</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(*)) > 0">
					<tr>
						<td class="bold" width="15%">Local No</td>
						<td class="bold" width="40%">Company</td>
						<td class="bold" width="20%" align="right">Shareholding</td>
						<td class="bold" width="10%" align="right">%</td>
						<td class="bold" width="15%">As At</td>
					</tr>
					<xsl:for-each select="interests_in_other_company">
						<tr>
							<!-- <xsl:variable name="localno"><xsl:value-of select="local_no" /></xsl:variable> -->
							
							<xsl:variable name="localno">
								<xsl:choose>
									<xsl:when test="new_reg_no">
										<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="local_no" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:variable name="name">
								<xsl:call-template name="escapeQuotes">
									<xsl:with-param name="txt">
										<xsl:value-of select="company_name"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<td>
								<xsl:variable name="link_name"><xsl:value-of select="$localno" /></xsl:variable>
								<xsl:variable name="type">C</xsl:variable>
								
								<xsl:call-template name="buildQuickPurchaseLink">
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$localno"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
										
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
							</td>
							<td>
								<xsl:variable name="link_name"><xsl:value-of select="$name" /></xsl:variable>
								<xsl:variable name="type">C</xsl:variable>
								
								<xsl:call-template name="buildQuickPurchaseLink">
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$localno"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
										
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
							</td>
							<td align="right"><xsl:value-of select="format-number(shareholding, '###,###,###.00')" /></td>
							<td align="right"><xsl:value-of select="share_percentage" /></td>
							<td><xsl:value-of select="as_at" /></td>
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
	</xsl:template>
	<!-- END INTEREST IN OTHER COMPANIES - CP -->
	
	<!-- BEGIN MARKET STANDING -->
	<xsl:template name="market_standing" match="market_standing">
		<xsl:if test="(.) = 0">
			<br />
			<table border="0" width="100%" class="full_border">
				<tr>
					<th colspan="5" align="left">MARKET STANDING</th>
				</tr>
				<tr>
					<td colspan="5">CLEAR</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- END MARKET STANDING -->
  
	<!-- BEGIN DIRECTOR / OFFICERS -->
	<xsl:template match="directors">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="4" align="left">DIRECTORS / OFFICERS</th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(director)) > 0">
					<tr>
					  <td width="25%" class="bold">Name</td>
					  <td width="45%" class="bold">Address</td>
					  <td width="15%" class="bold">IC/PP No</td>
					  <td width="15%" class="bold">Designation</td>
					</tr>
					<xsl:for-each select="director">
						<tr>
							<xsl:variable name="type">I</xsl:variable>
							<xsl:variable name="director_name">
								<xsl:call-template name="escapeQuotes">
									<xsl:with-param name="txt">
										<xsl:value-of select="name"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
			
							<xsl:variable name="director_newic"><xsl:value-of select="new_ic" /></xsl:variable>
							<xsl:variable name="director_oldic"><xsl:value-of select="old_ic" /></xsl:variable>
      
							<xsl:variable name="icppno">
								<xsl:call-template name="getBothICPPNo">
									<xsl:with-param name="newic">
										<xsl:value-of select="new_ic"/>
									</xsl:with-param>
									<xsl:with-param name="oldic">
										<xsl:value-of select="old_ic"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
      
							<td width="25%" valign="top">
								<xsl:variable name="link_name"><xsl:value-of select="name" /></xsl:variable>
								<xsl:call-template name="buildQuickPurchaseLink">
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$director_newic"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$director_name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
										<xsl:value-of select="$director_oldic"/>
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
								<!--
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, $director_newic, $apos, ',', $apos, $director_name, $apos, ',',  $apos, $director_oldic, $apos, ')')" />
									</xsl:attribute>
									<xsl:value-of select="name" />
								</xsl:element>
								-->
								
								<xsl:if test="app_date">
									<br/>App Date : <xsl:value-of select="app_date" />
								</xsl:if>
								<xsl:if test="resign_date">
									<br />Resign Date : <xsl:value-of select="resign_date" />
								</xsl:if>
							</td>    
							<td width="45%" valign="top"><xsl:value-of select="address" /></td>
							<td width="15%" valign="top">
								<xsl:variable name="link_name"><xsl:value-of select="$icppno" /></xsl:variable>
								
								<xsl:call-template name="buildQuickPurchaseLink">
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$director_newic"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$director_name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
										<xsl:value-of select="$director_oldic"/>
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
								<!--
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, $director_newic, $apos, ',', $apos, $director_name, $apos, ',',  $apos, $director_oldic, $apos, ')')" />
									</xsl:attribute>
										<xsl:value-of select="$icppno" />
								</xsl:element>
								-->
								<xsl:if test="dob">
									<br/>DOB : <xsl:value-of select="dob" />
								</xsl:if>
							</td>
							<td width="15%" valign="top"><xsl:value-of select="designation" /></td>
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
	</xsl:template>
	<!-- END DIRECTOR / OFFICERS -->
    
	<!-- BEGIN SHAREHOLDERS -->
	<xsl:template match="shareholders">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="5" align="left">SHAREHOLDERS / MEMBERS</th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(shareholder/*)) > 0">
					<tr>
						<td width="25%" class="bold">Name</td>
						<td width="39%" class="bold">Address</td>
						<td width="13%" class="bold">IC/PP/Local No</td>
						<td width="13%" class="bold">Shareholding</td>
						<td width="10%" class="bold">%</td>
					</tr>
					<xsl:for-each select="shareholder/item">
						<tr>
							<xsl:variable name="shareholder_type"><xsl:value-of select="type" /></xsl:variable>
							<xsl:variable name="shareholder_name">
								<xsl:call-template name="escapeQuotes">
									<xsl:with-param name="txt">
										<xsl:value-of select="name"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							
							<xsl:variable name="shareholder_new_ic"><xsl:value-of select="new_ic" /></xsl:variable>
							<xsl:variable name="shareholder_old_ic"><xsl:value-of select="old_ic" /></xsl:variable>
							<xsl:variable name="shareholder_regno"><xsl:value-of select="reg_no" /></xsl:variable>
							<xsl:choose>
								<xsl:when test="$shareholder_type = 'U' ">
									<td width="25%" valign="top"><xsl:value-of select="name" /></td>
									<td width="39%" valign="top"><xsl:value-of select="address" /></td>
									<td width="25%" valign="top"><xsl:value-of select="reg_no" /></td>
								</xsl:when>
								<!-- COMPANY-->
								<xsl:when test="$shareholder_type = 'C' ">
									<td width="25%" valign="top">
									
										<xsl:variable name="link_name"><xsl:value-of select="name" /></xsl:variable>
										<xsl:variable name="type">C</xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$shareholder_regno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$shareholder_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$shareholder_old_ic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'C', $apos, ',', $apos, $shareholder_regno, $apos, ',', $apos, $shareholder_name, $apos, ',',  $apos, $shareholder_old_ic, $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="name" />
										</xsl:element>
										-->
									</td>
									<td width="39%" valign="top"><xsl:value-of select="address" /></td>
									<td width="25%" valign="top">
										<!-- <xsl:variable name="link_name"><xsl:value-of select="reg_no" /></xsl:variable> -->
										
										<xsl:variable name="link_name">
											<xsl:choose>
												<xsl:when test="new_reg_no">
													<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="reg_no" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										
										<xsl:variable name="type">C</xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$shareholder_regno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$shareholder_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$shareholder_old_ic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'C', $apos, ',', $apos, $shareholder_regno, $apos, ',', $apos, $shareholder_name, $apos, ',',  $apos, $shareholder_old_ic, $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="reg_no" />
										</xsl:element>
										-->
									</td>
								</xsl:when>
								<!-- INDIVIDUAL-->
								<xsl:otherwise>
									<xsl:variable name="icppno">
										<xsl:call-template name="getBothICPPNo">
											<xsl:with-param name="newic">
												<xsl:value-of select="$shareholder_new_ic"/>
											</xsl:with-param>
											<xsl:with-param name="oldic">
												<xsl:value-of select="$shareholder_old_ic"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>        
									<td width="25%" valign="top">
									
										<xsl:variable name="link_name"><xsl:value-of select="name" /></xsl:variable>
										<xsl:variable name="type">I</xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$shareholder_new_ic"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$shareholder_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$shareholder_old_ic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, $shareholder_new_ic, $apos, ',', $apos, $shareholder_name, $apos, ',',  $apos, $shareholder_old_ic, $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="name" />
										</xsl:element>
										-->
									</td>
									<td width="39%" valign="top"><xsl:value-of select="address" /></td>
									<td width="25%" valign="top">
										<xsl:variable name="link_name"><xsl:value-of select="$icppno" /></xsl:variable>
										<xsl:variable name="type">I</xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$shareholder_new_ic"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$shareholder_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$shareholder_old_ic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, $shareholder_new_ic, $apos, ',', $apos, $shareholder_name, $apos, ',',  $apos, $shareholder_old_ic, $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="$icppno" />
										</xsl:element>
										-->
									</td>
								</xsl:otherwise>
							</xsl:choose>	
							<td width="13%" valign="top" align="right"><xsl:value-of select="format-number(shareholding, '###,###,###.00')" /></td>
							<td width="10%" valign="top" align="right"><xsl:value-of select="share_percentage" /></td>
						</tr>
					</xsl:for-each>
					<tr>
						<td colspan="3" align="right" class="bold">Total</td>
						<td align="right" class="bold"><xsl:value-of select="format-number(sum(shareholder/item/shareholding), '###,###,###.00')" /></td>
						<td>&#160;</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="5">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END SHAREHOLDERS -->
	
	<!-- BEGIN COMPANY CHARGES -->
	<xsl:template match="company_charges">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="5" align="left">COMPANY CHARGES</th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(*)) > 0">
					<tr>
						<td width="15%" class="bold">Charge Number</td>
						<td width="15%" class="bold">Total of Charge</td>
						<td width="15%" class="bold">Date of Creation</td>
						<td width="40%" class="bold">Name of Chargee</td>
						<td width="15%" class="bold">Charge Status</td>
					</tr>
					<xsl:for-each select="company_charge">
						<tr>
							<td width="15%" valign="top"><xsl:value-of select="charge_no" /></td>
							<td width="15%" valign="top" align="right"><xsl:value-of select="amount" /></td>
							<td width="15%" valign="top" align="center"><xsl:value-of select="date_created" /></td>
							<td width="40%" valign="top"><xsl:value-of select="chargee_name" /></td>
							<td width="15%" valign="top" ><xsl:value-of select="charge_status" /></td>
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
	</xsl:template>
	<!-- END COMPANY CHARGES -->
	
	<!-- BEGIN ADDRESS(S) FOR BI/EBI -->
	<!-- BI business address -->	
	<xsl:template match="addresses">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left">ADDRESS(S) IN OUR DATABANK<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
				<th align="left">Date Captured</th>
			</tr>
			<xsl:choose>
				<xsl:when test="address">
					<xsl:for-each select="address">
						<tr>
							<td width="85%"><xsl:value-of select="address" /></td>
							<td><xsl:value-of select="date_capture" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	
	<!-- EBI business address -->
	<xsl:template name="business_info_addresses">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">ADDRESS(S) IN OUR DATABANK<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
			</tr>
			<xsl:if test="business_address">
				<tr>
					<td width="20%" class="bold">Business Address</td>
					<td width="80%"><xsl:value-of select="."/></td>
				</tr>
			</xsl:if>
			<xsl:if test="comm_address">
				<tr>
					<td width="20%" class="bold">Official Comm / Legal Process Address</td>
					<td width="80%"><xsl:value-of select="."/></td>
				</tr>
			</xsl:if>   
		</table>
	</xsl:template>
	<!-- END ADDRESS(S) FOR BI/EBI -->
	
	<!-- BEGIN PERSON COMPANY INTERESTS PCR -->
	<xsl:template match="person_company_interest_pcrs" name="person_company_interest_pcrs">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="9" align="left">B. SHAREHOLDING / DIRECTORSHIPS AND BUSINESS INTERESTS<br /></th>
			</tr>
			<tr>
				<td colspan="9" align="left"><em>Note: The following information relating to shareholding/ directorship interest by the Subject may not be current. There may be changes which may not be currently available in Experian databank.</em></td>
			</tr>
			<!-- DIFFERENT FROM WEBSERVICE -->
			<xsl:call-template name="person_company_interest_details" />
		</table>
		<xsl:call-template name="person_company_interest_extras" />
	</xsl:template>
  	<!-- END PERSON COMPANY INTERESTS PCR -->
	
	<!-- BEGIN PERSON COMPANY INTEREST -->
	<xsl:template match="person_company_interests" name="person_company_interests">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="9" align="left">SHAREHOLDING INTEREST<br /><span class="small">NOTE: The following information relating to shareholding/directorship interest by the Subject may not be current. There may be changes which may not be currently available in our databank</span></th>
			</tr>
			<xsl:call-template name="person_company_interest_details" />
		</table>
		<xsl:call-template name="person_company_interest_extras" />
	</xsl:template>
	<!-- END PERSON COMPANY INTEREST -->
	
	<!-- BEGIN PERSON COMPANY INTERESTS DETAILS -->
	<xsl:template name="person_company_interest_details">
			<xsl:choose>
				<xsl:when test="count(*) > 0">
					<tr>
						<td colspan="9" align="left" class="bold">INTEREST IN COMPANY / BUSINESS</td>
					</tr>
					<tr>
						<td class="bold" align="left">No</td>
						<td class="bold" align="left">Name</td>
						<td class="bold" align="left">Position</td>
						<td class="bold" align="center">Appointed</td>
						<td class="bold" align="center">Business Expiry Date</td>
						<td class="bold" align="right">Shareholding</td>
						<td class="bold" align="left">%</td>
						<td class="bold" align="left">Remark</td>
						<td class="bold" align="center">Last Updated by Experian</td>
					</tr>
					<xsl:for-each select="./*">
						<tr>
							<td align="left"><xsl:value-of select="position()" /></td>
							
							<xsl:choose>
								<xsl:when test="type = 'company'">
									<!-- <xsl:variable name="localno"><xsl:value-of select="local_no" /></xsl:variable> -->
									
									<xsl:variable name="localno">
										<xsl:choose>
											<xsl:when test="new_reg_no">
												<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="local_no" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									
									<xsl:variable name="company_name">
										<xsl:call-template name="escapeQuotes">
											<xsl:with-param name="txt">
												<xsl:value-of select="name"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
					
									<td align="left">
										<xsl:variable name="link_name"><xsl:value-of select="name" /> (<xsl:value-of select="$localno" />)</xsl:variable>
										<xsl:variable name="type">C</xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
			
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$localno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$company_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'C', $apos, ',', $apos, $localno, $apos, ',', $apos, $company_name, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="name" /> (<xsl:value-of select="local_no" />)
										</xsl:element>
										-->
										<xsl:if test="incorp_date">
											<br />
											Incorporation: <xsl:value-of select="incorp_date" />
										</xsl:if>
										<xsl:if test="paid_up_capital">
											<br />
											Paidup: <xsl:value-of select="paid_up_capital" />
										</xsl:if>
										<xsl:if test="nature_businesses/nature_business">
											<br />
											Activity: <xsl:value-of select="nature_businesses/nature_business" />
										</xsl:if>
									</td>
								</xsl:when>
								<xsl:when test="type = 'business'">
									<!-- <xsl:variable name="regno"><xsl:value-of select="reg_no" /></xsl:variable>  -->
									
									<xsl:variable name="regno">
										<xsl:choose>
											<xsl:when test="new_reg_no">
												<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="reg_no" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									 
									<xsl:variable name="business_name">
										<xsl:call-template name="escapeQuotes">
											<xsl:with-param name="txt">
												<xsl:value-of select="name"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<td align="left">
									
										<xsl:variable name="link_name"><xsl:value-of select="name" /> (<xsl:value-of select="$regno" />)</xsl:variable>
										<xsl:variable name="type">B</xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
					
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$regno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$business_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'B', $apos, ',', $apos, $regno, $apos, ',', $apos, $business_name, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="name" /> (<xsl:value-of select="reg_no" />)
										</xsl:element>
										-->
										<xsl:if test="commenced_date">
											<br />
											Incorporation: <xsl:value-of select="commenced_date" />
										</xsl:if>
										<xsl:if test="nature_businesses/nature_business">
											<br />
											Activity: <xsl:value-of select="nature_businesses/nature_business" />
										</xsl:if>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align="left"><xsl:value-of select="name" /></td>
								</xsl:otherwise>
							</xsl:choose>
							<td align="left"><xsl:value-of select="position" /></td>
							<td class="nowrap" align="center"><xsl:value-of select="app_date" /></td>
							<td class="nowrap" align="center"><xsl:value-of select="business_expiry" /></td>
							<td class="nowrap" align="right"><xsl:value-of select="shares" /></td>
							<td align="left"><xsl:value-of select="share_percentage" /></td>
							<td align="left">
								<xsl:value-of select="remark" />
								<xsl:value-of select="remark_bafia/remark" />
							</td>
							<td class="nowrap" align="center"><xsl:value-of select="last_updated_date" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="9" >NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	<!-- END PERSON COMPANY INTERESTS -->
	
	<!-- BEGIN PERSON COMPANY INTEREST EXTRAS -->
	<xsl:template name="person_company_interest_extras">
		<br />
		<xsl:if test="count(person_company_interest/remark_bafia) > 0">
			<table border="0" width="100%" class="full_border">
				<tr>
					<th colspan="9" align="left">BAFIA RELATED CASE</th>
				</tr>
				<tr>
					<td align="left"><b>Subject as the <xsl:value-of select="person_company_interest/remark_bafia/position" /> and <xsl:value-of select="person_company_interest/remark_bafia/name" /> were charged (<xsl:value-of select="person_company_interest/remark_bafia/remark" />) <xsl:value-of select="person_company_interest/remark_bafia/place" />&#160;<xsl:value-of select="person_company_interest/remark_bafia/court" /> for an offences under Banking and Financial Institutions Act (BAFIA) as at <xsl:value-of select="person_company_interest/remark_bafia/as_at" />.</b></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="count(person_company_interest) > 0">
			<p class="highlight"><u><strong>REMARK LEGEND</strong></u><br />
				Company Status as per SSM record: <span class="bold">WU</span> - Winding-Up, <span class="bold">DS</span> - Dissolved
			</p>
		</xsl:if>
	</xsl:template>
	<!-- END PERSON COMPANY INTEREST EXTRAS -->
	
	<!-- BEGIN BUSINESS DETAILS -->
	<xsl:template match="business_details">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">BUSINESS DETAILS<br /><span class="small">NOTE: The above business details are extracted from SSM. There may be changes to the corporate details of the Subject company which may not be available to the public.</span></th>
			</tr>
			<tr>
				<td width="20%" class="bold">Reg. no</td>
				<!-- <td width="80%"><xsl:value-of select="registration_no"/></td> -->
				
				<td width="80%">
					<xsl:choose>
						<xsl:when test="new_reg_no">
							<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="registration_no"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				
			</tr>
			<tr>
				<td width="20%" class="bold">Business name</td>
				<td width="80%"><xsl:value-of select="name"/></td>
			</tr>
			<xsl:if test="date_commenced">
				<tr>
					<td width="20%" class="bold">Date of Commencement</td>
					<td width="80%"><xsl:value-of select="date_commenced"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="date_registered">
				<tr>
					<td width="20%" class="bold">Date of Registration</td>
					<td width="80%"><xsl:value-of select="date_registered"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="date_of_amendment">
				<tr>
					<td width="20%" class="bold">Amendment Date</td>
					<td width="80%"><xsl:value-of select="date_of_amendment"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="date_license_expired">
				<tr>
					<td width="20%" class="bold">Date of Expiry</td>
					<td width="80%"><xsl:value-of select="date_license_expired"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="date_closing">
				<tr>
					<td width="20%" class="bold">Closing Date</td>
					<td width="80%"><xsl:value-of select="date_closing"/></td>
				</tr>
			</xsl:if>
			<xsl:for-each select="former_name/*">
				<tr>
					<xsl:choose>
						<xsl:when test="(position()) = 1">
							<td class="bold" width="20%">Former Name</td>
						</xsl:when>
						<xsl:otherwise>
							<td width="20%" class="bold">&#160;</td>
						</xsl:otherwise>
					</xsl:choose>
					<td width="80%"><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
			<xsl:if test="business_type">
				<tr>
					<td width="20%" class="bold">Business Constitution</td>
					<td width="80%"><xsl:value-of select="translate(business_type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="agreement">
				<tr>
					<td width="20%" class="bold">Agreement</td>
					<td width="80%"><xsl:value-of select="translate(agreement,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/></td>
				</tr>
			</xsl:if>
			<xsl:if test='date_of_agreement'>
				<tr>
					<td width="20%" class="bold">Date of Agreement</td>
					<td width="80%"><xsl:value-of select="date_of_agreement"/></td>
				</tr>
			</xsl:if>
			<xsl:for-each select="business_activity/*">
				<tr>
					<xsl:choose>
						<xsl:when test="(position()) = 1">
							<td class="bold" width="20%">Principal Activity</td>
						</xsl:when>
						<xsl:otherwise>
							<td width="20%" class="bold">&#160;</td>
						</xsl:otherwise>
					</xsl:choose>
					<td width="80%"><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
			<xsl:if test='business_address'>
				<tr>
					<td class="bold" width="20%">Business Address</td>
					<td width="80%"><xsl:value-of select="business_address"/></td>
				</tr>
			</xsl:if>
			<xsl:if test='comm_address'>
				<tr>
					<td class="bold" width="20%">Official Comm. /Legal Process Address</td>
					<td width="80%"><xsl:value-of select="comm_address"/></td>
				</tr>
			</xsl:if>
			<xsl:for-each select="branch/*">
				<tr>
					<td class="bold" width="20%">Branch Address</td>
					<td width="80%"><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
			<xsl:if test='remark/item'>
				<xsl:for-each select="remark/item">
					<tr>
						<td class="bold" width="20%">Remark</td>
						<td width="80%"><xsl:value-of select="."/></td>
					</tr>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test='last_updated'>
				<tr>
					<td class="bold" width="20%">Last Updated by Experian</td>
					<td width="80%"><xsl:value-of select="last_updated"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- END BUSINESS DETAILS -->
	
	<!-- BEGIN BUSINESS OWNER -->
	<xsl:template match="owner">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">OWNER(S)</th>
			</tr>
			<xsl:for-each select="item">
				<!-- build js link start -->
		
				<xsl:variable name="entity_name">
					<xsl:call-template name="escapeQuotes">
						<xsl:with-param name="txt">
							<xsl:value-of select="name"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="type">
					<xsl:choose>
						<xsl:when test="local_no">C</xsl:when>
						<xsl:otherwise>			
							<xsl:choose>
								<xsl:when test="ic_pp_no | new_ic">I</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:variable name="icppregno">
					<xsl:choose>
						<xsl:when test="local_no"><xsl:value-of select="local_no"/></xsl:when>
						<xsl:otherwise>			
							<xsl:choose>
								<xsl:when test="new_ic"><xsl:value-of select="new_ic"/></xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:variable name="oldic">
					<xsl:choose>
						<xsl:when test="local_no"><xsl:value-of select="local_no"/></xsl:when>
						<xsl:otherwise>			
							<xsl:choose>
								<xsl:when test="ic_pp_no"><xsl:value-of select="ic_pp_no"/></xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<!--
				<xsl:variable name="js_link">
					<xsl:choose>
						<xsl:when test="local_no">
							<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'C', $apos, ',', $apos, local_no, $apos, ',', $apos, $entity_name, $apos, ',',  $apos, '', $apos, ')')" />
						</xsl:when>
						<xsl:otherwise>			
							<xsl:choose>
								<xsl:when test="ic_pp_no | new_ic">
									<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'I', $apos, ',', $apos, new_ic, $apos, ',', $apos, $entity_name, $apos, ',',  $apos, ic_pp_no, $apos, ')')" />
								</xsl:when>
								<xsl:otherwise>#</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				-->
				<!-- build js link end -->
		
				<xsl:if test="name">
					<tr>
						<td width="20%" class="bold">Name</td>
						<td width="80%">
							<xsl:choose>
								<xsl:when test="ic_pp_no | new_ic">
									<xsl:variable name="link_name"><xsl:value-of select="name" /></xsl:variable>
									<xsl:variable name="director_oldic"></xsl:variable>
									<xsl:call-template name="buildQuickPurchaseLink">
										
										<xsl:with-param name="type">
											<xsl:value-of select="$type"/>
										</xsl:with-param>
										<xsl:with-param name="director_newic">
											<xsl:value-of select="$icppregno"/>
										</xsl:with-param>
										<xsl:with-param name="director_name">
											<xsl:value-of select="$entity_name"/>
										</xsl:with-param>
										<xsl:with-param name="director_oldic">
											<xsl:value-of select="$oldic"/>
										</xsl:with-param>
										<xsl:with-param name="link_name">
											<xsl:value-of select="$link_name"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name"/>
								
									<!--
									<xsl:element name="a">
										<xsl:attribute name="href">
											<xsl:value-of select="$js_link"/>
										</xsl:attribute>
										<xsl:value-of select="name"/>
									</xsl:element>
									-->
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="local_no">
					<tr>
						<td width="20%" class="bold">Local No</td>
						<td width="80%">
							<!-- <xsl:variable name="link_name"><xsl:value-of select="local_no" /></xsl:variable> -->
							
							<xsl:variable name="link_name">
								<xsl:choose>
									<xsl:when test="new_reg_no">
										<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="local_no"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:variable name="director_oldic"></xsl:variable>
							<xsl:call-template name="buildQuickPurchaseLink">
								
								<xsl:with-param name="type">
									<xsl:value-of select="$type"/>
								</xsl:with-param>
								<xsl:with-param name="director_newic">
									<xsl:value-of select="$icppregno"/>
								</xsl:with-param>
								<xsl:with-param name="director_name">
									<xsl:value-of select="$entity_name"/>
								</xsl:with-param>
								<xsl:with-param name="director_oldic">
									<xsl:value-of select="$oldic"/>
								</xsl:with-param>
								<xsl:with-param name="link_name">
									<xsl:value-of select="$link_name"/>
								</xsl:with-param>
							</xsl:call-template>
							<!--
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="$js_link"/>
								</xsl:attribute>
								<xsl:value-of select="local_no"/>
							</xsl:element>
							-->
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="ic_pp_no">
					<tr>
						<td width="20%" class="bold">IC / PP No.</td>
						<td width="80%">
						
							<xsl:variable name="link_name"><xsl:value-of select="ic_pp_no" /></xsl:variable>
							<xsl:variable name="director_oldic"></xsl:variable>
							<xsl:call-template name="buildQuickPurchaseLink">
								
								<xsl:with-param name="type">
									<xsl:value-of select="$type"/>
								</xsl:with-param>
								<xsl:with-param name="director_newic">
									<xsl:value-of select="$icppregno"/>
								</xsl:with-param>
								<xsl:with-param name="director_name">
									<xsl:value-of select="$entity_name"/>
								</xsl:with-param>
								<xsl:with-param name="director_oldic">
									<xsl:value-of select="$oldic"/>
								</xsl:with-param>
								<xsl:with-param name="link_name">
									<xsl:value-of select="$link_name"/>
								</xsl:with-param>
							</xsl:call-template>
							<!--
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="$js_link"/>
								</xsl:attribute>
								<xsl:value-of select="ic_pp_no"/>
							</xsl:element>
							-->
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="new_ic">
					<tr>
						<td width="20%" class="bold">New IC No.</td>
						<td width="80%">
							<xsl:variable name="link_name"><xsl:value-of select="new_ic" /></xsl:variable>
							<xsl:variable name="director_oldic"></xsl:variable>
							<xsl:call-template name="buildQuickPurchaseLink">
								
								<xsl:with-param name="type">
									<xsl:value-of select="$type"/>
								</xsl:with-param>
								<xsl:with-param name="director_newic">
									<xsl:value-of select="$icppregno"/>
								</xsl:with-param>
								<xsl:with-param name="director_name">
									<xsl:value-of select="$entity_name"/>
								</xsl:with-param>
								<xsl:with-param name="director_oldic">
									<xsl:value-of select="$oldic"/>
								</xsl:with-param>
								<xsl:with-param name="link_name">
									<xsl:value-of select="$link_name"/>
								</xsl:with-param>
							</xsl:call-template>
							<!--
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="$js_link"/>
								</xsl:attribute>
								<xsl:value-of select="new_ic"/>
							</xsl:element>
							-->
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="sex">
					<tr>
						<td width="20%" class="bold">Gender</td>
						<td width="80%"><xsl:value-of select="sex"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="address">
					<tr>
						<td width="20%" class="bold">Address</td>
						<td width="80%"><xsl:value-of select="address"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="birthdate">
					<tr>
						<td width="20%" class="bold">Date Of Birth / Inc.</td>
						<td width="80%"><xsl:value-of select="birthdate"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="nationality">
					<tr>
						<td width="20%" class="bold">Nationality</td>
						<td width="80%"><xsl:value-of select="nationality"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position">
					<tr>
						<td width="20%" class="bold">Position Held</td>
						<td width="80%"><xsl:value-of select="position"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="estate_of">
					<tr>
						<td width="20%" class="bold">Estate Of</td>
						<td width="80%"><xsl:value-of select="estate_of"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="date_entered">
					<tr>
						<td width="20%" class="bold">Entry Date</td>
						<td width="80%"><xsl:value-of select="date_entered"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="date_withdrawn">
					<tr>
						<td width="20%" class="bold">Withdrawn Date</td>
						<td width="80%"><xsl:value-of select="date_withdrawn"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="remark">
					<tr>
						<td width="20%" class="bold">Remark</td>
						<td width="80%"><xsl:value-of select="remark"/></td>
					</tr>
				</xsl:if>
				
				<xsl:if test="position() != last()">
					<tr>
						<td colspan="2">&#160;</td>
					</tr>
				</xsl:if>
      </xsl:for-each>
		</table>
	</xsl:template>
	<!-- END BUSINESS OWNER -->
	
	<!-- BEGIN PERSON CURRENT INTERESTS -->
	<xsl:template name="litigation_count">
		<xsl:if test="litigation_count">
			<br />
			<table border="0" width="98%" align="center"  class="nostyle normal-text">
				<tr>
					<td align="left" class="background_DAEEF3 bold show_border" width="40%">LITIGATION COUNT</td>
					<td align="center" class="background_DAEEF3 bold show_top_border" width="30%">&#8804; 2 Years</td>
					<td align="center" class="background_DAEEF3 bold show_top_border" width="30%">&#62; 2 Years</td>
				</tr>
				<tr>
					<td align="left" class="bold show_border" width="40%">Legal Suits</td>
					<td align="center" class="bold show_top_border" width="30%">
						<xsl:choose>
							<xsl:when test="litigation_count/legal_suit_count/within_2_year">
								<xsl:value-of select="litigation_count/legal_suit_count/within_2_year" />
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="center" class="bold show_top_border" width="30%">
						<xsl:choose>
							<xsl:when test="litigation_count/legal_suit_count/more_than_2_year">
								<xsl:value-of select="litigation_count/legal_suit_count/more_than_2_year" />
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td align="left" class="bold show_border" width="40%">Winding Up Petitions / Order / Struck Off</td>
					<td align="center" class="bold show_top_border" width="30%">
						<xsl:choose>
							<xsl:when test="litigation_count/winding_up_count/within_2_year">
								<xsl:value-of select="litigation_count/winding_up_count/within_2_year" />
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="center" class="bold show_top_border" width="30%">
						<xsl:choose>
							<xsl:when test="litigation_count/winding_up_count/more_than_2_year">
								<xsl:value-of select="litigation_count/winding_up_count/more_than_2_year" />
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="trade_bureau_count">
		<xsl:if test="trade_payment_info_count">
			<br />
			<table border="0" width="98%" align="center" class="nostyle normal-text">
				<tr>
					<td align="left" class="bold show_border" width="40%">TRADE PAYMENT INFO</td>
					<td align="center" class="bold show_top_border show_bottom_border" width="30%">
						<xsl:choose>
							<xsl:when test="trade_payment_info_count/trade_payment_info/within_2_year">
								<xsl:value-of select="trade_payment_info_count/trade_payment_info/within_2_year" />
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="center" class="bold show_top_border show_bottom_border" width="30%">
						<xsl:choose>
							<xsl:when test="trade_payment_info_count/trade_payment_info/more_than_2_year">
								<xsl:value-of select="trade_payment_info_count/trade_payment_info/more_than_2_year" />
							</xsl:when>
							<xsl:otherwise>
								0
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="person_current_interests" match="person_current_interests">
		<br />
		<table border="0" width="100%" class="nobottom">
			<tr>
				<th align="left" class="show_border">CURRENT COMPANIES/BUSINESSES INFORMATION<br /><span class="small">NOTE: The following information relating to shareholding/directorship interest by the Subject is as available from our databank.</span></th>
			</tr>
			<tr>
				<td class="show_border">
					<table border="0" class="woborder" width="100%">
						<tr>
							<td class="bold normal-text">INTEREST IN COMPANY/BUSINESS<br /><span class="small">(A maximum of 20 detailed subject)</span></td>
							<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(details/detail)" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<xsl:for-each select="details/detail">
				<tr>
					
					<xsl:variable name="type"><xsl:value-of select="type" /></xsl:variable>
					<xsl:variable name="reg_no"><xsl:value-of select="reg_no" /></xsl:variable>
					<xsl:variable name="name">
						<xsl:call-template name="escapeQuotes">
							<xsl:with-param name="txt">
								<xsl:value-of select="name"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<!--
					<xsl:variable name="js_link">
						<xsl:value-of select="concat('javascript:purchase_order(', $apos, $type, $apos, ',', $apos, $reg_no, $apos, ',', $apos, $name, $apos, ',',  $apos, '', $apos, ')')" />
					</xsl:variable>
					-->
					<xsl:variable name="js_link_bi_ci">
						<!-- <xsl:value-of select="concat('javascript:purchase_cibi_order(', $apos, $type, $apos, ',', $apos, $reg_no, $apos, ',', $apos, $name, $apos, ',',  $apos, '', $apos, ')')" /> -->
						<xsl:call-template name="buildQuickPurchaseBiCiLink">
							
							<xsl:with-param name="type">
								<xsl:value-of select="$type"/>
							</xsl:with-param>
							<xsl:with-param name="reg_no">
								<xsl:value-of select="$reg_no"/>
							</xsl:with-param>
							<xsl:with-param name="name">
								<xsl:value-of select="$name"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					
					<td class="show_border">
						<p class="no-margin">
							<xsl:value-of select="position()" />.&#160;
								
								<xsl:variable name="link_name"><xsl:value-of select="name" />&#160;(<xsl:value-of select="display_no" />)</xsl:variable>
								<xsl:call-template name="buildQuickPurchaseLink">
									
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$reg_no"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
										
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
							<!--	
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="$js_link" />
								</xsl:attribute>
								<xsl:value-of select="name" />&#160;(<xsl:value-of select="display_no" />)
							</xsl:element>
							-->
						</p>
						<xsl:choose>
							<xsl:when test="type = 'C'">
								<xsl:variable name="total_share">
									<xsl:choose>
										<xsl:when test="designation/shares = 0">
											<xsl:value-of select="'0.00'" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="designation/shares" />  
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<br />
								<table width="98%" align="center" class="nobottom normal-text">
									<tr>
										<td width="40%" class="bold">Position</td>
										<td width="60%"><xsl:value-of select="designation/position" /></td>
									</tr>
									<tr>
										<td width="40%" class="bold">Appointment Date</td>
										<xsl:choose>
											<xsl:when test="string-length(designation/appointment_date)">
												<td width="60%"><xsl:value-of select="designation/appointment_date" /></td>
											</xsl:when>
											<xsl:otherwise>
												<td width="60%">N/A</td>
											</xsl:otherwise>
										</xsl:choose>
										
									</tr>
									<tr>
										<td width="40%" class="bold">Shareholding &amp; % Of Shares</td>
										<td width="60%"><xsl:value-of select="$total_share" />
											<xsl:if test="designation/share_percentage">
												(<xsl:value-of select="designation/share_percentage" />%)
											</xsl:if>
										</td>
									</tr>
								</table>
								<xsl:if test="count(summary/*)">
									<xsl:variable name="paid_up_capital">
										<xsl:choose>
											<xsl:when test="summary/paid_up_capital = 0">
												<xsl:value-of select="'0.00'" />
											</xsl:when>
											<xsl:when test="summary/paid_up_capital > 0">
												<xsl:value-of select="format-number(summary/paid_up_capital, '###,###,###.00')" />  
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="'0.00'" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<br />
									<table width="98%" align="center"  class="nobottom normal-text">
										<tr>
											<td colspan="2" class="background_DAEEF3 show_border bold">SUMMARY INFO OF <xsl:value-of select="name"/></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Type</td>
											<td width="60%"><xsl:value-of select="summary/type" /></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Status</td>
											<td width="60%"><xsl:value-of select="summary/status" /></td>
										</tr>
										<xsl:for-each select="summary/nature_businesses">
											<tr>
												<xsl:choose>
													<xsl:when test="position() = 1">
														<td width="40%" class="bold">Nature of Business</td>
													</xsl:when>
													<xsl:otherwise>
														<td width="40%" class="bold">&#160;</td>
													</xsl:otherwise>
												</xsl:choose>
												<td width="60%"><xsl:value-of select="nature_business" /></td>
											</tr>
										</xsl:for-each>
										<tr>
											<td width="40%" class="bold">Incorporation Date</td>
											<td width="60%"><xsl:value-of select="summary/incorporation_date" /></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Paid Up Capital</td>
											<td width="60%"><xsl:value-of select="$paid_up_capital" /></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Last Financials Filed</td>
											<td width="60%">
												<xsl:choose>
													<xsl:when test="summary/last_financial_filed">
														<xsl:value-of select="summary/last_financial_filed" />
													</xsl:when>
													<xsl:otherwise>
														N/A
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td width="40%" class="bold">Profit Making</td>
											<td width="60%">
												<xsl:choose>
													<xsl:when test="summary/profit_making">
														<xsl:value-of select="summary/profit_making" />
													</xsl:when>
													<xsl:otherwise>
														N/A
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td width="40%" class="bold">Business Address</td>
											<td width="60%"><xsl:value-of select="summary/business_address" /></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Active Company Charges Count</td>
											<td width="60%">
												<xsl:choose>
													<xsl:when test="summary/active_company_charge_count">
														<xsl:value-of select="summary/active_company_charge_count" />
													</xsl:when>
													<xsl:otherwise>
														0
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td width="40%" class="bold">Subsidiary / Associates Count</td>
											<td width="60%">
												<xsl:choose>
													<xsl:when test="summary/subsidiary_count">
														<xsl:value-of select="summary/subsidiary_count" />
													</xsl:when>
													<xsl:otherwise>
														0
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</table>
									<p class="no-margin">&#160;&#160;&#160;Updated as at <xsl:value-of select="summary/last_ramci_update" /></p>
									<xsl:call-template name="litigation_count" />
									<xsl:call-template name="trade_bureau_count" />
								</xsl:if>											
							</xsl:when>
							<xsl:when test="type = 'B'">
								<br />
								<table width="98%" align="center"  class="nobottom normal-text">
									<tr>
										<td width="40%" class="bold">Position</td>
										<td width="60%"><xsl:value-of select="designation/position" /></td>
									</tr>
									<tr>
										<td width="40%" class="bold">Entry Date</td>
										<td width="60%"><xsl:value-of select="designation/entry_date" /></td>
									</tr>
									<tr>
										<td width="40%" class="bold">Shareholding &amp; % Of Shares</td>
										<td width="60%">-</td>
									</tr>
								</table>
								<xsl:if test="count(summary/*)">
									<br />
									<table width="98%" align="center"  class="nobottom normal-text">
										<tr>
											<td colspan="2" class="background_DAEEF3 show_border bold">SUMMARY INFO OF <xsl:value-of select="name"/></td>
										</tr>
										<tr>
											<td width="40%" class="bold">No of Owners/Partners</td>
											<td width="60%"><xsl:value-of select="summary/no_owner" /></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Type</td>
											<td width="60%"><xsl:value-of select="summary/type" /></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Status</td>
											<td width="60%"><xsl:value-of select="summary/status" /></td>
										</tr>
										<xsl:for-each select="summary/nature_businesses">
											<tr>
												<xsl:choose>
													<xsl:when test="position() = 1">
														<td width="40%" class="bold">Nature of Business</td>
													</xsl:when>
													<xsl:otherwise>
														<td width="40%" class="bold">&#160;</td>
													</xsl:otherwise>
												</xsl:choose>
												<td width="60%"><xsl:value-of select="nature_business" /></td>
											</tr>
										</xsl:for-each>
										<tr>
											<td width="40%" class="bold">Date of Commencement</td>
											<td width="60%"><xsl:value-of select="summary/date_commenced" /></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Address</td>
											<td width="60%"><xsl:value-of select="summary/business_address" /></td>
										</tr>
										<tr>
											<td width="40%" class="bold">Date of Expiry</td>
											<td width="60%"><xsl:value-of select="summary/date_license_expired" /></td>
										</tr>
									</table>
									<p class="no-margin">&#160;&#160;&#160;Updated as at <xsl:value-of select="summary/last_ramci_update" /></p>
									<xsl:call-template name="litigation_count" />
									<xsl:call-template name="trade_bureau_count" />
								</xsl:if>
							</xsl:when>
						</xsl:choose>
						<xsl:if test="type = 'B' and litigation_count and trade_payment_info_count">
							<p class="red bold padding5">For information of other owners/partners + available SSM + litigation (legal action &amp; winding-up petition) + credit reference in Experian&#39;s databank, <a href="{$js_link_bi_ci}">Click Here</a> to order our BI or EBI Report.</p>
						</xsl:if>
						<xsl:if test="type = 'C' and litigation_count and trade_payment_info_count">
							<p class="red bold padding5">For information of other shareholders + available SSM + litigation (legal action &amp; winding-up petition) + credit reference in Experian&#39;s databank, <a href="{$js_link_bi_ci}">Click Here</a> to order our CI or ECI Report.</p>
						</xsl:if>
					</td>
				</tr>
			</xsl:for-each>
			<xsl:if test="count(details/detail) = 0">
				<tr>
					<td class="show_border">NO INFORMATION AVAILABLE</td>
				</tr>
			</xsl:if>
		</table>
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="9" align="left">REMAINING LISTING OF CURRENT COMPANIES/BUSINESSES<br /><span class="small">Note: The following information relating to shareholding/directorship interest by the Subject is as available from our databank.</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(summaries/summary) > 0">
					<tr>
						<td class="bold" align="left">No</td>
						<td class="bold" align="left">Name</td>
						<td class="bold" align="left">Position</td>
						<td class="bold" align="center">App Date</td>
						<td class="bold" align="center">Business Expiry Date</td>
						<td class="bold" align="right">Shareholding</td>
						<td class="bold" align="left">%</td>
						<td class="bold" align="left">Remark</td>
						<td class="bold" align="center">Last Updated by Experian</td>
					</tr>
					<xsl:for-each select="summaries/summary">
						<tr>
							<td align="left"><xsl:value-of select="position()" /></td>
							
							<xsl:choose>
								<xsl:when test="type = 'company'">
									<xsl:variable name="localno"><xsl:value-of select="local_no" /></xsl:variable>
									<xsl:variable name="company_name">
										<xsl:call-template name="escapeQuotes">
											<xsl:with-param name="txt">
												<xsl:value-of select="name"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
					
									<td align="left">
										<xsl:variable name="link_name"><xsl:value-of select="name" /> (<xsl:value-of select="local_no" />)</xsl:variable>
										<xsl:variable name="type">C</xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$localno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$company_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'C', $apos, ',', $apos, $localno, $apos, ',', $apos, $company_name, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="name" /> (<xsl:value-of select="local_no" />)
										</xsl:element>
										-->
									</td>
								</xsl:when>
								<xsl:when test="type = 'business'">
									<xsl:variable name="regno"><xsl:value-of select="reg_no" /></xsl:variable>
									<xsl:variable name="business_name">
										<xsl:call-template name="escapeQuotes">
											<xsl:with-param name="txt">
												<xsl:value-of select="name"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<td align="left">
										<xsl:variable name="link_name"><xsl:value-of select="name" /> (<xsl:value-of select="reg_no" />)</xsl:variable>
										<xsl:variable name="type">B</xsl:variable>
										<xsl:variable name="director_oldic"></xsl:variable>
										<xsl:call-template name="buildQuickPurchaseLink">
											
											<xsl:with-param name="type">
												<xsl:value-of select="$type"/>
											</xsl:with-param>
											<xsl:with-param name="director_newic">
												<xsl:value-of select="$regno"/>
											</xsl:with-param>
											<xsl:with-param name="director_name">
												<xsl:value-of select="$business_name"/>
											</xsl:with-param>
											<xsl:with-param name="director_oldic">
												<xsl:value-of select="$director_oldic"/>
											</xsl:with-param>
											<xsl:with-param name="link_name">
												<xsl:value-of select="$link_name"/>
											</xsl:with-param>
										</xsl:call-template>
										<!--
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('javascript:purchase_order(', $apos, 'B', $apos, ',', $apos, $regno, $apos, ',', $apos, $business_name, $apos, ',',  $apos, '', $apos, ')')" />
											</xsl:attribute>
											<xsl:value-of select="name" /> (<xsl:value-of select="reg_no" />)
										</xsl:element>
										-->
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align="left"><xsl:value-of select="name" /></td>
								</xsl:otherwise>
							</xsl:choose>
							<td align="left"><xsl:value-of select="position" /></td>
							<td class="nowrap" align="center"><xsl:value-of select="app_date" /></td>
							<td class="nowrap" align="center"><xsl:value-of select="business_expiry" /></td>
							<td class="nowrap" align="right"><xsl:value-of select="shares" /></td>
							<td align="left"><xsl:value-of select="share_percentage" /></td>
							<td align="left"><xsl:value-of select="remark" /></td>
							<td class="nowrap" align="center"><xsl:value-of select="last_updated_date" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="9" class="show_border">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<xsl:if test="count(summaries/summary) > 0">
			<p class="highlight"><u><strong>REMARK LEGEND</strong></u><br />
				<p>Company Status as per SSM record: <span class="bold">WU</span> - Winding-Up, <span class="bold">DS</span> - Dissolved</p>
			</p>
		</xsl:if>
		
	</xsl:template>
	<!-- END PERSON CURRENT INTERESTS -->
	
	<!-- START PERSON PREVIOUS INTERESTS -->
	<xsl:template match="previous_company_interests" name="previous_company_interests">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="7" align="left">PREVIOUS KNOWN COMPANIES / BUSINESSES<br /><span class="small">Note: The following information relating to shareholding/directorship interest by the Subject is as available from our databank.</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(previous_company_interest) > 0">
					<tr>
						<td width="3%" class="bold">No</td>
						<td width="15%" class="bold">Registration No</td>
						<td width="40%" class="bold">Name</td>
						<td width="5%" class="bold nowrap">Incorporated Date</td>
						<td width="20%" class="bold">Status</td>
						<td width="12%" class="bold">Position</td>
						<td width="5%" class="bold nowrap">Cessation Date</td>
					</tr>
					<xsl:for-each select="previous_company_interest">
						
						<xsl:variable name="type"><xsl:value-of select="type" /></xsl:variable>
						<!-- <xsl:variable name="reg_no"><xsl:value-of select="display_id" /></xsl:variable> -->
						
						<xsl:variable name="reg_no">
							<xsl:choose>
								<xsl:when test="new_reg_no">
									<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="display_id" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						
						
						<xsl:variable name="name">
							<xsl:call-template name="escapeQuotes">
								<xsl:with-param name="txt">
									<xsl:value-of select="name"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<!--
						<xsl:variable name="js_link">
							<xsl:value-of select="concat('javascript:purchase_order(', $apos, $type, $apos, ',', $apos, $reg_no, $apos, ',', $apos, $name, $apos, ',',  $apos, '', $apos, ')')" />
						</xsl:variable>
						-->
						<tr>
							<td><xsl:value-of select="position()"/></td>
							<td>
								<xsl:variable name="link_name"><xsl:value-of select="$reg_no" /></xsl:variable>
								<xsl:call-template name="buildQuickPurchaseLink">
									
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$reg_no"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
									
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
								<!--		
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="$js_link" />
									</xsl:attribute>
									<xsl:value-of select="reg_no" />
								</xsl:element>
								-->
							</td>
							<td>
								<xsl:variable name="link_name"><xsl:value-of select="name" /></xsl:variable>
								<xsl:call-template name="buildQuickPurchaseLink">
									
									<xsl:with-param name="type">
										<xsl:value-of select="$type"/>
									</xsl:with-param>
									<xsl:with-param name="director_newic">
										<xsl:value-of select="$reg_no"/>
									</xsl:with-param>
									<xsl:with-param name="director_name">
										<xsl:value-of select="$name"/>
									</xsl:with-param>
									<xsl:with-param name="director_oldic">
									
									</xsl:with-param>
									<xsl:with-param name="link_name">
										<xsl:value-of select="$link_name"/>
									</xsl:with-param>
								</xsl:call-template>
								<!--
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="$js_link" />
									</xsl:attribute>
									<xsl:value-of select="name" />
								</xsl:element>
								-->
							</td>
							<td><xsl:value-of select="incorporated_date" /></td>
							<td><xsl:value-of select="status" /></td>
							<td><xsl:value-of select="position" /></td>
							<td class="nowrap">
								<xsl:choose>
									<xsl:when test="cessation_date and string-length(cessation_date) > 0">
										<xsl:value-of select="cessation_date" />
									</xsl:when>
									<xsl:otherwise>
										N/A
									</xsl:otherwise>
								</xsl:choose>
								
							</td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="6">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END PERSON PREVIOUS INTERESTS -->

	<!-- BEGIN NEW TRADE BUREAU SECTION C -->
	<xsl:template name="trade_bureau_entity_item">
		<xsl:variable name="icppno">
			<xsl:choose>
				<xsl:when test="local_no">
					<!-- <xsl:value-of select="local_no"/> -->
					<xsl:choose>
						<xsl:when test="new_reg_no">
							<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="local_no"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="reg_no">
					<!-- <xsl:value-of select="reg_no"/> -->
					<xsl:choose>
						<xsl:when test="new_reg_no">
							<xsl:value-of select= "concat ( new_reg_no, ' (' , old_reg_no, ') ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="reg_no"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="getBothICPPNo">
						<xsl:with-param name="newic">
							<xsl:value-of select="new_ic"/>
						</xsl:with-param>
						<xsl:with-param name="oldic">
							<xsl:value-of select="old_ic"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr>
			<td class="bold" width="20%" valign="top">Subject Name</td>
			<td width="30%" valign="top"><xsl:value-of select="subject"/></td>
			<td width="20%" class="bold" valign="top">Subject ID</td>
			<td width="30%" valign="top"><xsl:value-of select="$icppno"/></td>
		</tr>
		<tr>
			<td class="bold" valign="top">Creditor&#39;s Name</td>
			<td valign="top"><xsl:value-of select="creditor_name"/></td>
			<td class="bold" valign="top">Amount Due</td>
			<td valign="top"><xsl:value-of select="amount"/> 
				<xsl:if test="as_at_date">
				(AS AT <xsl:value-of select="as_at_date"/>)
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="bold" valign="top">Creditor&#39;s Contact</td>
			<td valign="top"><xsl:value-of select="creditor_telno"/></td>
			<td class="bold" valign="top">Aging Days</td>
			<td valign="top">
				<xsl:if test="payment_aging">
					<xsl:value-of select="payment_aging"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="bold" valign="top">Ref No</td>
			<td valign="top"><xsl:value-of select="ref_no"/></td>
			<td class="bold" valign="top">Debt Type</td>
			<td valign="top"><xsl:value-of select="debt_type"/></td>
		</tr>
		<tr>
			<td class="bold" valign="top">Industry</td>
			<td valign="top"><xsl:value-of select="industry"/></td>
			<td class="bold" valign="top">LOD/NOD Date (if any)</td>
			<td valign="top">
				<xsl:if test="status">
					<xsl:value-of select="status"/>&#160;
				</xsl:if>
				
				<xsl:if test="status_date">
					<xsl:choose>
						<xsl:when test="status">
							(<xsl:value-of select="status_date"/>)
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="status_date"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="bold" valign="top">Solicitor&#39;s Name</td>
			<td valign="top"><xsl:value-of select="solicitor_name"/></td>
			<td class="bold" valign="top">Solicitor&#39;s Contact</td>
			<td valign="top"><xsl:value-of select="solicitor_telno"/></td>
		</tr>
		<tr>
			<td class="bold" valign="top">Guarantor</td>
			<td valign="top">
			  <xsl:choose>
				<xsl:when test="count(guarantor_details) > 0">
				  <xsl:for-each select="guarantor_details/guarantor_detail">
					  <xsl:value-of select="guarantor_name"/> (<xsl:value-of select="guarantor_ic"/>)
					  <xsl:if test="position() != last()">
						<br />
					  </xsl:if>
				  </xsl:for-each>
				</xsl:when>
			  <xsl:otherwise>
				NIL
			  </xsl:otherwise>
			  </xsl:choose>
			</td>
			<td class="bold" valign="top">Remark</td>
			<td valign="top"><xsl:value-of select="remark"/></td>
		</tr>
		<xsl:if test="string-length(registration_no) &gt; 0 or string-length(model) &gt; 0 or string-length(chassis_no) &gt; 0 or string-length(engine_no) &gt; 0">
			<tr>
				<td class="bold" valign="top">For Motor Industry</td>
				<td valign="top">&#160;</td>
				<td class="bold" valign="top">&#160;</td>
				<td valign="top">&#160;</td>
			</tr>
			<tr>
				<td class="bold" valign="top">Registration No</td>
				<td valign="top"><xsl:value-of select="registration_no"/></td>
				<td class="bold" valign="top">Model</td>
				<td valign="top"><xsl:value-of select="model"/></td>
			</tr>
			<tr>
				<td class="bold" valign="top">Chasis No</td>
				<td valign="top"><xsl:value-of select="chassis_no"/></td>
				<td class="bold" valign="top">Engine No</td>
				<td valign="top"><xsl:value-of select="engine_no"/></td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- BEGIN TRADE BUREAU ENTITY DETAILS PCR -->
	<xsl:template match="trade_bureau_entity_detail_pcrs" name="trade_bureau_entity_detail_pcrs">
		<br />
		<table border="0" width="100%" class="nobottom">
			<tr>
				<th colspan="4" align="left" class="">E. TRADE BUREAU / CREDIT REFERENCE<br /></th>
			</tr>
			<tr>
				<td colspan="4"><em>Note: The following information is provided by third party sources for your reference. Searched Subject will also be listed if he/she is in guarantor capacity. Experian does not guarantee the accuracy of the information. Please check with the creditors for confirmation as alledged debts may have been settled since recorded. Users should NOT treat the information as conclusive factor for evaluation purpose.</em></td>
			</tr>
			<xsl:call-template name="trade_bureau_entity_details_details" />
		</table>
		<xsl:call-template name="trade_bureau_entity_details_details_extras" />
	</xsl:template>
	<!-- BEGIN TRADE BUREAU ENTITY DETAILS PCR -->
	
	<!-- BEGIN TRADE BUREAU ENTITY DETAILS -->
	<xsl:template match="trade_bureau_entity_details" name="trade_bureau_entity_details">
		<br />
		<table border="0" width="100%" class="nobottom">
			<tr>
				<th colspan="4" align="left" class="">TRADE BUREAU / CREDIT REFERENCE<br /><span class="small">NOTE: The following information is provided by third party sources for your reference. Searched Subject will also be listed if he/she is in Guarantor capacity. Experian does not guarantee the accuracy of the information. Please check with the Creditors for confirmation as alleged debts may have been settled since recorded. Users should NOT treat the information as conclusive factor for evaluation purpose.</span></th>
			</tr>
			<xsl:call-template name="trade_bureau_entity_details_details" />
		</table>
		<xsl:call-template name="trade_bureau_entity_details_details_extras" />
	</xsl:template>
	<!-- END TRADE BUREAU ENTITY DETAILS -->
	
	<!-- BEGIN TRADE BUREAU ENTITY DETAILS DETAILS-->
	<xsl:template name="trade_bureau_entity_details_details">
			<xsl:choose>
				<xsl:when test="count(*) > 0">
					<xsl:for-each select="./*">
						<xsl:call-template name="trade_bureau_entity_item" />
						<xsl:if test="position() != last()">
							<tr>
								<td colspan="4" class="show_border">&#160;</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
				<tr>
					<td colspan="4" class="show_border">NO INFORMATION AVAILABLE.</td>
				</tr>
				</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	<!-- END TRADE BUREAU ENTITY DETAILS DETAILS-->
	
	<!-- BEGIN TRADE BUREAU ENTITY DETAILS DETAILS EXTRAS -->
	<xsl:template name="trade_bureau_entity_details_details_extras">
		<xsl:if test="count(*) > 0">
			<table border="0" width="70%" class="woborder highlight margin10">
				<tr>
					<td width="20%" class="bold">LEGEND:</td>
					<td class="bold" align="right">LOD</td>
					<td>- Letter of Demand issued by a Lawyer (Legal Firm)</td>
				</tr>
				<tr>
					<td colspan="2" class="bold" align="right">NOD</td>
					<td>- Notice of Demand issued by internally (Company)</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- END TRADE BUREAU ENTITY DETAILS DETAILS EXTRAS -->	

	<!-- END NEW TRADE BUREAU SECTION C -->
	
	<!-- BEGIN TRADE REFERENCE -->
	<xsl:template match="trade_reference_details" name="trade_reference_details">
		<br />
		<table border="0" width="100%" class="nobottom">
			<tr>
				<th align="left" class="show_border">TRADE BUREAU / OTHER INFORMATION<br /><span class="small">NOTE: The following information is provided by third party sources for your reference. Experian does not guarantee the accuracy of the information. Please check with the Creditors for confirmation. Users should NOT treat the information as conclusive factor for evaluation purpose.</span></th>
			</tr>
			<tr>
				<td align="left" class="show_border background_DAEEF3"><span class="bold">SECTION A: TRADE REFERENCE</span><br /><span class="small">NOTE: The following information is provided by third party sources for your reference. Experian does not guarantee the accuracy of the information. Please check with the Creditors for confirmation. Users should NOT treat the information as conclusive factor for evaluation purpose.</span></td>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(trade_reference_detail)) > 0">
					<tr>
						<td class="bold">Account Payment Information</td>
					</tr>
					<tr>
						<td>
							<table width="100%" class="full_border">
								<tr>
									<td class="bold">No</td>
									<td class="bold">Creditor</td>
									<td class="bold">Ref No</td>
									<td class="bold">Debt Type</td>
									<td class="bold">Start Date</td>
									<td class="bold">Credit Limit</td>
									<td class="bold">Credit Term</td>
									<td class="bold">As At Date</td>
									<td class="bold">Amount Due</td>
									<td class="bold">Payment Aging</td>
								</tr>
								<xsl:for-each select="trade_reference_detail">
								<tr style='text-align:center;'>
									<td ><xsl:value-of select="position()"/></td>
									<td ><xsl:value-of select="creditor_name"/></td>
									<td ><xsl:value-of select="ref_no"/></td>
									<td ><xsl:value-of select="debt_type"/></td>
									<td ><xsl:value-of select="start_date"/></td>
									<td ><xsl:value-of select="credit_limit"/></td>
									<td ><xsl:value-of select="credit_term"/></td>
									<td ><xsl:value-of select="as_at_date"/></td>
									<td ><xsl:value-of select="amount"/></td>
									<td ><xsl:value-of select="payment_aging"/></td>
								</tr>          
							  </xsl:for-each>
							</table>
						</td>
					</tr>
					<tr>
						<td class="bold">Reference Check</td>
					</tr>
					<tr>
						<td>
						  <table width="100%" class="full_border">
							<tr>
							  <td class="bold">No</td>
							  <td class="bold">Creditor</td>
							  <td class="bold">Ref No</td>
							  <td class="bold">Creditor&#39;s Tel</td>
							  <td class="bold">Reference Remark</td>
							</tr>
							<xsl:for-each select="trade_reference_detail">  
							  <tr style='text-align:center;'>
								<td><xsl:value-of select="position()"/></td>
								<td><xsl:value-of select="creditor_name"/></td>
								<td><xsl:value-of select="ref_no"/></td>
								<td><xsl:value-of select="creditor_telno"/></td>
								<td><xsl:value-of select="remark"/></td>
							  </tr>
							</xsl:for-each>
						  </table>
						</td>
					</tr>
					<xsl:if test="count(trade_reference_detail/guarantor_details/*) > 0">
						<tr>
							<td class="bold">Guarantor Details</td>
						</tr>
						<table width="100%" class="full_border">
							<tr>
								<td class="bold">No</td>
								<td class="bold">IC/PP No.</td>
								<td class="bold">Name</td>
								<td class="bold">Address</td>
							</tr>
							<xsl:for-each select="trade_reference_detail/guarantor_details/guarantor_detail">
								<tr style='text-align:center;'>
									<td><xsl:value-of select="position()"/></td>
									<td><xsl:value-of select="guarantor_ic"/></td>
									<td><xsl:value-of select="guarantor_name"/></td>
									<td><xsl:value-of select="guarantor_address"/></td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td>NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END TRADE REFERENCE -->
	
	<!-- BEGIN CREDIT REFERENCE -->
	<xsl:template match="trade_bureau_defaulter_details" name="trade_bureau_defaulter_details">
		<table border="0" width="100%" class="nobottom">
			<tr>
				<td align="left" colspan="4" class="show_border background_DAEEF3"><span class="bold">SECTION B: OTHER CREDIT REFERENCE</span><br /><span class="small">NOTE: The following information is provided by third party sources for your reference. Experian does not guarantee the accuracy of the information. Please check with the Creditors for confirmation as alleged debts may have been settled since recorded. Users should NOT treat the information as conclusive factor for evaluation purpose.</span></td>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(defaulter_details/*) + count(trade_bureau_details/*)) > 0">
					<xsl:if test="count(defaulter_details/*) > 0">
						<xsl:for-each select="defaulter_details/*">
							<xsl:if test="subject | local_no | reg_no | new_ic | old_ic">
								<tr>
									<td width="20%" class="bold">Subject Name</td>
									<td width="30%"><xsl:value-of select="subject"/></td>
									<td width="20%" class="bold">Subject ID</td>
									<xsl:if test="local_no">
										<td width="30%"><xsl:value-of select="local_no"/></td>
									</xsl:if>
									
									<xsl:if test="reg_no">
										<td width="30%"><xsl:value-of select="reg_no"/></td>
									</xsl:if>
									
									<xsl:if test="new_ic | old_ic">
										<td width="30%">
											<xsl:call-template name="getBothICPPNo">
												<xsl:with-param name="newic">
													<xsl:value-of select="new_ic"/>
												</xsl:with-param>
												<xsl:with-param name="oldic">
													<xsl:value-of select="old_ic"/>
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</xsl:if>
								</tr>
							</xsl:if>
							<xsl:if test="creditor_name | amount">
								<tr>
									<td width="20%" class="bold">Creditor&#39; Name</td>
									<td width="30%"><xsl:value-of select="creditor_name"/></td>
									<td width="20%" class="bold">Amount</td>
									<td width="30%"><xsl:value-of select="amount"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="creditor_telno | date">
								<tr>
									<td width="20%" class="bold">Creditor&#39;s Contact</td>
									<td width="30%"><xsl:value-of select="creditor_telno"/></td>
									<td width="20%" class="bold">Due since / Aging Days</td>
									<td width="30%"><xsl:value-of select="date"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="status | status_date">
								<tr>
									<td width="20%" class="bold">Status</td>
									<td width="30%"><xsl:value-of select="status"/></td>
									<td width="20%" class="bold">Status Date</td>
									<td width="30%"><xsl:value-of select="status_date"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="ref_no | claim_nature">
								<tr>
									<td width="20%" class="bold">Ref No</td>
									<td width="30%"><xsl:value-of select="ref_no"/></td>
									<td width="20%" class="bold">Claim Nature</td>
									<td width="30%"><xsl:value-of select="claim_nature"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="solicitor_name | solicitor_telno">
								<tr>
									<td width="20%" class="bold">Solicitor&#39;s Name</td>
									<td width="30%"><xsl:value-of select="solicitor_name"/></td>
									<td width="20%" class="bold">Solicitor&#39;s Contact</td>
									<td width="30%"><xsl:value-of select="solicitor_telno"/></td>
								</tr>
							</xsl:if>
							
							<xsl:variable name="guarantor_list">
								<xsl:for-each select="guarantor_details/*">
									<xsl:if test="guarantor_name">
										<xsl:value-of select="guarantor_name"/>
									</xsl:if>
									
									<xsl:if test="guarantor_ic">
										(<xsl:value-of select="guarantor_ic"/>)
									</xsl:if>
									
									<xsl:if test="position() != last() ">
										<br />
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
														
							<xsl:if test="remarks or string-length($guarantor_list) > 0">
								<tr>
									<td width="20%" class="bold">Guarantor</td>
									<td width="30%"><xsl:value-of select="$guarantor_list"/></td>
									<td width="20%" class="bold">Remarks</td>
									<td width="30%"><xsl:value-of select="remarks"/></td>
								</tr>
							</xsl:if>
             
							<xsl:if test="position() != last()">
								<tr>
									<td colspan="4">&#160;</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					
					<xsl:if test="count(trade_bureau_details/*) > 0">
						<xsl:for-each select="trade_bureau_details/*">
							<xsl:if test="subject | local_no | reg_no | new_ic | old_ic">
								<tr>
									<td width="20%" class="bold">Subject Name</td>
									<td width="30%"><xsl:value-of select="subject"/></td>
									<td width="20%" class="bold">Subject ID</td>
									<xsl:if test="local_no">
										<td width="30%"><xsl:value-of select="local_no"/></td>
									</xsl:if>
									
									<xsl:if test="reg_no">
										<td width="30%"><xsl:value-of select="reg_no"/></td>
									</xsl:if>
									
									<xsl:if test="new_ic | old_ic">
										<td width="30%">
											<xsl:call-template name="getBothICPPNo">
												<xsl:with-param name="newic">
													<xsl:value-of select="new_ic"/>
												</xsl:with-param>
												<xsl:with-param name="oldic">
													<xsl:value-of select="old_ic"/>
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</xsl:if>
								</tr>
							</xsl:if>
							<xsl:if test="creditor_name | amount">
								<tr>
									<td width="20%" class="bold">Creditor&#39; Name</td>
									<td width="30%"><xsl:value-of select="creditor_name"/></td>
									<td width="20%" class="bold">Amount</td>
									<td width="30%"><xsl:value-of select="amount"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="creditor_telno | payment_aging">
								<tr>
									<td width="20%" class="bold">Creditor&#39;s Contact</td>
									<td width="30%"><xsl:value-of select="creditor_telno"/></td>
									<td width="20%" class="bold">Due since / Aging Days</td>
									<td width="30%"><xsl:value-of select="payment_aging"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="status | status_date">
								<tr>
									<td width="20%" class="bold">Status</td>
									<td width="30%"><xsl:value-of select="status"/></td>
									<td width="20%" class="bold">Status Date</td>
									<td width="30%"><xsl:value-of select="status_date"/></td>
								</tr>
							</xsl:if>							
							<xsl:if test="ref_no | claim_nature">
								<tr>
									<td width="20%" class="bold">Ref No</td>
									<td width="30%"><xsl:value-of select="ref_no"/></td>
									<td width="20%" class="bold">Claim Nature</td>
									<td width="30%"><xsl:value-of select="claim_nature"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="solicitor_name | solicitor_telno">
								<tr>
									<td width="20%" class="bold">Solicitor&#39;s Name</td>
									<td width="30%"><xsl:value-of select="solicitor_name"/></td>
									<td width="20%" class="bold">Solicitor&#39;s Contact</td>
									<td width="30%"><xsl:value-of select="solicitor_telno"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="chassis_no | registration_no | engine_no | model">
								<tr>
									<td width="20%" class="italic-bold">For Motor Industry</td>
									<td width="30%">&#160;</td>
									<td width="20%" class="bold">&#160;</td>
									<td width="30%">&#160;</td>
								</tr>
								<xsl:if test="chassis_no | registration_no">
									<tr>
										<td width="20%" class="bold">Chasis No.</td>
										<td width="30%"><xsl:value-of select="chassis_no"/></td>
										<td width="20%" class="bold">Reg. No</td>
										<td width="30%"><xsl:value-of select="registration_no"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="engine_no | model">
									<tr>
										<td width="20%" class="bold">Engine No.</td>
										<td width="30%"><xsl:value-of select="engine_no"/></td>
										<td width="20%" class="bold">Model</td>
										<td width="30%"><xsl:value-of select="model"/></td>
									</tr>
								</xsl:if>
							</xsl:if>
							<xsl:variable name="guarantor_list">
								<xsl:for-each select="guarantor_details/*">
									<xsl:if test="guarantor_name">
										<xsl:value-of select="guarantor_name"/>
									</xsl:if>
									
									<xsl:if test="guarantor_ic">
										(<xsl:value-of select="guarantor_ic"/>)
									</xsl:if>
									
									<xsl:if test="position() != last() ">
										<tr>
											<td colspan="4">&#160;</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<xsl:if test="remarks or string-length($guarantor_list) > 0">
								<tr>
									<td width="20%" class="bold">Guarantor</td>
									<td width="30%"><xsl:value-of select="$guarantor_list"/></td>
									<td width="20%" class="bold">Remarks</td>
									<td width="30%"><xsl:value-of select="remarks"/></td>
								</tr>
							</xsl:if>   
							<xsl:if test="position() != last()">
								<tr>
									<td colspan="4"><hr /></td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="4">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END CREDIT REFERENCE -->
	
	
	<!-- BEGIN TRADE BUREAU REPORT (TBB/TBC/TBI)-->
	<xsl:template name="trade_bureau_input_request">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION PROVIDED BY YOU</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name Of Subject</td>
				<td width="80%"><xsl:value-of select="name"/></td>
			</tr>
			<xsl:if test="search_id">
				<tr>
					<td width="20%" class="bold">ID Number</td>
					<td width="80%"><xsl:value-of select="search_id"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="old_ic">
				<tr>
					<td width="20%" class="bold">Old IC. No</td>
					<td width="80%"><xsl:value-of select="old_ic"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="new_ic">
				<tr>
					<td width="20%" class="bold">New IC. No</td>
					<td width="80%"><xsl:value-of select="new_ic"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td width="20%" class="bold">Enquiry Purpose</td>
				<td width="80%"><xsl:value-of select="enquiry_purpose"/></td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="person_address">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left">LAST KNOWN ADDRESSES<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
				<th>Date Captured</th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(person_addres/address)) > 0">
					<xsl:for-each select="person_addres">
						<tr>
							<td><xsl:value-of select="address" /></td><td><xsl:value-of select="date_capture" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	
	<xsl:template name="trade_bureau_company_details">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left" colspan="2">SECTION A: SUMMARY<br /><span class="small">NOTE: The following business details are extracted from SSM. There may be changes to the corporate details of the Subject company which may not be available to the public.</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(*)) > 0">
					<tr>
						<td width="20%" class="bold">Name</td>
						<td width="80%"><xsl:value-of select="company_name"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">ID Number</td>
						<td width="80%"><xsl:value-of select="local_no"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">Incorporation Date</td>
						<td width="80%"><xsl:value-of select="incorporation_date"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">Type</td>
						<td width="80%"><xsl:value-of select="company_type"/></td>
					</tr>
					<tr>
						<td width="20%" class="bold">Status</td>
						<td width="80%"><xsl:value-of select="company_status"/></td>
					</tr>
					<xsl:if test="nature_businesses">
						<xsl:for-each select="nature_businesses/nature_business">
							<tr>
								<xsl:choose>
									<xsl:when test="(position()) = 1">
										<td width="20%" class="bold">Nature of Business</td>
									</xsl:when>
									<xsl:otherwise>
										<td width="20%" class="bold"></td>
									</xsl:otherwise>
								</xsl:choose>
								<td width="80%"><xsl:value-of select="."/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>
					<xsl:for-each select="addresses">
						<xsl:choose>
							<xsl:when test="business_address">
								<tr>
									<td class="bold">Business Address</td>
									<td><xsl:value-of select="business_address"/></td>
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="registered_address">
									<tr>
										<td class="bold">Registered Address</td>
										<td><xsl:value-of select="registered_address"/></td>
									</tr>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<tr>
						<td width="20%" class="bold">Last Financial Filed</td>
						<td width="80%"><xsl:value-of select="last_financial_filed"/></td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td>NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	
	<xsl:template match="company_addresses">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left">LAST KNOWN ADDRESSES<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
				<th>Date Captured</th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(company_address)) > 0">
					<xsl:for-each select="company_address">
						<tr>
							<td><xsl:value-of select="address" /></td><td><xsl:value-of select="date_capture" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
		
	<xsl:template match="enquiry_details">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left" colspan="4">PREVIOUS ENQUIRY</th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(enquiry/*)) > 0">
					<tr>
						<td class="bold">No.</td>
						<td class="bold">Date Search</td>
						<td class="bold">Industry</td>
						<td class="bold">Purpose</td>
					</tr>
					<xsl:for-each select="enquiry/item">
						<tr>
						  <td><xsl:value-of select="count" /></td>
						  <td><xsl:value-of select="searchdate" /></td>
						  <td><xsl:value-of select="industry" /></td>
						  <td><xsl:value-of select="purpose" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="4">NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	
	<xsl:template name="data_summary">
		<xsl:param name="type" />
		<xsl:param name="from" />
		<xsl:choose>
			<xsl:when test="own_report = ''">
				<br />
				<table border="0" width="100%" class="woborder normal-text">
					<tr>
						<td width="50%" align="left">
							<table class="nostyle normal-text" width="100%">
								<tr>
									<th align="left" class="background_DAEEF3 bold show_border" colspan="3">LITIGATION COUNT</th>
								</tr>
								<tr>
								  <td class="show_border bold">Type</td>
								  <td class="show_bottom_border show_top_border bold">&#8804; 3 years</td>
								  <td class="show_bottom_border show_top_border show_right_border bold">&gt; 3 years</td>
								</tr>
								<xsl:if test="suit_count">
									<xsl:for-each select="suit_count">
										<tr>
											<td class="show_border bold"><xsl:value-of select="type" /></td>
											<xsl:choose>
												<xsl:when test="count_lte3">
													<td class="show_bottom_border "><xsl:value-of select="count_lte3" /></td>
												</xsl:when>
												<xsl:otherwise>
													<td class="show_bottom_border">0</td>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="count_gt3">
													<td class="show_bottom_border show_right_border"><xsl:value-of select="count_gt3" /></td>
												</xsl:when>
												<xsl:otherwise>
													<td class="show_bottom_border show_right_border">0</td>
												</xsl:otherwise>
											</xsl:choose>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="$from = 'TBB'">
										<tr>
											<td class="show_border bold">Winding up Action</td>
											<td class="show_bottom_border">NA</td>
											<td class="show_bottom_border show_right_border">NA</td>
										</tr>
									</xsl:when>
									<xsl:when test="$from = 'TBC'">
										<xsl:if test="windup_count">
											<xsl:for-each select="windup_count">
												<tr>
													<td class="show_border bold"><xsl:value-of select="type" /></td>
													<xsl:choose>
														<xsl:when test="count_lte3">
															<td class="show_bottom_border"><xsl:value-of select="count_lte3" /></td>
														</xsl:when>
														<xsl:otherwise>
															<td class="show_bottom_border">0</td>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="count_gt3">
															<td class="show_bottom_border show_right_border"><xsl:value-of select="count_gt3" /></td>
														</xsl:when>
														<xsl:otherwise>
															<td class="show_bottom_border show_right_border">0</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</xsl:if>
									</xsl:when>
			  
									<xsl:when test="$from = 'TBI'">
										<xsl:if test="bankruptcy_count">
											<xsl:for-each select="bankruptcy_count">
												<tr>
													<td class="show_border bold"><xsl:value-of select="type" /></td>
													<xsl:choose>
														<xsl:when test="count_lte3">
															<td class="show_bottom_border"><xsl:value-of select="count_lte3" /></td>
														</xsl:when>
														<xsl:otherwise>
															<td class="show_bottom_border">0</td>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="count_gt3">
															<td class="show_bottom_border show_right_border"><xsl:value-of select="count_gt3" /></td>
														</xsl:when>
														<xsl:otherwise>
															<td class="show_bottom_border show_right_border">0</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</table>
						</td>
						<td width="50%">
							<table class="nostyle normal-text" width="100%">
								<tr>
									<th align="left" class="background_DAEEF3 bold show_border" colspan="2"><xsl:value-of select="$type" /></th>
								</tr>
								<tr>
									<td class="show_border bold">Type</td>
									<td class="show_border bold">Count</td>
								</tr>
								<xsl:choose>
									<xsl:when test="$from = 'TBC'">
										<xsl:for-each select="interest_count">
											<tr>
												<td class="show_border bold"><xsl:value-of select="type" /></td>
												<xsl:choose>
													<xsl:when test="com_interest_count">
														<td class="show_bottom_border show_right_border"><xsl:value-of select="com_interest_count" /></td>  
													</xsl:when>
													<xsl:when test="ind_interest_count">
														<td class="show_bottom_border show_right_border"><xsl:value-of select="ind_interest_count" /></td>                    
													</xsl:when>
													<xsl:otherwise>
														<td class="show_bottom_border show_right_border">0</td>
													</xsl:otherwise>
												</xsl:choose>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="charges_count">
											<tr>
												<td class="show_border bold"><xsl:value-of select="type" /></td>
												<xsl:choose>
													<xsl:when test="com_charges_count">
														<td class="show_bottom_border show_right_border"><xsl:value-of select="com_charges_count" /></td>  
													</xsl:when>
													<xsl:otherwise>
														<td class="show_bottom_border show_right_border">0</td>
													</xsl:otherwise>
												</xsl:choose>
											</tr>
										</xsl:for-each>
									</xsl:when>
									<xsl:when test="$from = 'TBB'">
										<tr>
											<td class="show_border bold">Subsidiaries / Related Co</td>
											<td class="show_bottom_border show_right_border">NA</td>
										</tr>
										<tr>
											<td class="show_border bold">Company Charges (Unsatisfied/Partially Satisfied)</td>
											<td class="show_bottom_border show_right_border">NA</td>
										</tr>
									</xsl:when>
									<xsl:when test="$from = 'TBI'">                
										<xsl:for-each select="interest_count">
											<tr>
												<td class="show_border bold"><xsl:value-of select="type" /></td>
												<xsl:choose>
													<xsl:when test="ind_interest_count">
														<td class="show_bottom_border show_right_border"><xsl:value-of select="ind_interest_count" /></td>  
													</xsl:when>
													<xsl:otherwise>
														<td class="show_bottom_border show_right_border">0</td>
													</xsl:otherwise>
												</xsl:choose>
											</tr>
										</xsl:for-each>
										<tr>
											<td class="show_border">&#160;</td>
											<td class="show_bottom_border show_right_border">&#160;</td>
										</tr>
									</xsl:when>
								</xsl:choose>
							</table>        
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	<xsl:if test="show_aging = 'yes'">	
		<br />
		<table border="0" width="100%" class="full_border">
				<!-- NOTE FOR OWN CONTRIBUTED LIST NOTE-->
				<xsl:if test="own_report != ''">
					<tr>
						<th align="left" colspan="12"><span class="small">NOTE: The following Section B and C will show ONLY the payment record contributed by you for your verification purpose. To view payment records contributed by others Trade Bureau members, please proceed to purchase for Bureau Reports at the Trade Bureau Main Screen, 
						<a href="../../tradebureau">click here</a> .</span></th>
					</tr>
				</xsl:if>
				
				<!-- END NOTE FOR OWN CONTRIBUTED LIST NOTE-->
			<tr>
				<th align="left" colspan="12">SECTION B: PAYMENT PROFILE<br />
				
				<!-- NOTE FOR OWN CONTRIBUTED LIST NOTE-->
				<xsl:if test="own_report = ''">
					<span class="small">NOTE: The following information is provided by third party sources for your reference. Experian does not guarantee the accuracy of the information. Please check with the Creditors for confirmation. Users should NOT treat the information as conclusive factor for evaluation purpose.</span>
				</xsl:if>
				<!-- END NOTE FOR OWN CONTRIBUTED LIST NOTE-->
				
				</th>
			</tr>
			<tr>
				<td class="h3" colspan="12">ACCOUNT PAYMENT PROFILE</td>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(payment_profile/profile/*)) > 0">
					<tr>
						<td class="bold" rowspan="2">Creditor/<br />Industry</td>
						<td class="bold" rowspan="2">Experian<br />Ref No</td>
						<td class="bold" rowspan="2">Debt<br />Type</td>
						<td class="bold" rowspan="2">Credit<br />Term</td>
						<td class="bold" rowspan="2">As at<br />Date</td>
						<td class="bold" rowspan="2">Amt<br />Due</td>
						<td class="bold" rowspan="2">Within<br />Term</td>
						<td class="bold" colspan="5" align="center">Payment Over due</td>
					</tr>
					<tr>  
						<td class="bold">1-30</td>
						<td class="bold">31-60</td>
						<td class="bold">61-90</td>
						<td class="bold">91-120</td>
						<td class="bold">&gt; 120</td>
					</tr>
					<xsl:for-each select="payment_profile/profile/item">
						<tr>
						
						<xsl:variable name="apos">'</xsl:variable>
						<xsl:variable name="inv_showhide_id"><xsl:value-of select="ramci_refno" /></xsl:variable>
						
						<xsl:variable name="js_showhide">
							<xsl:value-of select="concat('javascript:toggle_showhide(', $apos,$inv_showhide_id, $apos,')')" />
						</xsl:variable>
							<td>
								<xsl:element name="a">
									<xsl:attribute name="href">
									<xsl:value-of select="$js_showhide" />
									</xsl:attribute>
									 <img id="imgplus" src="/images/plus.png" width="10px" height="9px" />
								</xsl:element>
								
								<xsl:value-of select="subject" />
							</td>
							<td><xsl:value-of select="ramci_refno" /></td>
							<td><xsl:value-of select="debt_type" /></td>
							<td><xsl:value-of select="credit_term" /></td>
							<td><xsl:value-of select="as_at_date" /></td>
							<td><xsl:value-of select="amount_due" /></td>
							<td><xsl:value-of select="within_term" /></td>
							<td><xsl:value-of select="os1" /></td>
							<td><xsl:value-of select="os2" /></td>
							<td><xsl:value-of select="os3" /></td>
							<td><xsl:value-of select="os4" /></td>
							<td><xsl:value-of select="os5" /></td>
						</tr>
						<xsl:if test ="count(invoice) > 0">
							<xsl:for-each select="invoice/item">
							
							<xsl:element name="tr">
								<xsl:attribute name="class">
									<xsl:value-of select="../../ramci_refno" />
								</xsl:attribute>
								
								<xsl:attribute name="style">
									display:None;
								</xsl:attribute>
									<td align="right"><xsl:value-of select="../../subject" /></td>
									<td><xsl:value-of select="../../ramci_refno" /></td>
									<td><xsl:value-of select="../../debt_type" /></td>
									<td><xsl:value-of select="../../credit_term" /></td>
									<td><xsl:value-of select="../../as_at_date" /></td>
									<td><xsl:value-of select="inv_amt_due" /></td>
									<td><xsl:value-of select="inv_within_term" /></td>
									<td><xsl:value-of select="inv_os1" /></td>
									<td><xsl:value-of select="inv_os2" /></td>
									<td><xsl:value-of select="inv_os3" /></td>
									<td><xsl:value-of select="inv_os4" /></td>
									<td><xsl:value-of select="inv_os5" /></td>
							</xsl:element>
								
							</xsl:for-each>
						</xsl:if>
					
					</xsl:for-each>
					
				<xsl:call-template name="invoice_note" />	
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="12">NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<td class="h3" colspan="13">PAYMENT TREND (12 Months Period)</td>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(payment_trend/trend/item)) > 1">
					<xsl:for-each select="payment_trend/trend/item">
						<xsl:choose>
							<xsl:when test="position() = 1">
								<tr>
									<td class="bold"><xsl:value-of select="subject" /></td>
									<td class="bold"><xsl:value-of select="ramci_refno" /></td>
									<td class="bold"><xsl:value-of select="status1" /></td>
									<td class="bold"><xsl:value-of select="status2" /></td>
									<td class="bold"><xsl:value-of select="status3" /></td>
									<td class="bold"><xsl:value-of select="status4" /></td>
									<td class="bold"><xsl:value-of select="status5" /></td>
									<td class="bold"><xsl:value-of select="status6" /></td>
									<td class="bold"><xsl:value-of select="status7" /></td>
									<td class="bold"><xsl:value-of select="status8" /></td>
									<td class="bold"><xsl:value-of select="status9" /></td>
									<td class="bold"><xsl:value-of select="status10" /></td>
									<td class="bold"><xsl:value-of select="status11" /></td>
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<tr>
									<td><xsl:value-of select="subject" /></td>
									<td><xsl:value-of select="ramci_refno" /></td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status1"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status2"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status3"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status4"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status5"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status6"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status7"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status8"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status9"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status10"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td>
										<xsl:call-template name="convert_decimal_zero_to_zero">
											<xsl:with-param name="value">
												<xsl:value-of select="status11"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="13">NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<xsl:if test="(count(payment_trend/trend/item)) > 1">
			<br />
			<table border="0" width="70%" class="highlight">
				<tr>
					<td class="bold">LEGEND:</td>
					<td>
						<table width="80%" class="legend">
							<tr>
								<th>Criteria</th>
								<th>Description</th>
								<th>Criteria</th>
								<th>Description</th>
							</tr>
							<tr>
								<td>-</td>
								<td>No Data</td>
								<td>4</td>
								<td>91 - 120 Days Overdue</td>
							</tr>
							<tr>
								<td>0</td>
								<td>No Overdue</td>
								<td>5</td>
								<td>121 - 150 Days Overdue</td>
							</tr>
							<tr>
								<td>1</td>
								<td>1 - 30 Days Overdue</td>
								<td>6</td>
								<td>151 - 180 Days Overdue</td>
							</tr>
							<tr>
								<td>2</td>
								<td>31 - 60 Days Overdue</td>
								<td>7</td>
								<td>&gt; 180 Days Overdue</td>
							</tr>
							<tr>
								<td>3</td>
								<td>61 - 90 Days Overdue</td>
								<td>&#160;</td>
								<td>&#160;</td>
							</tr>
						</table>          
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:if>
	<xsl:if test="show_nod = 'yes'">
			<br />
			<table border="0" width="100%" class="nobottom">
				<tr>
					<th colspan="4" class="background_DAEEF3" align="left">SECTION C: TRADE/CREDIT REFERENCE<br />
					
					<!-- NOTE FOR OWN CONTRIBUTED LIST NOTE-->
					<xsl:if test="own_report = ''">
						<span class="small">NOTE: The following information is provided by third party sources for your reference. Experian does not guarantee the accuracy of the information. Please check with the Creditors for confirmation as alleged debts may have been settled since recorded. Users should NOT treat the information as conclusive factor for evaluation purpose.</span>
					</xsl:if>
					<!-- END NOTE FOR OWN CONTRIBUTED LIST NOTE-->
				
					</th>
				</tr>
				<xsl:choose>
					<xsl:when test="credit_count = '0'">
						<tr>
							<td colspan="4">NO INFORMATION AVAILABLE.</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="company_trade_bureau_entity/*">
							<xsl:call-template name="trade_bureau_entity_item" />
							<xsl:if test="position() != last()">
								<tr>
									<td colspan="4" class="show_border">&#160;</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="person_trade_bureau_entity/*">
							<xsl:call-template name="trade_bureau_entity_item" />
							<xsl:if test="position() != last()">
								<tr>
									<td colspan="4" class="show_border">&#160;</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</table>
		
		<xsl:if test="credit_count > 0">
			<table border="0" width="70%" class="woborder highlight margin10">
				<tr>
					<td width="20%" class="bold">LEGEND:</td>
					<td class="bold" align="right">LOD</td>
					<td>- Letter of Demand issued by a Lawyer (Legal Firm)</td>
				</tr>
				<tr>
					<td colspan="2" class="bold" align="right">NOD</td>
					<td>- Notice of Demand issued by internally (Company)</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:if>
	</xsl:template>
	
	<xsl:template name="convert_decimal_zero_to_zero">
		<xsl:param name="value" />
		<xsl:choose>
			<xsl:when test="$value = '0.0'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
		
	<xsl:template name="trade_bureau_business_details">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">SECTION A: SUMMARY<br /><span class="small">NOTE: The following business details are extracted from SSM. There may be changes to the corporate details of the Subject company which may not be available to the public.</span></th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name</td>
				<td width="80%"><xsl:value-of select="name"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">ID Number</td>
				<td width="80%"><xsl:value-of select="registration_no"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Date of Commencement</td>
				<td width="80%"><xsl:value-of select="date_commenced"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Date of Registration</td>
				<td width="80%"><xsl:value-of select="date_registered"/></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Type</td>
				<td width="80%"><xsl:value-of select="business_type"/></td>
			</tr>     
			<xsl:for-each select="business_activity/*">
				<tr>
					<xsl:choose>
						<xsl:when test="(position()) = 1">
							<td class="bold" width="20%">Nature of Business</td>
						</xsl:when>
						<xsl:otherwise>
							<td width="20%" class="bold">&#160;</td>
						</xsl:otherwise>
					</xsl:choose>
					<td width="80%"><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
			<xsl:for-each select="addresses">
				<xsl:if test="business_address != ''">
					<tr>
						<td class="bold">Business Address</td>
						<td><xsl:value-of select="business_address"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="comm_address != ''">
					<tr>
						<td class="bold">Registered Address</td>
						<td><xsl:value-of select="comm_address"/></td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</table>
	</xsl:template>
  
	<xsl:template match="business_addresses">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th align="left">LAST KNOWN ADDRESSES<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
				<th>Date Captured</th>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(*)) > 0">
					<xsl:for-each select="*">
						<tr>
							<td><xsl:value-of select="address" /></td><td><xsl:value-of select="date_capture" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
		
	<xsl:template match="employer_details">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="3" align="left">EMPLOYMENT DETAILS<br /><span class="small">NOTE: The address(s) stated below may not be the current or last known address of the subject.</span></th>
			</tr>
			<tr>
				<td colspan="3">Recent Last 2 Known Employers</td>
			</tr>
				<xsl:choose>
					<xsl:when test="(count(employers/*)) > 0">
						<tr>
							<td class="bold">No.</td>
							<td class="bold">Employer</td>
							<td class="bold">Position</td>
						</tr>
						<xsl:for-each select="employers/*">
							<tr>
								<td><xsl:value-of select="count" /></td>
								<td><xsl:value-of select="employer" /></td>
								<td><xsl:value-of select="position" /></td>
							</tr>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td colspan="3">NO INFORMATION AVAILABLE.</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
		</table>
	</xsl:template>
	
	<xsl:template name="tbi_person_details">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">SECTION A: SUMMARY</th>
			</tr>
			<tr>
				<td colspan="2" class="h3">PARTICULARS</td>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(*)) > 0">
					<xsl:for-each select="*">
						<tr>
							<td width="20%" class="highlight bold">Name</td>
							<td class="highlight_F8F8FF"><xsl:value-of select="name"/></td>
						</tr>
						<tr>
							<td width="20%" class="highlight bold">Old IC. No</td>
							<td class="highlight_F8F8FF"><xsl:value-of select="old_ic"/></td>
						</tr>
						<tr>
							<td width="20%" class="highlight bold">New IC. No</td>
							<td class="highlight_F8F8FF"><xsl:value-of select="new_ic"/></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="2">NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END TRADE BUREAU REPORT (TBB/TBC/TBI)-->
	
	<!-- BEGIN PROFESSIONAL INFO -->
	<xsl:template match="professional_info">
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left"><xsl:value-of select="name" /></th>
			</tr>
			<tr>
				<td class="bold">Reg / Member No</td>
				<td><xsl:value-of select="member_no" /></td>
			</tr>
			<tr>
				<td class="bold">Reg. Date</td>
				<td><xsl:value-of select="reg_date" /></td>
			</tr>
			<tr>
				<td class="bold">WORK ADDRESS</td>
				<td><xsl:value-of select="addr1" /></td>
			</tr>
			<xsl:for-each select="qualification/item">
				<tr>
					<xsl:choose>
						<xsl:when test="position() = 1">
							<td class="bold">QUALIFICATIONS</td>
						</xsl:when>
						<xsl:otherwise>
							<td class="bold">&#160;</td>
						</xsl:otherwise>
					</xsl:choose>
					<td><xsl:value-of select="." /></td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- END PROFESSIONAL INFO -->
	
		<!-- BEGIN REPORT RETRIEVAL HISTORY (PCR) -->
	<!-- <xsl:template match="xml/credit_enquiry">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="4" align="left">F. ENQUIRIES MADE ON YOU</th>
			</tr>
			<tr>
				<td>No.</td><td>Enquirer Name</td><td>Date Search</td><td>Experian PCR No.</td>
			</tr>
			<xsl:choose>
				<xsl:when test="(count(item)) > 0">
					<xsl:for-each select="item">
						<tr>
							<td><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="name" /></td>
							<td><xsl:value-of select="date" /></td>
							<td><xsl:value-of select="orderid" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="4">NO INFORMATION AVAILABLE.</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template> -->
	<!-- END REPORT RETRIEVAL HISTORY (PCR) -->
	
	<!-- BEGIN ENQUIRIES REPORT PCR -->
	<xsl:template match="xml/credit_enquiry" name="credit_enquiry">
	 	<br />
	 	<table border="0" width="100%" class="full_border">
	 		<tr>
	 			<th colspan="3" align="left">F. ENQUIRIES MADE ON YOU</th>
	 		</tr>
	 		<tr>
	 			<td colspan="3"><em>Note: Enquiries made on you refer to search enquiries made by Experian subscribers which consists of banks businesses and companies, government and statutory bodies, clubs, cooperatives, commercial banks, financial institutions, trading and commercial companies, professionals e.g. lawyers, accountants, property valuers etc. amongst others.</em></td>
	 		</tr>
	 		<tr>
				<th>No</th><th>Enquirer Business Sector</th><th>Date Search</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(item) > 0">
					<xsl:for-each select="item">
						<xsl:if test="sector = 'FI'">
							<tr>
								<td align="center"><xsl:value-of select="position()" /></td><td>FINANCE BANKING</td><td align="center"><xsl:value-of select="date" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="sector = 'FS'">
							<tr>
								<td align="center"><xsl:value-of select="position()" /></td><td>FINANCE SERVICES</td><td align="center"><xsl:value-of select="date" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="sector = 'P'">
							<tr>
								<td align="center"><xsl:value-of select="position()" /></td><td>PROFESSIONAL FIRMS</td><td align="center"><xsl:value-of select="date" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="sector = 'G'">
							<tr>
								<td align="center"><xsl:value-of select="position()" /></td><td>BUSINESS CORPORATION</td><td align="center"><xsl:value-of select="date" /></td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td align="center" colspan="3">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
	 	</table>
	</xsl:template>
	<!-- END ENQUIRIES REPORT PCR -->
	
	<!-- BEGIN ENQUIRIES REPORT CCR1 -->
	<xsl:template match="credit_enquiry_crr1" name="credit_enquiry_crr1">
	 	<br />
	 	<table border="0" width="100%" class="full_border">
	 		<tr>
	 			<th colspan="3" align="left">ENQUIRIES MADE ON YOU</th>
	 		</tr>
	 		<tr>
	 			<td colspan="3"><em>Note: Enquiries made on you refer to search enquiries made by Experian subscribers which consists of banks businesses and companies, government and statutory bodies, clubs, cooperatives, commercial banks, financial institutions, trading and commercial companies, professionals e.g. lawyers, accountants, property valuers etc. amongst others.</em></td>
	 		</tr>
	 		<tr>
				<th>No</th><th>Enquirer Business Sector</th><th>Date Search</th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(item) > 0">
					<xsl:for-each select="item">
						<xsl:if test="sector = 'FI'">
							<tr>
								<td align="center"><xsl:value-of select="position()" /></td><td>FINANCE BANKING</td><td align="center"><xsl:value-of select="date" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="sector = 'FS'">
							<tr>
								<td align="center"><xsl:value-of select="position()" /></td><td>FINANCE SERVICES</td><td align="center"><xsl:value-of select="date" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="sector = 'P'">
							<tr>
								<td align="center"><xsl:value-of select="position()" /></td><td>PROFESSIONAL FIRMS</td><td align="center"><xsl:value-of select="date" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="sector = 'G'">
							<tr>
								<td align="center"><xsl:value-of select="position()" /></td><td>BUSINESS CORPORATION</td><td align="center"><xsl:value-of select="date" /></td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td align="center" colspan="3">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
	 	</table>
	</xsl:template>
	<!-- END ENQUIRIES REPORT CCR1 -->
	
	<!-- START PERSON PREVIOUS INTERESTS -->
	<xsl:template match="previous_company_interests_pcr" name="previous_company_interests_pcr">
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="5" align="left">PREVIOUS KNOWN COMPANIES / BUSINESSES</th>
			</tr>
			<tr>
				<td colspan="5"><em>Note: The following information relating to shareholding / directorship interest by the Subject may not be current. There may be changes which may not be currently available in Experian databank.</em></td>
			</tr>
			<xsl:choose>
				<xsl:when test="count(item) > 0">
					<tr>
						<td width="3%" class="bold">No</td>
						<td width="15%" class="bold">Company Name (Company No)</td>
						<td width="12%" class="bold">Position</td>
						<td width="20%" class="bold">Status</td>
						<td width="10%" class="bold nowrap">Cessation Date</td>
					</tr>
					<xsl:for-each select="item">
						
						<xsl:variable name="type"><xsl:value-of select="type" /></xsl:variable>
						<xsl:variable name="reg_no"><xsl:value-of select="reg_no" /></xsl:variable>
						<xsl:variable name="name">
							<xsl:call-template name="escapeQuotes">
								<xsl:with-param name="txt">
									<xsl:value-of select="name"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>

						<tr>
							<td><xsl:value-of select="position()"/></td>
							<td>
								<xsl:value-of select="name" />(<xsl:value-of select="$reg_no" />)
							</td>
							<td><xsl:value-of select="position" /></td>
							<td><xsl:value-of select="status" /></td>
							<td class="nowrap">
								<xsl:choose>
									<xsl:when test="cessation_date and string-length(cessation_date) > 0">
										<xsl:value-of select="cessation_date" />
									</xsl:when>
									<xsl:otherwise>
										N/A
									</xsl:otherwise>
								</xsl:choose>
								
							</td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td colspan="6">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	<!-- END PERSON PREVIOUS INTERESTS -->
	
	<!-- BEGIN INTERNAL REFERENCE (PCR)) -->
    <xsl:template name="internal_reference" match="reference">
		<div style="text-align: center;"><p class="bold">-END OF REPORT-</p></div>
		<table border="0" width="100%">
			<tr>
				<td>Date: <xsl:value-of select="/xml/reference/order_date" /></td>
				<td>Time: <xsl:value-of select="/xml/reference/order_time" /></td>
				<td>User ID: <xsl:value-of select="/xml/reference/userid" /></td>
				<td></td>
			</tr>
		</table>
	</xsl:template>
	<!-- END INTERNAL REFERENCE (PCR) -->
	
	<!-- BEGIN INTERNAL REFERENCE (CCR1)) -->
    <xsl:template name="internal_reference_ccr1" match="reference_ccr1">
		<div style="text-align: center;"><p class="bold">-END OF REPORT-</p></div>
		<font class="bold">
		<table border="0" width="100%">
			<tr colspan="3" ><font class="underline"> Experian Internal Reference:</font></tr>
			<tr>
				<td width="100px">Date: <xsl:value-of select="/reference_ccr1/order_date" /></td>
				<td width="90px">Time: <xsl:value-of select="/reference_ccr1/order_time" /></td>
				<td width="100px">User ID: <xsl:value-of select="/reference_ccr1/userid" /></td>
				<td></td>
			</tr>
		</table>
		</font>
	</xsl:template>
	<!-- END INTERNAL REFERENCE (CCR1) -->
	
	<!-- ITJR 387/19 - AML/Sanction List - Start -->
	<xsl:template match="xml/aml_sanction_list" name="aml_sanction_list">
		<br />
		<table border="1" width="100%" class="full_border">
			<tr>
				<th colspan="6" align="left">AML / Sanction List<br /><span class="small">Note: The following information is based on Name Match only, against database complied from the following sources (a) Bank Negara Malaysia website (b) UN Security Council resolution 1267 list (c) United States Dept. of the Treasure Specially Designated Nationals (d) Ministry of Home Affairs website for your reference and may not be current. There may be changes which may not be currently available in our databank. Kindly conduct further checking with relevant source for detailed information. For international coverage which cover Enforcements, Sanctions. Politically Exposed Persons (PEP) listing, of more than 35,000 data sources globally, please conduct <a href="https://ct.experian.com.my/index.php/myorder/individual/cdd" target="_blank">Customer Due-D check</a></span></th>
			</tr>
		</table>
		<br />
		<table border="1" width="100%" class="full_border">
			<tr>
				<td class="bold" align="center">No.</td>
				<td class="bold" align="center">Registration No.</td>
				<td class="bold" align="center">Company Name</td>
				<td class="bold" align="center">Trace Case</td>
				<td class="bold" align="center">Date Listed by Source(s)</td>
				<td class="bold" align="center">Name Match</td>
			</tr>
			<xsl:choose>
				<xsl:when test="amlSanctionList != ''">
					<xsl:for-each select="amlSanctionList/item">
						<tr>
							<td align="center"><xsl:value-of select="No" /></td>
							<td align="center"><xsl:value-of select="RegistrationNo" /></td>
							<td align="center"><xsl:value-of select="CompanyName" /></td>
							<td align="center"><xsl:value-of select="TraceCase" /></td>
							<td align="center"><xsl:value-of select="LastUpdated" /></td>
							<td align="center"><xsl:value-of select="NameMatched" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr><td colspan="6" align="center">NO RECORD FOUND</td></tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<br />
		<table border="1" width="100%" class="full_border">
			<tr>
				<td class="bold" align="center">Trace Case</td>
				<td class="bold" align="center">Date Listed by Source(s)</td>
				<td class="bold" align="center">Name Match</td>
			</tr>
			<tr>
				<td><b>AML/CFT</b> - Anti-Money Laundering and Anti-Terrorism Financing Act 2001</td>
				<xsl:choose>
					<xsl:when test="AMLATFA">
						<td align="center"><xsl:value-of select="AMLATFA" /></td>
						<td align="center">MATCHED</td>
					</xsl:when>
					<xsl:otherwise>
						<td align="center">-</td>
						<td align="center">NOT MATCHED</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td><b>BAFIA</b> - Banking and Financial Institutions Act 1989</td>
				<xsl:choose>
					<xsl:when test="BAFIA">
						<td align="center"><xsl:value-of select="BAFIA" /></td>
						<td align="center">MATCHED</td>
					</xsl:when>
					<xsl:otherwise>
						<td align="center">-</td>
						<td align="center">NOT MATCHED</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td><b>MSBA</b> - Money Services Business Act 2011</td>
				<xsl:choose>
					<xsl:when test="MSBA">
						<td align="center"><xsl:value-of select="MSBA" /></td>
						<td align="center">MATCHED</td>
					</xsl:when>
					<xsl:otherwise>
						<td align="center">-</td>
						<td align="center">NOT MATCHED</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="aml_sanction_list_individual" name="aml_sanction_list_individual">
		<br />
		<table border="1" width="100%" class="full_border">
			<tr>
				<th colspan="6" align="left">AML / Sanction List<br /><span class="small">Note: The following information is based on Name Match only, against database complied from the following sources (a) Bank Negara Malaysia website (b) UN Security Council resolution 1267 list (c) United States Dept. of the Treasure Specially Designated Nationals (d) Ministry of Home Affairs website for your reference and may not be current. There may be changes which may not be currently available in our databank. Kindly conduct further checking with relevant source for detailed information. For international coverage which cover Enforcements, Sanctions. Politically Exposed Persons (PEP) listing, of more than 35,000 data sources globally, please conduct <a href="https://ct.experian.com.my/index.php/myorder/individual/cdd" target="_blank">Customer Due-D check</a></span></th>
			</tr>
		</table>
		<br />
		<table border="1" width="100%" class="full_border">
			<tr>
				<td class="bold" align="center">No.</td>
				<td class="bold" align="center">IC / PP No.</td>
				<td class="bold" align="center">Individual Name</td>
				<td class="bold" align="center">Trace Case</td>
				<td class="bold" align="center">Company Name</td>
				<td class="bold" align="center">Date Listed by Source(s)</td>
				<td class="bold" align="center">Name Match</td>
			</tr>
			<xsl:choose>
				<xsl:when test="amlSanctionList != ''">
					<xsl:for-each select="amlSanctionList/item">
						<tr>
							<td align="center"><xsl:value-of select="No" /></td>
							<td align="center"><xsl:value-of select="ICPP" /></td>
							<td align="center"><xsl:value-of select="IndividualName" /></td>
							<td align="center"><xsl:value-of select="TraceCase" /></td>
							<td align="center"><xsl:value-of select="CompanyName" /></td>
							<td align="center"><xsl:value-of select="LastUpdated" /></td>
							<td align="center"><xsl:value-of select="NameMatched" /></td>
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr><td colspan="7" align="center">NO RECORD FOUND</td></tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<br />
		<table border="1" width="100%" class="full_border">
			<tr>
				<td class="bold" align="center">Trace Case</td>
				<td class="bold" align="center">Date Listed by Source(s)</td>
				<td class="bold" align="center">Name Match</td>
			</tr>
			<tr>
				<td><b>AML/CFT</b> - Anti-Money Laundering and Anti-Terrorism Financing Act 2001</td>
				<xsl:choose>
					<xsl:when test="AMLATFA">
						<td align="center"><xsl:value-of select="AMLATFA" /></td>
						<td align="center">MATCHED</td>
					</xsl:when>
					<xsl:otherwise>
						<td align="center">-</td>
						<td align="center">NOT MATCHED</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td><b>BAFIA</b> - Banking and Financial Institutions Act 1989</td>
				<xsl:choose>
					<xsl:when test="BAFIA">
						<td align="center"><xsl:value-of select="BAFIA" /></td>
						<td align="center">MATCHED</td>
					</xsl:when>
					<xsl:otherwise>
						<td align="center">-</td>
						<td align="center">NOT MATCHED</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td><b>KDN</b> - KDN Sanction List</td>
				<xsl:choose>
					<xsl:when test="KDN">
						<td align="center"><xsl:value-of select="KDN" /></td>
						<td align="center">MATCHED</td>
					</xsl:when>
					<xsl:otherwise>
						<td align="center">-</td>
						<td align="center">NOT MATCHED</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td><b>MSBA</b> - Money Services Business Act 2011</td>
				<xsl:choose>
					<xsl:when test="MSBA">
						<td align="center"><xsl:value-of select="MSBA" /></td>
						<td align="center">MATCHED</td>
					</xsl:when>
					<xsl:otherwise>
						<td align="center">-</td>
						<td align="center">NOT MATCHED</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<tr>
				<td><b>UN</b> - UN Sanction List</td>
				<xsl:choose>
					<xsl:when test="UN">
						<td align="center"><xsl:value-of select="UN" /></td>
						<td align="center">MATCHED</td>
					</xsl:when>
					<xsl:otherwise>
						<td align="center">-</td>
						<td align="center">NOT MATCHED</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</table>
	</xsl:template>
	
	<!-- BEGIN MARKET STANDING -->
	<xsl:template name="market_standings" match="xml/market_standings">
		<br />
			<table border="0" width="100%" class="full_border">
				<tr>
					<th align="left" width='20%' colspan= '1'>MARKET STANDING</th>
					<xsl:call-template name="market_standing_font">
						<xsl:with-param name="market_standing">
							<xsl:value-of select="market_standing"/>
						</xsl:with-param>
					</xsl:call-template>
					
					<xsl:if test="market_standing = 'C'">
						<xsl:if test="oaor_message != ''">
							<xsl:call-template name="oaor_message_text">
								<xsl:with-param name="oaor_message">
									<xsl:value-of select="oaor_message"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
					
				</tr>
				
				<xsl:if test="market_standing = 'A'">
					<xsl:call-template name="a_legend">
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="market_standing = 'B'">
					<xsl:call-template name="b_legend">
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="market_standing = 'C'">
					<xsl:call-template name="c_legend">
						<xsl:with-param name="oaor_message">
							<xsl:value-of select="oaor_message"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="market_standing = 'D'">
					<xsl:call-template name="d_legend">
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="market_standing = 'E+'">
					<xsl:call-template name="e1_legend">
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="market_standing = 'E-'">
					<xsl:call-template name="e2_legend">
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="market_standing = 'NA'">
					<xsl:call-template name="na_legend">
					</xsl:call-template>
				</xsl:if>
			</table>
	</xsl:template>
	<!-- END MARKET STANDING -->
	
	<!-- BEGIN OA OR RECOMMENDATION -->		
	<xsl:template name="oaor_message_text">
		<th align="left" colspan= '4'>
			<xsl:call-template name="oaor_message_link">
				<xsl:with-param name="url">
					<xsl:value-of select="oaor_message/url"/>
				</xsl:with-param>
				<xsl:with-param name="message_bold">
					<xsl:value-of select="oaor_message/message_bold"/>
				</xsl:with-param>
			</xsl:call-template>
		</th>
	</xsl:template>
	<!-- END OA OR RECOMMENDATION -->
	
	<!-- BEGIN A LEGEND -->		
	<xsl:template name="a_legend">
		<tr>
			<td colspan="7">
				<p class="highlight">
					<span class="bold"><br/>
						A: CLEAR / NO TRACE
					</span></p>
			</td>
		</tr>
	</xsl:template>
	<!-- END A LEGEND-->
	
	<!-- BEGIN B LEGEND -->		
	<xsl:template name="b_legend">
		<tr>
			<td colspan="7">
				<p class="highlight">
					<span class="bold"><br/>
						B: PLEASE OBTAIN CONSENT TO CHECK FOR FURTHER INFORMATION
					</span></p>
			</td>
		</tr>
	</xsl:template>
	<!-- END B LEGEND-->
	
	<!-- BEGIN C LEGEND -->		
	<xsl:template name="c_legend">
		<tr>
			<td colspan="7">
				<p class="highlight">
					<span class="bold"><br/>
						<xsl:choose>
							<xsl:when test="oaor_message/report_type != ''">
								C: <xsl:value-of select="oaor_message/report_type"/> WITH JABATAN INSOLVENSI MALAYSIA (JIM) IS RECOMMENDED OR OBTAIN CONSENT TO CHECK FOR FURTHER INFORMATION.
							</xsl:when>
							<xsl:otherwise>
								C: OFFICIAL RECEIVER REPORT (OR) WITH JABATAN INSOLVENSI MALAYSIA (JIM) IS RECOMMENDED OR OBTAIN CONSENT TO CHECK FOR FURTHER INFORMATION.
							</xsl:otherwise>
						</xsl:choose>
					</span></p>
			</td>
		</tr>
	</xsl:template>
	<!-- END C LEGEND-->
	
	<!-- BEGIN D LEGEND -->		
	<xsl:template name="d_legend">
		<tr>
			<td colspan="7">
				<p class="highlight">
					<span class="bold"><br/>
						D: PLEASE REFER 'COMPANY STATUS' UNDER COMPANY DETAILS
					</span></p>
			</td>
		</tr>
	</xsl:template>
	<!-- END D LEGEND-->
	
	<!-- BEGIN E+ LEGEND -->		
	<xsl:template name="e1_legend">
		<tr>
			<td colspan="7">
				<p class="highlight">
					<span class="bold"><br/>
						E+: PLEASE OBTAIN CONSENT TO CHECK FOR FURTHER CREDIT DETAILS
					</span></p>
			</td>
		</tr>
	</xsl:template>
	<!-- END E+ LEGEND-->
	
	<!-- BEGIN E- LEGEND -->		
	<xsl:template name="e2_legend">
		<tr>
			<td colspan="7">
				<p class="highlight">
					<span class="bold"><br/>
						E-: PLEASE OBTAIN CONSENT TO CHECK FOR FURTHER CREDIT DETAILS
					</span></p>
			</td>
		</tr>
	</xsl:template>
	<!-- END E- LEGEND-->
	
	<!-- BEGIN NA LEGEND -->		
	<xsl:template name="na_legend">
		<tr>
			<td colspan="7">
				<p class="highlight">
					<span class="bold"><br/>
						NA: NOT APPLICABLE
					</span></p>
			</td>
		</tr>
	</xsl:template>
	<!-- END E- LEGEND-->
	
	<!-- BEGIN MARKET STANDING FONT -->		
	<xsl:template name="market_standing_font">
		<xsl:if test="market_standing = 'A'">
			<th class="bold" align="left" colspan= '5'>A</th>
		</xsl:if>
		<xsl:if test="market_standing = 'B'">
			<th class="bold red" align="left" colspan= '5'>B</th>
		</xsl:if>
		<xsl:if test="market_standing = 'C'">
			<th class="bold red" align="left" colspan= '5'>C</th> 
			<!-- <th class="bold red" align="left" colspan= '5'>C</th>-->
		</xsl:if>
		<xsl:if test="market_standing = 'D'">
			<th class="bold red" align="left" colspan= '5'>D</th> 
			<!-- <th class="bold red" align="left" colspan= '5'>C</th>-->
		</xsl:if>
		<xsl:if test="market_standing = 'E+'">
			<th class="bold red" align="left" colspan= '5'>E+</th> 
			<!-- <th class="bold red" align="left" colspan= '5'>C</th>-->
		</xsl:if>
		<xsl:if test="market_standing = 'E-'">
			<th class="bold red" align="left" colspan= '5'>E-</th> 
			<!-- <th class="bold red" align="left" colspan= '5'>C</th>-->
		</xsl:if>
		<xsl:if test="market_standing = 'NA'">
			<th class="bold red" align="left" colspan= '5'>NA</th> 
			<!-- <th class="bold red" align="left" colspan= '5'>C</th>-->
		</xsl:if>
	</xsl:template>
	<!-- END MARKET STANDING FONT -->
	
	<!-- BEGIN END REPORT -->
    <xsl:template name="end_report" match="xml/end">
		<p class="bold">-END OF REPORT-</p>
		<table border="0" width="100%">
			<tr>
				<td align="left">SUBSCRIBER NAME: <xsl:value-of select="/xml/end/subscriber_name" /></td>
				<td align="right">ORDER DATE: <xsl:value-of select="/xml/end/order_date" /></td>
			</tr>
			<tr>
				<td align="left">USER NAME: <xsl:value-of select="/xml/end/username" /></td>
				<td align="right">ORDER TIME: <xsl:value-of select="/xml/end/order_time" /></td>
			</tr>
		</table>
	</xsl:template>
	<!-- END END REPORT -->
</xsl:stylesheet>

 


   