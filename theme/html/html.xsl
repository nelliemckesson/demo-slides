<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:func="http://exslt.org/functions"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:htmlbook="https://github.com/oreillymedia/HTMLBook"
                xmlns="http://www.w3.org/1999/xhtml"
                extension-element-prefixes="func"
                exclude-result-prefixes="h func">

  <xsl:output method="xml"
              encoding="UTF-8"/>
  <xsl:preserve-space elements="*"/>

<xsl:template match="h:section|h:div[contains(@data-type, 'part')]|h:aside|h:a[contains(@data-type, 'indexterm')]">
    <xsl:variable name="output-element-name">
      <xsl:call-template name="html.output.element"/>
    </xsl:variable>
<xsl:if test="@data-type='chapter'">
<section class="slide">
</xsl:if>
    <xsl:element name="{$output-element-name}" namespace="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates select="@*[not(local-name() = 'id')]"/>
      <xsl:attribute name="id">
        <xsl:call-template name="object.id"/>
      </xsl:attribute>
      <xsl:apply-templates select="." mode="pdf-bookmark"/>
      <xsl:apply-templates/>
      <xsl:if test="$process.footnotes = 1">
        <xsl:call-template name="generate-footnotes"/>
      </xsl:if>
    </xsl:element>
<xsl:if test="@data-type='chapter'">
  </section>
</xsl:if>
</xsl:template>
