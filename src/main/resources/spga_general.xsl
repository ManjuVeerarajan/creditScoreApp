<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">  
	<xsl:template match="report_date">
	</xsl:template>
	
	<xsl:template match="spga_error">
		<br />
		<table width="100%" class="full_border">
			<tr>
				<p class="h2 blue uline">SECTION 1A: SPGA DEDUCTION</p>
			</tr>
			<tr>
				<td style="color: red; font-weight: bold;"><xsl:value-of select="." /></td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="spga_status">
		<br />
		<div class="section">
			<p class="h2 blue uline">SECTION 1A: SPGA DEDUCTION</p>
		</div>
		<table width="100%" class="full_border">
			<tr>
				<th colspan="4" align="left">ACCOUNT STATUS</th>
			</tr>
			<tr>
				<td colspan="4" align="right" class="bold">Month of Deduction: <xsl:value-of select="monthly_deduction_period" /></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Status</td>
				<td width="30%"><xsl:value-of select="status" /></td>
				<td width="20%" class="bold">Account ID / Reference</td>
				<td width="30%"><xsl:value-of select="reference_no" /></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Remarks</td>
				<td width="30%"><xsl:value-of select="remark" /></td>
				<td width="20%" class="bold">Salary No</td>
				<td width="30%"><xsl:value-of select="salary_no" /></td>
			</tr>
		</table>
	</xsl:template>
  
	<xsl:template name="spga_input_request">
		<table width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">INFORMATION PROVIDED BY YOU</th>
			</tr>
			<tr>
				<td width="20%" class="bold">Name</td>
				<td width="80%"><xsl:value-of select="search_name" /></td>
			</tr>
			<tr>
				<td width="20%" class="bold">Old IC / PP No / Special ID</td>
				<td width="80%"><xsl:value-of select="old_ic" /></td>
			</tr>
			<tr>
				<td width="20%" class="bold">New IC No</td>
				<td width="80%"><xsl:value-of select="new_ic" /></td>
			</tr>
			<xsl:if test="monthly_deduction">
				<tr>
					<td width="20%" class="bold">Month of Deduction</td>
					<td width="80%"><xsl:value-of select="monthly_deduction" /></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>  
	
	<xsl:template match="particular">
		<br />
		<table width="100%" class="nobottom">
			<tr>
				<th colspan="4" align="left">PARTICULARS</th>
			</tr>
			<xsl:if test="monthly_deduction_text">
				<tr>
					<td class="show_border bold" align="right"  colspan="4">
						Month of Deduction: <xsl:value-of select="monthly_deduction_text" />
					</td>
				</tr>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="count(*) > 0">
					<tr>
						<td width="20%" class="bold">Name of Subject</td>
						<td width="30%"><xsl:value-of select="name" /></td>
						<td width="20%" class="bold">Status</td>
						<td width="30%"><xsl:value-of select="status" /></td>
					</tr>
					<tr>
						<td width="20%" class="bold">Old IC / Police / Army</td>
						<td width="30%"><xsl:value-of select="old_ic" /></td>
						<td width="20%" class="bold">Remarks</td>
						<td width="30%"><xsl:value-of select="remark" /></td>
					</tr>
					<tr>
						<td width="20%" class="bold">New IC No</td>
						<td width="30%"><xsl:value-of select="new_ic" /></td>
						<td width="20%" class="bold">Account ID / Reference</td>
						<td width="30%"><xsl:value-of select="reference_no" /></td>
					</tr>
					<tr>
						<td width="20%" class="bold">&#160;</td>
						<td width="30%">&#160;</td>
						<td width="20%" class="bold">Salary No</td>
						<td width="30%"><xsl:value-of select="salary_no" /></td>
					</tr>
					
					<xsl:if test="note">
						<tr>
							<td colspan="4" class="show_border red bold"><xsl:value-of select="note" /></td>
						</tr>
					</xsl:if>
					<xsl:if test="count(addresses/*)">
						<tr>
							<td colspan="4" class="show_border">
								<table border="0" class="woborder" width="100%">
									<tr>
										<td class="bold">ADDRESSES<br /><span class="small">NOTE: the address(s) stated below may not be the current or last known address of the subject</span></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3" class="show_border bold">Address</td>
							<td class="show_border bold">Date Captured</td>
						</tr>
						<xsl:for-each select="addresses/address">
							<tr>
								<td colspan="3" class="show_border"><xsl:value-of select="address" /></td>
								<xsl:choose>
									<xsl:when test="datechanged">
										<xsl:if test="string-length(datechanged) > 0">
											<td class="show_border"><xsl:value-of select="datechanged" /></td>
										</xsl:if>
										<xsl:if test="string-length(datechanged) = 0">
											<td class="show_border">-</td>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<td class="show_border">-</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
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
  
	<xsl:template match="deduction_breakdown">
		<br />
		<table width="100%" class="nostyle">
			<tr>
				<th align="left" colspan="9" class="show_border">ANGKASA MONTHLY DEDUCTION<br /><span class="small">NOTE: The following information is provided by third party sources for your reference. ANGKASA does not guarantee the accuracy of the information. Please check with the Creditors for confirmation. Users should NOT treat the information as conclusive factor for evaluation purpose.</span></th>
			</tr>
			<xsl:choose>
				<xsl:when test="count(*) > 0">
					<tr>
						<td class="show_left_border show_bottom_border bold">No</td>
						<td class="show_bottom_border bold">Organization</td>
						<td class="show_bottom_border bold">Code</td>
						<td class="show_bottom_border bold">Type</td>
						<td class="show_bottom_border bold">Account Status</td>
						<td class="show_bottom_border bold">Begin</td>
						<td class="show_bottom_border bold">End</td>
						<td class="show_bottom_border bold">Deduction Amount</td>
						<td class="show_right_border show_bottom_border bold">Total Deduction</td>
					</tr>
					<xsl:for-each select="itemise/item">
						<tr class="highlight">
							<td class="show_left_border show_top_border"><xsl:value-of select="position()" /></td>
							<td class="show_top_border"><xsl:value-of select="coop_name" /></td>
							<td class="show_top_border"><xsl:value-of select="coop_no" /></td>
							<td class="show_top_border">&#160;</td>
							<td class="show_top_border"><xsl:value-of select="coop_status" /></td>
							<td class="show_top_border">&#160;</td>
							<td class="show_top_border">&#160;</td>
							<td class="show_top_border">&#160;</td>
							<td class="show_right_border show_top_border"><xsl:value-of select="coop_deduction_amount" /></td>
						</tr>
						<xsl:for-each select="breakdown/item">
							<tr class="highlight_F8F8FF">
								<td class="show_left_border">&#160;</td>
								<td>&#160;</td>
								<td>&#160;</td>
								<td><xsl:value-of select="type" /></td>
								<td>&#160;</td>
								<td><xsl:value-of select="begin" /></td>
								<td><xsl:value-of select="end" /></td>
								<td><xsl:value-of select="amount" /></td>
								<td class="show_right_border">&#160;</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
					<tr>
						<td align="right" class="show_left_border show_top_border show_bottom_border bold" colspan="8">TOTAL DEDUCTION</td>
						<td align="left" class="show_right_border show_top_border show_bottom_border"><xsl:value-of select="total_deduction" /></td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="show_border" colspan="9">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
  
	<xsl:template match="pending">
		<br />
		<table width="100%" class="nostyle">
			<tr>
				<th class="show_border" colspan="6" align="left">PENDING DEDUCTION</th>
			</tr>		
			<xsl:choose>
				<xsl:when test="count(details/detail) > 0">
					<tr>
						<td class="show_left_border show_bottom_border bold">No</td>
						<td class="show_bottom_border bold">Organization</td>
						<td class="show_bottom_border bold">Code</td>
						<td class="show_bottom_border bold">Status</td>
						<td class="show_bottom_border bold">Begin</td>
						<td class="show_right_border show_bottom_border bold">Deduction Amount(RM)</td>
					</tr>
					<xsl:for-each select="details/detail">
						<tr>
							<td class="show_left_border"><xsl:value-of select="position()" /></td>
							<td><xsl:value-of select="coop_name" /></td>
							<td><xsl:value-of select="coop_code" /></td>
							<td><xsl:value-of select="status" /></td>
							<td><xsl:value-of select="start_date" /></td>
							<td class="show_right_border"><xsl:value-of select="deduct_amount" /></td>                  
						</tr>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<td class="show_border" colspan="6">NO INFORMATION AVAILABLE</td>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	
	<xsl:template match="payment_history">
		<br />
		<table width="100%" class="nostyle_11">
			<tr>
				<th class="show_border" colspan="14" align="left">PAYMENT HISTORY</th>
			</tr>
			<xsl:choose>
				<xsl:when test="payment_month">
					<tr>
						<td class="show_bottom_border show_left_border bold">Code</td>
						<td class="show_bottom_border bold">Deduction Month</td>
						<xsl:for-each select="payment_month/item">
							<xsl:if test="(position()) &lt;= 12">
								<xsl:choose>
									<xsl:when test="(position()) = 12">
										<td class="show_bottom_border show_right_border bold"><xsl:value-of select="." /></td>
									</xsl:when>
									<xsl:otherwise>
										<td class="show_bottom_border bold"><xsl:value-of select="." /></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:for-each>
					</tr>
					<!-- first 6 month -->
					<xsl:for-each select="payment_detail/item">
						<xsl:call-template name="payment_history_details">
							<xsl:with-param name="color">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">
										<xsl:text>highlight</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>highlight_F8F8FF</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
							<xsl:with-param name="operator">lesser</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="show_border">NO INFORMATION AVAILABLE</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	
	<xsl:template name="payment_history_details">
		<xsl:param name="color" />
		<xsl:param name="operator" />
		<tr>
			<td rowspan="2" class="show_bottom_border show_left_border {$color} bold"><xsl:value-of select="code" /></td>
			<td class="{$color} bold">Date Process</td>
			<xsl:for-each select="process_date/item">
				<xsl:choose>
					<xsl:when test="$operator = 'greater'">
						<xsl:if test="(position()) &gt; 12">
							<xsl:choose>
								<xsl:when test="(position()) = 12">
									<td class="show_right_border {$color}"><xsl:value-of select="." /></td>
								</xsl:when>
								<xsl:otherwise>
									<td class="{$color}"><xsl:value-of select="." /></td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="(position()) &lt;= 12">
							<xsl:choose>
								<xsl:when test="(position()) = 12">
									<td class="show_right_border {$color}"><xsl:value-of select="." /></td>
								</xsl:when>
								<xsl:otherwise>
									<td class="{$color}"><xsl:value-of select="." /></td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</tr>
		<tr>
			<td class="show_bottom_border {$color} bold">Amount</td>
			<xsl:for-each select="amount/item">
				<xsl:choose>
					<xsl:when test="$operator = 'greater'">
						<xsl:if test="(position()) &gt; 12">
							<xsl:choose>
								<xsl:when test="(position()) = 12">
									<td class="show_bottom_border show_right_border {$color}"><xsl:value-of select="." /></td>
								</xsl:when>
								<xsl:otherwise>
									<td class="{$color} show_bottom_border"><xsl:value-of select="." /></td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="(position()) &lt;= 12">
							<xsl:choose>
								<xsl:when test="(position()) = 12">
									<td class="show_bottom_border show_right_border {$color}"><xsl:value-of select="." /></td>
								</xsl:when>
								<xsl:otherwise>
									<td class="show_bottom_border {$color}"><xsl:value-of select="." /></td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</tr>
	</xsl:template>
  
  <xsl:template name="trade_reference_details">
    <xsl:param name="section" />
    <table width="100%" class="main">
      <tr>
        <th class="bg_maroon column_border" colspan="2">SECTION <xsl:value-of select="$section" />: TRADE BUREAU / OTHER CREDIT REFERENCE</th>
      </tr>
      <tr>
        <td><p>NOTE: The following information is provided by third party sources for your reference. Experian does not guarantee the accuracy of the information. Please check with the Creditors for confirmation. Users should NOT treat the information as conclusive factor for evaluation purpose.</p></td>
      </tr>
      <tr>
        <td><p class="h2">SECTION A: TRADE REFERENCE</p></td>
      </tr>
      <xsl:choose>
        <xsl:when test="(count(trade_reference_detail)) > 0">
          <tr>
            <td class="bold">Account Payment Information</td>
          </tr>
          <tr>
            <td>
              <table width="100%" class="prev_enq" cellspacing="2px" cellpadding="3px">
                <tr>
                    <td class="highlight bold">No</td>
                    <td class="highlight bold">Creditor</td>
                    <td class="highlight bold">Ref No</td>
                    <td class="highlight bold">Debt Type</td>
                    <td class="highlight bold">Start Date</td>
                    <td class="highlight bold">Credit Limit</td>
                    <td class="highlight bold">Credit Term</td>
                    <td class="highlight bold">As At Date</td>
                    <td class="highlight bold">Amount Due</td>
                    <td class="highlight bold">Payment Aging</td>
                </tr>
                <xsl:for-each select="trade_reference_detail">
                  <tr style='text-align:center;'>
                      <td class="highlight_F8F8FF"><xsl:value-of select="position()"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="creditor_name"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="ref_no"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="debt_type"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="start_date"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="credit_limit"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="credit_term"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="as_at_date"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="amount"/></td>
                      <td class="highlight_F8F8FF"><xsl:value-of select="payment_aging"/></td>
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
              <table width="100%" class="prev_enq" cellspacing="2px" cellpadding="3px">
                <tr>
                  <td class="highlight bold">No</td>
                  <td class="highlight bold">Creditor</td>
                  <td class="highlight bold">Ref No</td>
                  <td class="highlight bold">Creditor&#39;s Tel</td>
                  <td class="highlight bold" colspan='6'>Reference Remark</td>
                </tr>
                <xsl:for-each select="trade_reference_detail">  
                  <tr style='text-align:center;'>
                    <td class="highlight_F8F8FF"><xsl:value-of select="position()"/></td>
                    <td class="highlight_F8F8FF"><xsl:value-of select="creditor_name"/></td>
                    <td class="highlight_F8F8FF"><xsl:value-of select="ref_no"/></td>
    				<td class="highlight_F8F8FF"><xsl:value-of select="creditor_telno"/></td>
                    <td colspan='6' class="highlight_F8F8FF"><xsl:value-of select="remark"/></td>
                  </tr>
                </xsl:for-each>
              </table>
            </td>
          </tr>
          <xsl:if test="count(trade_reference_detail/guarantor_details/*) > 0">
			<tr>
				<td class="bold">Guarantor Details</td>
			</tr>
            <tr>
				<td>
					<table width="100%" class="prev_enq" cellspacing="2px" cellpadding="3px">
						<tr>
							<td class="highlight bold">No</td>
							<td class="highlight bold">IC/PP No.</td>
							<td class="highlight bold">Name</td>
							<td class="highlight bold">Address</td>
						</tr>
						<xsl:for-each select="trade_reference_detail/guarantor_details/guarantor_detail">
							<tr style='text-align:center;'>
								<td class="highlight_F8F8FF"><xsl:value-of select="position()"/></td>
								<td class="highlight_F8F8FF"><xsl:value-of select="guarantor_ic"/></td>
								<td class="highlight_F8F8FF"><xsl:value-of select="guarantor_name"/></td>
								<td class="highlight_F8F8FF"><xsl:value-of select="guarantor_address"/></td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <tr>
            <td><hr /><p>NO INFORMATION AVAILABLE</p></td>
          </tr>
        </xsl:otherwise>
      </xsl:choose>
    </table>    
  </xsl:template>
  
  <xsl:template match="xml/trade_bureau_defaulter_details">
    <table width="100%" class="main">
      <tr>
        <td><p class="h2">SECTION B: OTHER CREDIT REFERENCE</p></td>
      </tr>
      <xsl:choose>
        <xsl:when test="(count(defaulter_details/*) + count(trade_bureau_details/*)) > 0">
          <xsl:if test="count(defaulter_details/*) > 0">
            <tr>
              <td>
                <xsl:for-each select="defaulter_details/*">
                  <table width="100%" class="tablewborder" cellspacing="2px" cellpadding="5px">
                    <xsl:if test="creditor_name | amount">
                      <tr>
                        <td width="20%" class="highlight bold">Creditor&#39;s Name</td>
                        <td width="30%" class="highlight_F8F8FF"><xsl:value-of select="creditor_name" /></td>
                        <td width="20%" class="highlight bold">Amount Due</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="amount" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="creditor_telno | date">
                      <tr>
                        <td class="highlight bold">Creditor&#39;s Contact</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="creditor_telno" /></td>
                        <td class="highlight bold">Due since / Aging Days</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="date" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="ref_no | claim_nature">
                      <tr>
                        <td class="highlight bold">Ref No.</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="ref_no" /></td>
                        <td class="highlight bold">Debt Type</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="claim_nature" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="industry | status">
                      <tr>
                        <td class="highlight bold">Industry</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="industry" /></td>
                        <td class="highlight bold">LOD / NOD Date (if any)</td>
                        <td class="highlight_F8F8FF">
                            <xsl:if test="status != ''">
                                <xsl:value-of select="status" /> - 
                            </xsl:if>
                            <xsl:value-of select="status_date" />
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="guarantor_details | solicitor_name">
                      <tr>                            
                        <td class="highlight bold">Guarantor</td>
                        <td class="highlight_F8F8FF">
                          <xsl:choose>
                            <xsl:when test="count(guarantor_details/*) > 0">
                              <xsl:for-each select="guarantor_details/*">
                                <xsl:value-of select="guarantor_name"/><br />
                                (<xsl:value-of select="guarantor_ic"/>)<br />
                              </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                              NIL
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="highlight bold">Solicitor Name</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="solicitor_name" /></td>
                      </tr>
                    </xsl:if>
                  </table>
                  <xsl:if test="position() != last()">
                    <br />
                  </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
            <tr>
              <td>&#160;</td>
            </tr>                    
          </xsl:if>
          
          <xsl:if test="count(trade_bureau_details/*) > 0">
            <tr>
              <td>
                <xsl:for-each select="trade_bureau_details/*">
                  <table width="100%" class="tablewborder" cellspacing="2px" cellpadding="5px">
                    <xsl:if test="creditor_name | amount">
                      <tr>
                        <td width="20%" class="highlight bold">Creditor&#39;s Name</td>
                        <td width="30%" class="highlight_F8F8FF"><xsl:value-of select="creditor_name" /></td>
                        <td width="20%" class="highlight bold">Amount Due</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="amount" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="creditor_telno | payment_aging">
                      <tr>
                        <td class="highlight bold">Creditor&#39;s Contact</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="creditor_telno" /></td>
                        <td class="highlight bold">Due since / Aging Days</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="payment_aging" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="ref_no | claim_nature">
                      <tr>
                        <td class="highlight bold">Ref No.</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="ref_no" /></td>
                        <td class="highlight bold">Debt Type</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="claim_nature" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="industry | status">
                      <tr>
                        <td class="highlight bold">Industry</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="industry" /></td>
                        <td class="highlight bold">LOD / NOD Date (if any)</td>
                        <td class="highlight_F8F8FF">
                            <xsl:if test="status != ''">
                                <xsl:value-of select="status" /> - 
                            </xsl:if>
                            <xsl:value-of select="status_date" />
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="solicitor_name | guarantor_details">
                      <tr>                            
                        <td class="highlight bold">Guarantor</td>
                        <td class="highlight_F8F8FF">
                          <xsl:choose>
                            <xsl:when test="count(guarantor_details/*) > 0">
                              <xsl:for-each select="guarantor_details/*">
                                <xsl:value-of select="guarantor_name"/><br />
                                (<xsl:value-of select="guarantor_ic"/>)<br />
                              </xsl:for-each>                            
                            </xsl:when>
                            <xsl:otherwise>
                              Nil
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="highlight bold">Solicitor Name</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="solicitor_name" /></td>
                      </tr>
                    </xsl:if>
                    
                    <xsl:if test="registration_no != ''">
                      <tr>
                        <td class="highlight bold">Chasis No</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="chassis_no" /></td>
                        <td class="highlight bold">Reg No</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="registration_no" /></td>
                      </tr>
      
                      <tr>
                        <td class="highlight bold">Engine No</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="engine_no" /></td>
                        <td class="highlight bold">Model</td>
                        <td class="highlight_F8F8FF"><xsl:value-of select="model" /></td>
                      </tr>
                    </xsl:if>
                  </table>
                  <xsl:if test="position() != last()">
                    <br />
                  </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:if>
          <tr>
            <td>
              <br />
              <table border="0" width="70%" class="tablewborder highlight">
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
            </td>
          </tr> 
        </xsl:when>
        <xsl:otherwise>
          <tr>
            <td><hr /><p>NO INFORMATION AVAILABLE</p></td>
          </tr>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:template> 
</xsl:stylesheet>

 


   