<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:template match="xml">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simpleA4" page-height="20cm" page-width="21cm" margin-top="2cm" margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body">
           <fo:block font-size="20pt" font-weight="bold" space-after="5mm">Experian Report
          </fo:block>
          <fo:block font-size="16pt" font-weight="bold" space-after="5mm">Date: <xsl:value-of select="report_date"/>
          </fo:block>
          <fo:block font-size="10pt">
          <fo:table table-layout="fixed" width="100%" border-collapse="separate"> 
       
            <fo:table-column column-number="1" column-width="4cm"/>
            <fo:table-column column-number="4" column-width="4cm"/>
            <fo:table-column column-number="2" column-width="4cm"/>
          
         <fo:table-body>
              <xsl:apply-templates select="summary"/>
               <xsl:apply-templates select="banking_info"/>
               <xsl:apply-templates select="trade_bureau"/>
              
             <!--   <xsl:apply-templates select="litigation_info"/>  -->
                 
            </fo:table-body>
          </fo:table>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
     </fo:root>
</xsl:template>
<xsl:template match="input_request">
    <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Name:
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
         Nric
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="search_name"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="new_ic"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  
  <xsl:template match="borrower">
    <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Borrower:
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="outstanding"/>
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
  </xsl:template>
  
  <xsl:template match="summary_credit_report">
    <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Approved Count:
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="approved_count"/>
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
    <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Approved Amount:
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="approved_amount"/>
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
      <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Pending Count:
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="pending_count"/>
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Pending Amount:
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="pending_amount"/>
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
  </xsl:template>
  <xsl:template match="trade_bureau_entity_detail">
    <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Paying Aging:
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="payment_aging"/>
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
  </xsl:template>
    <!--   <xsl:template match="item">
    <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Case Settled:
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="case_settled"/>
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Case Withdrawn:
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="case_withdrawn"/>
        </fo:block>
      </fo:table-cell>
     
    </fo:table-row>
  </xsl:template>  -->
     
   <xsl:template match="info_summary">
  
    <fo:table-row>   
      <fo:table-cell>
        <fo:block>
         Bankruptcy Count:
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
         Legal Suit Count
        </fo:block>
      </fo:table-cell>
       <fo:table-cell>
        <fo:block>
         Trade Bureau Count
        </fo:block>
      </fo:table-cell>
       <fo:table-cell>
        <fo:block>
        Legal Action Banking Count
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
     <fo:table-row>   
     
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="bankruptcy_count"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="legal_suit_count"/>
        </fo:block>
      </fo:table-cell>
       <fo:table-cell>
        <fo:block>
          <xsl:value-of select="trade_bureau_count"/>
        </fo:block>
      </fo:table-cell>
        <fo:table-cell>
        <fo:block>
          <xsl:value-of select="legal_action_banking_count"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
   
  </xsl:template>
  
  <xsl:template match="i_score">
    <fo:table-row>   
      <fo:table-cell>
        <fo:block>
        I Score
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
         Risk Grade
        </fo:block>
      </fo:table-cell>
       <fo:table-cell>
        <fo:block>
         Grade Format
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    
     <fo:table-row>   
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="i_score"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="risk_grade"/>
        </fo:block>
      </fo:table-cell>
       <fo:table-cell>
        <fo:block>
          <xsl:value-of select="grade_format"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  
    
  </xsl:template>
  
  </xsl:stylesheet>
 
	