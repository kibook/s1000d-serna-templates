<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:attribute-set name="verbatim">
    <xsl:attribute name="font-family">Courier</xsl:attribute>
    <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
    <xsl:attribute name="white-space">pre</xsl:attribute>
    <xsl:attribute name="white-space-collapse">false</xsl:attribute>
    <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="centerhead1">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="padding-top">16pt</xsl:attribute>
    <xsl:attribute name="start-indent">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="centerhead2">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="padding-top">16pt</xsl:attribute>
    <xsl:attribute name="start-indent">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="sidehead0">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="padding-top">16pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="sidehead1">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="padding-top">16pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="sidehead2">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="padding-top">14pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="sidehead3">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="padding-top">11pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="sidehead4">
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="padding-top">11pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="sidehead5">
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="padding-top">11pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="table">
    <xsl:attribute name="table-layout">fixed</xsl:attribute>
    <xsl:attribute name="width">100%</xsl:attribute>
    <xsl:attribute name="border-top-color">black</xsl:attribute>
    <xsl:attribute name="border-top-width">0.5pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
    <xsl:attribute name="border-bottom-width">0.5pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="header-cell">
    <xsl:attribute name="border-bottom-width">0.5pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:param name="page-height">297mm</xsl:param>
  <xsl:param name="page-width">210mm</xsl:param>
  <xsl:param name="page-margin-left">25mm</xsl:param>
  <xsl:param name="page-margin-right">15mm</xsl:param>

  <xsl:param name="standard-leading">8pt</xsl:param>
  <xsl:param name="inner-type-limit">20mm</xsl:param>

  <xsl:param name="font-family">Helvetica</xsl:param>

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="page" page-height="{$page-height}" page-width="{$page-width}">
          <fo:region-body margin-left="{$page-margin-left}" margin-right="{$page-margin-right}"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body" font-size="10pt" font-family="{$font-family}">
          <fo:block>
            <xsl:apply-templates select="*"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="dmodule">
    <xsl:call-template name="header"/>
    <fo:block border-top-width="0.5pt" border-top-color="black" border-bottom-width="0.5pt" border-bottom-color="black" padding-bottom="20mm">
      <xsl:apply-templates select="identAndStatusSection/dmAddress/dmAddressItems/dmTitle"/>
      <xsl:apply-templates select="content"/>
    </fo:block>
    <xsl:call-template name="footer"/>
  </xsl:template>

  <xsl:template match="identAndStatusSection">
    <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle"/>
  </xsl:template>

  <xsl:template name="header">
    <fo:block font-weight="bold" text-align="center" padding-bottom="5mm">Unclassified</fo:block>
  </xsl:template>

  <xsl:template name="footer">
    <fo:block font-weight="bold">
      <fo:table table-layout="fixed" table-width="100%">
        <fo:table-column column-width="proportional-column-width(1)"/>
        <fo:table-column column-width="proportional-column-width(1)"/>
        <fo:table-column column-width="proportional-column-width(1)"/>
        <fo:table-body>
          <fo:table-row>
            <fo:table-cell text-align="left">
              <fo:block>
                <xsl:text>Applicable to: </xsl:text>
                <xsl:apply-templates select="identAndStatusSection/dmStatus/applic/displayText"/>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell text-align="center">
              <fo:block>End of data module</fo:block>
            </fo:table-cell>
            <fo:table-cell text-align="right">
              <fo:block>
                <xsl:apply-templates select="identAndStatusSection/dmAddress/dmIdent/dmCode"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template match="simplePara">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="dmCode">
    <xsl:value-of select="@modelIdentCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@systemDiffCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@systemCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@subSystemCode"/>
    <xsl:value-of select="@subSubSystemCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@assyCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@disassyCode"/>
    <xsl:value-of select="@disassyCodeVariant"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@infoCode"/>
    <xsl:value-of select="@infoCodeVariant"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="@itemLocationCode"/>

    <xsl:if test="@learnCode and @learnEventCode">
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@learnCode"/>
      <xsl:value-of select="@learnEventCode"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="dmTitle">
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="techName">
    <fo:block xsl:use-attribute-sets="centerhead1">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="infoName">
    <fo:block xsl:use-attribute-sets="centerhead2">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="content">
    <xsl:call-template name="table-of-contents"/>
    <xsl:call-template name="list-of-tables"/>
    <xsl:call-template name="list-of-figures"/>
    <xsl:call-template name="references"/>
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template name="references">
    <fo:block>
      <fo:block xsl:use-attribute-sets="centerhead2">References</fo:block>
      <fo:block padding-top="{$standard-leading}">
        <fo:block text-align="center" font-style="italic">Table 1  References</fo:block>
        <fo:table table-layout="fixed" width="100%" border-top-width="0.5pt" border-top-color="black" border-bottom-width="0.5pt" border-bottom-color="black">
          <fo:table-column column-width="proportional-column-width(1)"/>
          <fo:table-column column-width="proportional-column-width(1)"/>
          <fo:table-header font-weight="bold">
            <fo:table-row>
              <fo:table-cell border-bottom-color="black" border-bottom-width="0.5pt">
                <fo:block>Data module/Technical publication</fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom-color="black" border-bottom-width="0.5pt">
                <fo:block>Title</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>
          <fo:table-body>
            <xsl:choose>
              <xsl:when test="refs">
                <xsl:apply-templates select="refs/*" mode="refs"/>
              </xsl:when>
              <xsl:otherwise>
                <fo:table-row>
                  <fo:table-cell>
                    <fo:block>None</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:otherwise>
            </xsl:choose>
          </fo:table-body>
        </fo:table>
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template name="table-of-contents">
    <fo:block>
      <fo:block xsl:use-attribute-sets="sidehead0">Table of contents</fo:block>
      <fo:table table-layout="fixed" width="100%" start-indent="{$inner-type-limit}">
        <fo:table-column column-width="proportional-column-width(1)"/>
        <fo:table-column column-width="proportional-column-width(1)"/>
        <fo:table-body>
          <xsl:apply-templates select="*" mode="toc"/>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template name="list-of-figures">
    <xsl:variable name="figures" select=".//figure"/>
    <xsl:if test="$figures">
      <fo:block>
        <fo:block xsl:use-attribute-sets="sidehead0">List of figures</fo:block>
        <fo:table table-layout="fixed" width="100%" start-indent="{$inner-type-limit}">
          <fo:table-column column-width="proportional-column-width(1)"/>
          <fo:table-column column-width="proportional-column-width(1)"/>
          <fo:table-body>
            <xsl:apply-templates select="$figures" mode="lof"/>
          </fo:table-body>
        </fo:table>
      </fo:block>
    </xsl:if>
  </xsl:template>

  <xsl:template name="list-of-tables">
    <fo:block>
      <fo:block xsl:use-attribute-sets="sidehead0">List of tables</fo:block>
      <fo:table table-layout="fixed" width="100%" start-indent="{$inner-type-limit}">
        <fo:table-column column-width="proportional-column-width(1)"/>
        <fo:table-column column-width="proportional-column-width(1)"/>
        <fo:table-body>
          <fo:table-row>
            <fo:table-cell text-align="left">
              <fo:block>References</fo:block>
            </fo:table-cell>
            <fo:table-cell text-align="right">
              <fo:block>1</fo:block>
            </fo:table-cell>
          </fo:table-row>
          <xsl:apply-templates select=".//table" mode="lotbl"/>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template match="refs" mode="lotbl">
    <fo:table-row>
      <fo:table-cell text-align="left">
        <fo:block>References</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
        <fo:block>1</fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="table" mode="lotbl">
    <fo:table-row>
      <fo:table-cell text-align="left">
        <fo:block>
          <xsl:value-of select="title"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
        <fo:block>1</fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="figure" mode="lof">
    <fo:table-row>
      <fo:table-cell text-align="left">
        <fo:block>
          <xsl:value-of select="title"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
        <fo:block>1</fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="*" mode="toc"/>

  <xsl:template match="description" mode="toc">
    <fo:table-row>
      <fo:table-cell text-align="left">
        <fo:block>Description</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
        <fo:block>1</fo:block>
      </fo:table-cell>
    </fo:table-row>
    <xsl:apply-templates select="*" mode="toc"/>
  </xsl:template>

  <xsl:template match="procedure" mode="toc">
    <xsl:apply-templates select="*" mode="toc"/>
  </xsl:template>

  <xsl:template match="preliminaryRqmts" mode="toc">
    <fo:table-row>
      <fo:table-cell text-align="left">
        <fo:block>Preliminary requirements</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
        <fo:block>1</fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="mainProcedure" mode="toc">
    <fo:table-row>
      <fo:table-cell text-align="left">
        <fo:block>Procedure</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
        <fo:block>1</fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="preliminaryRqmts">
    <fo:block xsl:use-attribute-sets="centerhead2">Preliminary requirements</fo:block>
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="mainProcedure">
    <fo:block xsl:use-attribute-sets="centerhead2">Procedure</fo:block>
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="levelledPara[title]|proceduralStep[title]" mode="toc">
    <fo:table-row>
      <fo:table-cell text-align="left">
        <fo:block>
          <xsl:apply-templates select="title" mode="toc"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
        <fo:block>1</fo:block>
      </fo:table-cell>
    </fo:table-row>
    <xsl:apply-templates select="*" mode="toc"/>
  </xsl:template>

  <xsl:template match="title" mode="toc">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="description">
    <fo:block xsl:use-attribute-sets="centerhead2">Description</fo:block>
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="levelledPara[title]|proceduralStep[title]">
    <fo:block>
      <xsl:apply-templates select="*"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="levelledPara|proceduralStep">
    <fo:block padding-top="{$standard-leading}">
      <fo:list-block provisional-distance-between-starts="{$inner-type-limit}">
        <fo:list-item>
          <fo:list-item-label end-indent="label-end()">
            <fo:block>
              <xsl:apply-templates select="." mode="number"/>
            </fo:block>
          </fo:list-item-label>
          <fo:list-item-body start-indent="body-start()">
            <fo:block>
              <xsl:apply-templates select="*[1]"/>
            </fo:block>
          </fo:list-item-body>
        </fo:list-item>
      </fo:list-block>
      <xsl:apply-templates select="*[position() != 1]"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="levelledPara" mode="number">
    <xsl:number count="levelledPara" level="multiple" from="dmodule"/>
  </xsl:template>

  <xsl:template match="proceduralStep" mode="number">
    <xsl:number count="proceduralStep" level="multiple" from="dmodule"/>
  </xsl:template>

  <xsl:template match="levelledPara" mode="label">
    <xsl:text>Para </xsl:text>
    <xsl:apply-templates select="." mode="number"/>
  </xsl:template>

  <xsl:template match="proceduralStep" mode="label">
    <xsl:text>Step </xsl:text>
    <xsl:apply-templates select="." mode="number"/>
  </xsl:template>

  <xsl:template match="levelledPara/title|proceduralStep/title">
    <xsl:variable name="content">
      <fo:list-block provisional-distance-between-starts="{$inner-type-limit}">
        <fo:list-item>
          <fo:list-item-label end-indent="label-end()">
            <fo:block>
              <xsl:apply-templates select="parent::*" mode="number"/>
            </fo:block>
          </fo:list-item-label>
          <fo:list-item-body start-indent="body-start()">
            <fo:block>
              <xsl:apply-templates/>
            </fo:block>
          </fo:list-item-body>
        </fo:list-item>
      </fo:list-block>
    </xsl:variable>
    <xsl:variable name="level" select="count(ancestor::levelledPara|ancestor::proceduralStep)"/>
    <xsl:choose>
      <xsl:when test="$level = 1">
        <fo:block xsl:use-attribute-sets="sidehead1">
          <xsl:copy-of select="$content"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level = 2">
        <fo:block xsl:use-attribute-sets="sidehead2">
          <xsl:copy-of select="$content"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level = 3">
        <fo:block xsl:use-attribute-sets="sidehead3">
          <xsl:copy-of select="$content"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level = 4">
        <fo:block xsl:use-attribute-sets="sidehead4">
          <xsl:copy-of select="$content"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level = 5">
        <fo:block xsl:use-attribute-sets="sidehead5">
          <xsl:copy-of select="$content"/>
        </fo:block>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="para">
    <fo:block>
      <xsl:if test="not(parent::entry)">
        <xsl:attribute name="start-indent">
          <xsl:value-of select="$inner-type-limit"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="preceding-sibling::*[not(self::title)]">
        <xsl:attribute name="padding-top">
          <xsl:value-of select="$standard-leading"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="verbatimText">
    <fo:inline xsl:use-attribute-sets="verbatim">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs11' or
                                    @verbatimStyle = 'vs23' or
                                    @verbatimStyle = 'vs24']">
    <fo:block xsl:use-attribute-sets="verbatim">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="figure">
    <fo:block>
      <xsl:apply-templates select="graphic"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="figure" mode="number">
    <xsl:number count="figure" level="any" from="dmodule"/>
  </xsl:template>

  <xsl:template match="figure" mode="title">
    <xsl:apply-templates select="title" mode="title"/>
  </xsl:template>

  <xsl:template match="title" mode="title">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="graphic">
    <fo:block text-align="center" padding-top="{$standard-leading}">
      <fo:external-graphic src="unparsed-entity-uri(@infoEntityIdent)"/>
      <fo:block text-align="right">
        <xsl:value-of select="@infoEntityIdent"/>
      </fo:block>
      <fo:block font-style="italic">
        <xsl:text>Fig </xsl:text>
        <xsl:number count="figure" level="any" from="dmodule"/>
        <xsl:apply-templates select="parent::figure" mode="number"/>
        <xsl:text>  </xsl:text>
        <fo:inline>
          <xsl:apply-templates select="parent::figure" mode="title"/>
        </fo:inline>
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template match="emphasis">
    <fo:inline font-weight="bold">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="emphasis[@emphasisType = 'em02']">
    <fo:inline font-style="italic">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="emphasis[@emphasisType = 'em03']">
    <fo:inline text-decoration="underline">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="inlineSignificantData">
    <fo:inline>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="acronym">
    <fo:inline>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="acronymTerm">
    <fo:inline>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="acronymDefinition">
    <fo:inline>
      <xsl:text> (</xsl:text>
      <fo:inline>
        <xsl:apply-templates/>
      </fo:inline>
      <xsl:text>)</xsl:text>
    </fo:inline>
  </xsl:template>

  <xsl:template match="warning">
    <fo:block padding-top="14pt">
      <fo:block text-align="center" font-weight="bold" font-size="12pt" text-decoration="underline">WARNING</fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="warningAndCautionPara">
    <fo:block padding-top="{$standard-leading}" start-indent="{$inner-type-limit}">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="caution">
    <fo:block padding-top="14pt">
      <fo:block text-align="center" font-weight="bold" font-size="12pt">CAUTION</fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="dmRef">
    <xsl:apply-templates select="dmRefIdent/dmCode"/>
  </xsl:template>

  <xsl:template match="pmRef">
    <xsl:apply-templates select="pmRefIdent/pmCode"/>
  </xsl:template>

  <xsl:template match="pmCode">
    <xsl:value-of select="modelIdentCode"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="pmIssuer"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="pmNumber"/>
    <xsl:text>-</xsl:text>
    <xsl:value-of select="pmVolume"/>
  </xsl:template>

  <xsl:template match="table">
    <fo:block padding-top="{$standard-leading}">
      <fo:block border-top-color="black" border-top-width="0.5pt" border-bottom-color="black" border-bottom-width="0.5pt">
        <xsl:attribute name="start-indent">
          <xsl:choose>
            <xsl:when test="@pgwide and @pgwide != 0">0pt</xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$inner-type-limit"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:apply-templates select="*"/>
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template match="table" mode="number">
    <xsl:number count="content|table" level="any" from="dmodule"/>
  </xsl:template>

  <xsl:template match="table" mode="label">
    <xsl:text>Table </xsl:text>
    <xsl:apply-templates select="." mode="number"/>
  </xsl:template>

  <xsl:template match="tgroup">
    <fo:table table-layout="fixed" width="100%">
      <xsl:apply-templates select="*"/>
    </fo:table>
  </xsl:template>

  <xsl:template match="colspec">
    <fo:table-column>
      <xsl:apply-templates select="@colwidth"/>
    </fo:table-column>
  </xsl:template>

  <xsl:template match="@colwidth">
    <xsl:attribute name="column-width">
      <xsl:choose>
        <xsl:when test="contains(., '*')">
          <xsl:value-of select="concat('proportional-column-width(', substring-before(., '*'), ')')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="thead">
    <fo:table-header font-weight="bold">
      <xsl:apply-templates select="*"/>
    </fo:table-header>
  </xsl:template>

  <xsl:template match="tbody">
    <fo:table-body>
      <xsl:apply-templates select="*"/>
    </fo:table-body>
  </xsl:template>

  <xsl:template match="row">
    <fo:table-row>
      <xsl:apply-templates select="*"/>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="entry">
    <fo:table-cell>
      <xsl:if test="parent::row/parent::thead">
        <xsl:attribute name="border-bottom-color">black</xsl:attribute>
        <xsl:attribute name="border-bottom-width">0.5pt</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="*"/>
    </fo:table-cell>
  </xsl:template>

  <xsl:template match="internalRef">
    <xsl:variable name="target-id" select="@internalRefId"/>
    <fo:inline color="blue" text-decoration="underline">
      <xsl:apply-templates select="//*[@id = $target-id]" mode="label"/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="reqCondGroup">
    <fo:block>
      <fo:block xsl:use-attribute-sets="sidehead0">Required conditions</fo:block>
      <fo:block padding-top="{$standard-leading}">
        <fo:table xsl:use-attribute-sets="table">
          <fo:table-header font-weight="bold">
            <fo:table-row>
              <fo:table-cell xsl:use-attribute-sets="header-cell">
                <fo:block>Action/Condition</fo:block>
              </fo:table-cell>
              <fo:table-cell xsl:use-attribute-sets="header-cell">
                <fo:block>Data module</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>
          <fo:table-body>
            <xsl:apply-templates select="*"/>
          </fo:table-body>
        </fo:table>
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template match="reqSupportEquips|reqSupplies|reqSpares">
    <fo:block>
      <fo:block xsl:use-attribute-sets="sidehead0">
        <xsl:choose>
          <xsl:when test="self::reqSupportEquips">Support equipment</xsl:when>
          <xsl:when test="self::reqSupplies">Consumables, materials and expendables</xsl:when>
          <xsl:when test="self::reqSpares">Spares</xsl:when>
        </xsl:choose>
      </fo:block>
      <fo:block padding-top="{$standard-leading}">
        <fo:table xsl:use-attribute-sets="table">
          <fo:table-header font-weight="bold">
            <fo:table-row>
              <fo:table-cell xsl:use-attribute-sets="header-cell">
                <fo:block>Name</fo:block>
              </fo:table-cell>
              <fo:table-cell xsl:use-attribute-sets="header-cell">
                <fo:block>Identification/Reference</fo:block>
              </fo:table-cell>
              <fo:table-cell xsl:use-attribute-sets="header-cell">
                <fo:block>Quantity</fo:block>
              </fo:table-cell>
              <fo:table-cell xsl:use-attribute-sets="header-cell">
                <fo:block>Remark</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>
          <fo:table-body>
            <xsl:apply-templates select="*"/>
          </fo:table-body>
        </fo:table>
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template match="noSupportEquips|noSupplies|noSpares|noConds">
    <fo:table-row>
      <fo:table-cell>
        <fo:block>None</fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="supportEquipDescr|supplyDescr|spareDescr">
    <fo:table-row>
      <fo:table-cell>
        <fo:block>
          <xsl:apply-templates select="name"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:apply-templates select="identNumber"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:apply-templates select="reqQuantity"/>
        </fo:block>
      </fo:table-cell>
      <xsl:if test="remarks">
        <fo:table-cell>
          <fo:block>
            <xsl:apply-templates select="remarks"/>
          </fo:block>
        </fo:table-cell>
      </xsl:if>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="name">
    <fo:inline>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="identNumber">
    <xsl:apply-templates select="manufacturerCode"/>
    <xsl:text>/</xsl:text>
    <xsl:apply-templates select="partAndSerialNumber/partNumber"/>
  </xsl:template>

  <xsl:template match="manufacturerCode">
    <fo:inline>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="partNumber">
    <fo:inline>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="reqQuantity">
    <fo:inline>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="reqCondNoRef">
    <fo:table-row>
      <fo:table-cell>
        <fo:block>
          <xsl:apply-templates select="reqCond"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="reqCond">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

</xsl:stylesheet>
