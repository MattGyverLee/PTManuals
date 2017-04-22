<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to remove any needed content  from XLingPaper file
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" doctype-public="-//XMLmind//DTD XLingPap//EN" doctype-system="XLingPap.dtd"/>

   <xsl:variable name="chosenContentControl" select="//contentControlChoices/contentControlChoice[@active='yes']"/>
   <xsl:variable name="chosenContentTypes" select="id($chosenContentControl/@exclude)"/>

   <!-- 
      Main copy template
   -->
   <xsl:template match="@* |  node()">
      <xsl:copy>
         <xsl:apply-templates select="@*"/>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>
   <!-- 
      Ignore or copy elements that can be ignored
   -->
   <xsl:template match="secTitle">
      <xsl:element name="titleContentChoices">
         <xsl:element name="titleContent">
            <xsl:attribute name="contentType">
               <xsl:text>en</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="object[@contentType='en'][1]"/>
         </xsl:element>
         <xsl:element name="titleContent">
            <xsl:attribute name="contentType">
               <xsl:text>fr</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="object[@contentType='fr'][1]"/>
         </xsl:element>         
      </xsl:element>
   </xsl:template>
   <xsl:template match="shortTitle">
      <xsl:element name="titleContentChoices">
         <xsl:element name="titleContent">
            <xsl:attribute name="contentType">
               <xsl:text>en</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="object[@contentType='en'][1]"/>
         </xsl:element>
         <xsl:element name="titleContent">
            <xsl:attribute name="contentType">
               <xsl:text>fr</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="object[@contentType='fr'][1]"/>
         </xsl:element>         
      </xsl:element>
   </xsl:template>
   <xsl:template match="title">
      <xsl:element name="titleContentChoices">
         <xsl:element name="titleContent">
            <xsl:attribute name="contentType">
               <xsl:text>en</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="object[@contentType='en'][1]"/>
         </xsl:element>
         <xsl:element name="titleContent">
            <xsl:attribute name="contentType">
               <xsl:text>fr</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="object[@contentType='fr'][1]"/>
         </xsl:element>         
      </xsl:element>
   </xsl:template>
   <xsl:template match="subtitle">
      <xsl:element name="titleContentChoices">
         <xsl:element name="titleContent">
            <xsl:attribute name="contentType">
               <xsl:text>en</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="object[@contentType='en'][1]"/>
         </xsl:element>
         <xsl:element name="titleContent">
            <xsl:attribute name="contentType">
               <xsl:text>fr</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="object[@contentType='fr'][1]"/>
         </xsl:element>         
      </xsl:element>
   </xsl:template>
   

   <!-- 
      Figure out if we need to ignore or copy this element
   -->
   <xsl:template name="IgnoreOrCopyElement">
      <xsl:variable name="contentType" select="id(@contentType)/@id"/>
      <xsl:variable name="inSet">
         <xsl:if test="$chosenContentTypes">
            <xsl:for-each select="$chosenContentTypes">
               <xsl:if test="@id = $contentType">x</xsl:if>
            </xsl:for-each>
         </xsl:if>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string-length($inSet) &gt; 0">
            <!-- ignore this one -->
         </xsl:when>
         <xsl:otherwise>
            <xsl:copy>
               <xsl:apply-templates select="@*"/>
               <xsl:apply-templates/>
            </xsl:copy>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
