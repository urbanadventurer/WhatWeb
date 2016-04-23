##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netsweeper" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "Netsweeper provides internet content filtering and web threat management solutions that foster employee productivity, student safety and secure Internet access."
website "http://www.netsweeper.com/"

# Google results as at 2011-05-12 #
# 11 for inurl:"8080/webadmin/deny/index.php"

# ShodanHQ results as at 2011-05-12 #
# 27 for 8080/webadmin/deny/index.php

# Dorks #
dorks [
'inurl:"8080/webadmin/deny/index.php"'
]



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


