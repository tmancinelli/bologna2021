<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" />

  <!-- All starts here! -->
  <xsl:template match="/">
    <xsl:apply-templates select="/tei:TEI/tei:teiHeader" />
  </xsl:template>

  <!-- This creates the html page from the teiHeader -->
  <xsl:template match="tei:teiHeader">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    
    <head>
      <title><xsl:value-of select=".//tei:title" /></title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    
    <body>
      <h1><xsl:value-of select=".//tei:title" /></h1>
      <h3>File Description</h3>
      <xsl:choose>
        <xsl:when test="./tei:fileDesc">
          <xsl:apply-templates select="./tei:fileDesc" />
        </xsl:when>
        <xsl:otherwise>
          <p>No File Description found</p>
        </xsl:otherwise>
      </xsl:choose>

      <h3>Encoding Description</h3>
      <xsl:choose>
        <xsl:when test="./tei:encodingDesc">
          <xsl:apply-templates select="./tei:encodingDesc" />
        </xsl:when>
        <xsl:otherwise>
          <p>No Encoding Description found</p>
        </xsl:otherwise>
      </xsl:choose>

      <h3>Profile Description</h3>
      <xsl:choose>
        <xsl:when test="./tei:profileDesc">
          <xsl:apply-templates select="./tei:profileDesc" />
        </xsl:when>
        <xsl:otherwise>
          <p>No Profile Description found</p>
        </xsl:otherwise>
      </xsl:choose>
    
      <h3>Revision Description</h3>
      <xsl:choose>
        <xsl:when test="./tei:revisionDesc">
          <xsl:apply-templates select="./tei:revisionDesc" />
        </xsl:when>
        <xsl:otherwise>
          <p>No Revision Description found</p>
        </xsl:otherwise>
      </xsl:choose>
    
    </body>
    </html>
  </xsl:template>

  <!-- File Description -->
  <xsl:template match="tei:fileDesc">
    <table>
      <xsl:apply-templates select="tei:titleStmt" />
      <xsl:apply-templates select="tei:publicationStmt" />
      <xsl:apply-templates select="tei:sourceDesc" />
    </table>
  </xsl:template>

  <xsl:template match="tei:titleStmt">
    <tr><td>Title</td><td><xsl:value-of select="tei:title" /></td></tr>
    <tr><td>Funder</td><td><xsl:value-of select="tei:funder" /></td></tr>
    <tr><td>Author</td><td><xsl:value-of select="tei:author" /></td></tr>
    <tr><td>Principal</td><td><xsl:value-of select="tei:principal" /></td></tr>
  </xsl:template>

  <xsl:template match="tei:publicationStmt">
    <tr><td>Publisher</td><td><xsl:value-of select="tei:publisher" /></td></tr>
    <tr><td>Publication Place</td><td><xsl:value-of select="tei:pubPlace" /></td></tr>
    <tr><td>Distribution</td><td><xsl:value-of select="tei:distribution" /></td></tr>
    <tr><td>Date</td><td><xsl:value-of select="tei:date" /></td></tr>
    <!-- in theory we should have a for-each for tei:availability -->
    <tr><td>Availability</td><td><xsl:value-of select="tei:availability" /></td></tr>
  </xsl:template>

  <xsl:template match="tei:sourceDesc">
    <!-- TODO -->
  </xsl:template>

  <!-- Encoding description -->
  <xsl:template match="tei:encodingDesc">
    <!-- Something better here? -->
    <xsl:apply-templates select="*" />
  </xsl:template>

  <!-- Profile description -->
  <xsl:template match="tei:profileDesc">
    <!-- Something better here? -->
    <xsl:apply-templates select="*" />
  </xsl:template>

  <!-- Revision description -->
  <xsl:template match="tei:revisionDesc">
    <!-- Something better here? -->
    <xsl:apply-templates select="*" />
  </xsl:template>

</xsl:stylesheet>

