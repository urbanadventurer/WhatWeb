##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BroadWin-WebAccess" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-03
version "0.1"
description "BroadWin WebAccess is a web browser-based software package for human-machine interfaces (HMI), and supervisory control and data acquisition (SCADA)."
website "http://broadwin.com/Client.htm"

# ShodanHQ results as at 2011-09-03 #
# 150 for broadWeb

# Google results as at 2011-09-03 #
# 13 for inurl:"broadweb/bwconfig.asp"

# Dorks #
dorks [
'inurl:"broadweb/bwconfig.asp"'
]



# Matches #
matches [

# /favicon.ico
{ :url=>"/favicon.ico", :md5=>"e852c819348eb49dcc549cd594e776ee" },

# Frameset # Frame
{ :text=>'<frame marginheight="0" marginwidth="0" name="rightRunFrame" noresize src="bwRunRight.asp">' },

# HTML Comment
{ :text=>'<html><!-- #BeginTemplate "/Templates/bw_templete1.dwt" -->' },

# /broadWeb/opman/opman.htm # Title
#{ :url=>"/broadWeb/opman/opman.htm", :text=>'<title>Operator Manual</title>' },

# /broadWeb/bwconfig.asp # Form
{ :text=>'<form name="login" action="/broadweb/user/signin.asp" method="post" onSubmit="return validateUserName()">' },

# /broadWeb/user/signinonly.asp
#{ :url=>"/broadWeb/user/signinonly.asp", :text=>'window.top.location.replace("/broadweb/bwroot.asp?username=admin");' },

# /broadWeb/bwroot.asp # Version Detection
{ :version=>/<div style="position:relative;top:15;width:870px; height:15px">[\s]+<font class=e5>[^:^<]+ : ([\d\.]+-[\d]{4}\.[\d]{2}\.[\d]{2})<\/font>[\s]+<\/div>/ },

# Location Header
{ :search=>"headers[location]", :account=>/^\.\/broadWeb\/bwRoot\.asp\?username=([^\s^&]+)$/ },

]

end

