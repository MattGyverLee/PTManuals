<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match=
        "*[not(node())]
        |
        *[not(node()[2])
        and
        node()/self::text()
        and
        not(normalize-space())
        ]
        "/>
</xsl:stylesheet>