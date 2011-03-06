##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated model detection
##
Plugin.define "Xerox-Printers" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "Xerox printers web interface - homepage: http://www.xerox.com/"

# Google results as at 2010-07-22 #
# 28 for "Phaser 6250" "Printer Neighborhood" "XEROX CORPORATION" -intitle
# 25 for intext:centreware inurl:status

# Examples #
examples %w|
130.236.83.191
accb8-2.usc.edu
xe.sbc.su.se
133.87.182.32
133.50.96.30
133.13.57.29
150.59.88.27
150.55.51.24
140.122.191.23
213.175.108.8/mpm_status.html
68.181.148.177/mpm_status.html
68.181.148.205/jobaccounting.html
3228rad.eecs.umich.edu/status.html
accb8-2.usc.edu/status.shtml
giotto.fisica.unimo.it/status.html
jordan-clr-laser.uchicago.edu/status/statgeneralx.htm
|

# Matches #
matches [

# Phaser 6250DP
{ :text=>'Phaser 6250DP</title>', :model=>["Phaser 6250DP"] },
{ :text=>'Phaser 6250N</title>', :model=>["Phaser 6250N"] },

# Phaser 3300MFP
{ :text=>'<title> Home - Xerox Phaser 3300MFP </title>', :model=>["Phaser 3300MFP"] },

# DocuPrint N2125
{ :text=>'	<br><font class=s4 face="Arial,Helvetica" size=4 color="#0000FF"><b><font size=4>&nbsp;&nbsp;&nbsp;&nbsp;</font>DocuPrint N2125</b></font></td>', :model=>["DocuPrint N2125"] },

# Phaser 4500DT
{ :text=>'                              color=#008000 face="Arial,Helvetica" size=2>Phaser 4500DT</font></td>', :model=>["Phaser 4500DT"] },

# Phaser 7700DN
{ :text=>'<td valign=top width=85><font class=s2 face="Arial,Helvetica" size=2 color="#008000"> Phaser 7700DN </font></td>', :model=>["Phaser 7700DN"] },

# Phaser 8400DP-1
{ :text=>'                              color=#008000 face="Arial,Helvetica" size=2>Phaser 8400DP-1</font></td>', :model=>["Phaser 8400DP-1"] },

# Model Detection # Default Title
{ :model=>/<title>(FX[0-9A-Z]{6})-Home<\/title>/ },

]

end

