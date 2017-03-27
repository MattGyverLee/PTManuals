<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output indent="yes"></xsl:output>
    <xsl:template match="html">
        <xsl:element name="html">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="h">
        <xsl:element name="section">
            <xsl:element name="secTitle">
                <xsl:element name="object">
                    <xsl:attribute name="contentType">en</xsl:attribute>
                    <xsl:attribute name="type">t-en</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
                <xsl:element name="object">
                    <xsl:attribute name="contentType">fr</xsl:attribute>
                    <xsl:attribute name="type">t-fr</xsl:attribute>
                </xsl:element>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
<!--    <xsl:template match="span[@class='T1']">
        <xsl:element name="s">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>-->
    <xsl:template match="span[starts-with(@class,'ListLabel')]">
    </xsl:template>
    <xsl:template match="span[@class='T8']">
        <xsl:element name="object">
            <xsl:attribute name="type">tItalic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="p[@class='P100']">
        <ul>
            <li><ul>
                <li><xsl:apply-templates/></li>
            </ul></li>
        </ul>
    </xsl:template>
    
    <xsl:template match="p[ends-with(@class,'Bullet')]">
        <xsl:element name="ul">
            <xsl:element name="li">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="p[@class='P39']">
        <xsl:element name="chapter">
            <xsl:element name="secTitle">
                <xsl:element name="object">
                    <xsl:attribute name="contentType">
                        <xsl:text>en</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>        
                </xsl:element>
                <xsl:element name="object">
                    <xsl:attribute name="contentType">
                        <xsl:text>fr</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="p[@class='P40']">
        <xsl:element name="chapter">
            <xsl:element name="secTitle">
                <xsl:element name="object">
                    <xsl:attribute name="contentType">
                        <xsl:text>en</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>        
                </xsl:element>
                <xsl:element name="object">
                    <xsl:attribute name="contentType">
                        <xsl:text>fr</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="h2">
        <xsl:element name="section1">
            <xsl:element name="secTitle">
                <xsl:element name="object">
                    <xsl:attribute name="contentType">
                        <xsl:text>en</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>        
                </xsl:element>
                <xsl:element name="object">
                    <xsl:attribute name="contentType">
                        <xsl:text>fr</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="a">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="p">
        <xsl:choose>
<!--            <xsl:when test="./text()=' '"/>-->
            <!--<xsl:when test="./text()=''"/>-->
            <xsl:when test="parent::li">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="parent::td">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:text>&#10;</xsl:text>-->
                <xsl:element name="p">
                    <xsl:attribute name="contentType">en</xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@class='Teacher' or @class='P85'">
                            <xsl:element name="blockquote">
                                <xsl:attribute name="type">tTeacher</xsl:attribute>
                                <xsl:attribute name="contentType">en</xsl:attribute>
                                <xsl:apply-templates/>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test="@class='P94'">
                            <xsl:element name="p">
                                <xsl:attribute name="contentType">en</xsl:attribute>
                                <xsl:element name="object">
                                    <xsl:attribute name="type">tItalic</xsl:attribute>
                                    <xsl:apply-templates/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
<!--                            <xsl:call-template name="Smoothtext"/>-->
                            <xsl:apply-templates/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
                <!--<xsl:text>&#10;</xsl:text>-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="table">
        <xsl:element name="table">
            <xsl:attribute name="border">1</xsl:attribute>
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tr">
        <xsl:element name="tr">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="td">
        <xsl:element name="td">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="th">
        <xsl:element name="th">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="br">
        <xsl:element name="br"/>
    </xsl:template>
    <xsl:template match="ul">
        <xsl:choose>
            <xsl:when test="count(li)=92">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="ul">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="ol">
      <!--  <xsl:text>&#10;</xsl:text>-->
        <xsl:choose>
            <xsl:when test="count(li)=92">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="ol">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="li">
        <xsl:choose>
            <xsl:when test="count(../li)=92">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="./text()=' '">
                <xsl:text>****</xsl:text>
            </xsl:when>
            <xsl:when test="./text()=''">
                <xsl:text>****</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:text>&#10;</xsl:text>-->
                <xsl:element name="li">
                    <xsl:attribute name="contentType">en</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>      
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="img">
<!--        <xsl:choose>
            <xsl:when test="parent::not p] and parent::[not li]"></xsl:when>
        </xsl:choose>-->
        <xsl:element name="img">
            <xsl:attribute name="contentType">en</xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="@src"></xsl:value-of></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
        <!--<xsl:text>&#10;</xsl:text>-->
    </xsl:template>
    <xsl:template match="span[@class='User_20_Interface']">
        <xsl:element name="object">
            <xsl:attribute name="type">tKw</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
        <!--<xsl:text>&#10;</xsl:text>-->
    </xsl:template>
    <xsl:template match="head"/>
    <xsl:template name="Smoothtext">
        <xsl:value-of select="replace(.,'[\s\r\n]+',' ')"/>
    </xsl:template>
<!--    <xsl:template match="text()" >
        <xsl:value-of select="normalize-space(text())"/>
    </xsl:template>-->
</xsl:stylesheet>
