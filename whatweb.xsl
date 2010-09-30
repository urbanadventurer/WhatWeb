<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="log">
<html>
<head>
<title>WhatWeb Report</title>
<style>*{padding:0;margin:0;}body,html{background:#ccc;font:medium "arial", "sans-serif";}#container{background-color:#ffffff;border:1px solid #cccccc;margin: 0px auto -1px auto;width:730px;}h1{width:100%;border:1px #000 solid;background:#eeeeee;}p{padding:10px;}table{margin-bottom:20px;}td{width:50%;}.target{background:#eee;border:1px solid #cccccc;}</style>
</head>
<body>

<table id="container">

  <xsl:for-each select="target">
	<tr><td class="target" colspan="2"><strong><xsl:value-of select="uri"/></strong> [<xsl:value-of select="http-status"/>]</td></tr>
	  <xsl:for-each select="plugin">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 0">
					<tr><td><xsl:value-of select="name"/></td>
					<td><xsl:value-of select="string"/></td></tr>
				</xsl:when>
				<xsl:otherwise>
					<tr><td bgcolor="#eee"><xsl:value-of select="name"/></td>
					<td bgcolor="#eee"><xsl:value-of select="string"/></td></tr>
				</xsl:otherwise>
			</xsl:choose>
	  </xsl:for-each>
  </xsl:for-each>

</table>

</body>
</html>
</xsl:template>

</xsl:stylesheet>
