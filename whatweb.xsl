<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="log">
<html>
<head>
<title>WhatWeb Scan Report</title>
<style>
*{padding:0;margin:0;}
body,html{background:#fff;font:9pt Verdana, Helvetica, sans-serif;}
#container{text-align:left;margin: 10px auto;width: 90%;}
h1{padding:5px;font-size:1.5em;color:#fff;background:#2A0D45;}
h2{padding:5px;font-size:1.2em;color:#000;background:#F0F8FF;}
p{padding:10px;}table{margin-bottom:20px;width:100%;}td{vertical-align:top;}
.toplink{color:#ff5a00;text-decoration:none;float:right;}
.target{background:#eee;border:1px solid #F0F8FF;}
#top{background:#fff;padding:5px;position:fixed;bottom:0px;right:0px;}
a{color:#000;}a:hover{color:#000;}a:visited{color:#000;}
</style>
</head>
<body>

<!-- Container & Heading -->
<div id="container">
<h1>WhatWeb Scan Report</h1>
<table>
<tr height="20px"><td></td></tr>

	<!-- Summary -->
	<tr><td></td></tr>
	<tr><td colspan="2"><strong><h2>Scan Summary</h2></strong></td></tr>
	<tr height="20px"><td></td></tr>
	<tr><td colspan="2"><xsl:value-of select="count(target)"/> URLs scanned. Select a URL to view detailed results.</td></tr>
	<tr height="20px"><td></td></tr>

	<!-- Table of contents / List of URLs -->
	<tr class="target"><td>URL (<xsl:value-of select="count(target)"/>)</td><td>Matches (<xsl:value-of select="count(target/plugin)"/>)</td></tr>
  <xsl:for-each select="target">
		<xsl:sort order="ascending"/>
		<xsl:choose>
			<xsl:when test="position() mod 2 = 0">
				<tr bgcolor="#bbddbb"><td><a href="#{uri}"><xsl:value-of select="uri"/></a></td><td><xsl:for-each select="plugin"><xsl:value-of select="name"/><xsl:if test="position()!=last()">, </xsl:if></xsl:for-each></td></tr>
			</xsl:when>
			<xsl:otherwise>
				<tr bgcolor="#ccffcc"><td><a href="#{uri}"><xsl:value-of select="uri"/></a></td><td><xsl:for-each select="plugin"><xsl:value-of select="name"/><xsl:if test="position()!=last()">, </xsl:if></xsl:for-each></td></tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
	<tr height="20px"><td></td></tr>

	<!-- Detailed results -->
	<tr><td colspan="2"><strong><h2>Scan Results</h2></strong></td></tr>
	<tr height="20px"><td></td></tr>
  <xsl:for-each select="target">
		<xsl:sort order="ascending"/>
		<tr><td colspan="2" class="target"><strong><a name="{uri}"><xsl:value-of select="uri"/></a></strong> [<xsl:value-of select="http-status"/>]</td></tr>
	  <xsl:for-each select="plugin">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 0">
					<tr bgcolor="#ccffcc"><td><em><xsl:if test="certainty &gt; 0 and certainty &lt; 50">(Maybe) </xsl:if><xsl:if test="certainty &gt; 49 and certainty &lt; 100">(Probably) </xsl:if><xsl:value-of select="name"/></em></td><td bgcolor="#ccffcc">
					<xsl:if test="certainty"><tr bgcolor="#ccffcc"><td>Certainty: <xsl:value-of select="certainty"/>%</td></tr></xsl:if>
					<xsl:if test="string"><tr bgcolor="#ccffcc"><td><xsl:value-of select="string"/></td></tr></xsl:if>
					<xsl:if test="os"><tr bgcolor="#ccffcc"><td>Operating System: <xsl:value-of select="os"/></td></tr></xsl:if>
					<xsl:if test="version"><tr bgcolor="#ccffcc"><td>Version: <xsl:value-of select="version"/></td></tr></xsl:if>
					<xsl:if test="model"><tr bgcolor="#ccffcc"><td>Model: <xsl:value-of select="model"/></td></tr></xsl:if>
					<xsl:if test="firmware"><tr bgcolor="#ccffcc"><td>Firmware: <xsl:value-of select="firmware"/></td></tr></xsl:if>
					<xsl:if test="filepath"><tr bgcolor="#ccffcc"><td>Filepath: <xsl:value-of select="filepath"/></td></tr></xsl:if>
					<xsl:if test="account"><tr bgcolor="#ccffcc"><td>Account: <xsl:value-of select="account"/></td></tr></xsl:if>
					<xsl:if test="module"><tr bgcolor="#ccffcc"><td>Module: <xsl:value-of select="module"/></td></tr></xsl:if>
					</td></tr>
				</xsl:when>
				<xsl:otherwise>
					<tr bgcolor="#bbddbb"><td><em><xsl:if test="certainty &gt; 0 and certainty &lt; 50">(Maybe) </xsl:if><xsl:if test="certainty &gt; 49 and certainty &lt; 100">(Probably) </xsl:if><xsl:value-of select="name"/></em></td><td bgcolor="#bbddbb">
					<xsl:if test="certainty"><tr bgcolor="#bbddbb"><td>Certainty: <xsl:value-of select="certainty"/>%</td></tr></xsl:if>
					<xsl:if test="string"><tr bgcolor="#bbddbb"><td><xsl:value-of select="string"/></td></tr></xsl:if>
					<xsl:if test="os"><tr bgcolor="#bbddbb"><td>Operating System: <xsl:value-of select="os"/></td></tr></xsl:if>
					<xsl:if test="version"><tr bgcolor="#bbddbb"><td>Version: <xsl:value-of select="version"/></td></tr></xsl:if>
					<xsl:if test="model"><tr bgcolor="#bbddbb"><td>Model: <xsl:value-of select="model"/></td></tr></xsl:if>
					<xsl:if test="firmware"><tr bgcolor="#bbddbb"><td>Firmware: <xsl:value-of select="firmware"/></td></tr></xsl:if>
					<xsl:if test="filepath"><tr bgcolor="#bbddbb"><td>Filepath: <xsl:value-of select="filepath"/></td></tr></xsl:if>
					<xsl:if test="account"><tr bgcolor="#bbddbb"><td>Account: <xsl:value-of select="account"/></td></tr></xsl:if>
					<xsl:if test="module"><tr bgcolor="#bbddbb"><td>Module: <xsl:value-of select="module"/></td></tr></xsl:if>
					</td></tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<tr><td></td><td><a class="toplink" href="#" title="Return to top">^</a></td></tr>
	</xsl:for-each>
</table>

</div><div id="top"><a class="toplink" href="#" title="Return to top">Return to top</a></div>

</body>
</html>
</xsl:template>

</xsl:stylesheet>
