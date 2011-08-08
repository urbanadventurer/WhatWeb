##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netsweeper" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "Netsweeper provides internet content filtering and web threat management solutions that foster employee productivity, student safety and secure Internet access. - Homepage: http://www.netsweeper.com/"

# Google results as at 2011-05-12 #
# 11 for inurl:"8080/webadmin/deny/index.php"

# ShodanHQ results as at 2011-05-12 #
# 27 for 8080/webadmin/deny/index.php

# Dorks #
dorks [
'inurl:"8080/webadmin/deny/index.php"'
]

# Examples #
examples %w|
216.171.98.106:8080
216.171.102.133:8080
ns-hoover.spg.more.net:8080
202.12.92.167:8080
webdefender.inty.net:8080
87.232.1.48:8080
200.41.117.132:8080
82.114.160.93:8080
vpn.dcps.net:8080
ironxns.ironcounty.net:8080
168.187.210.253:8080
207.160.64.92
152.179.110.166
207.160.64.91
207.160.64.245
204.184.213.98
216.241.207.67
216.241.207.69
216.241.207.70
216.241.207.71
216.241.207.72
216.241.207.73
216.241.207.74
216.241.207.75
216.241.207.76
216.241.207.77
216.241.207.78
216.241.207.79
216.241.207.80
|

# Matches #
matches [

# overDiv
{ :text=>'<DIV id="overDiv" style="position:absolute; visibility:hidden; z-index:104;"></DIV>' },
{ :text=>'<div id="overDiv" style="position:absolute; visibility:hidden; z-index:104;"></div>' },

# HTML Comment
{ :text=>"<!-- Body of content starts here -->" },

# footer span class
{ :text=>"<BR><SPAN class='netsweepersmbtextatbottomofloginscreen'>" },
{ :text=>"<br><span class='netsweepersmbtextatbottomofloginscreen'>" },

# Redirect page # HTML comment
{ :text=>"<!-- full_page_header.html START -->" },
{ :text=>"<!-- full_page_footer.html START-->" },

# Redirect page # continue link
{ :text=>'<a target=_parent href="../" >Please click <u>here</u> to continue.</a>' },

# powered by footer
{ :text=>'<a href="http://www.poweredbynetsweeper.com"><img src="http://www.poweredbynetsweeper.com/images/deny/global/poweredbynetsweeper.gif" border="0" alt="" align="top" /></a></td>' },
{ :text=>'<a href="http://www.poweredbynetsweeper.com"><img align=top border=0 src="http://www.poweredbynetsweeper.com/images/deny/global/poweredbynetsweeper.gif"></a>' },

]

# Passive #
def passive
	m=[]

	# webadmin cookie
	m << { :name=>"webadmin cookie" } if @headers["set-cookie"] =~ /webadmin=[a-z\d]{26}/

	# Redirect location header
	m << { :name=>"Redirect location header" } if @headers["location"] =~ /\/webadmin\/deny\/index\.php\?dpid=[\d]+&dpruleid=[\d]+&/

	# Return passive matches
	m
end

end


