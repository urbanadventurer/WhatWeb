##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Vivotek-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-19
version "0.1"
description "Vivotek Network Camera web interface"
website "http://www.vivotek.com/"

# ShodanHQ results as at 2011-09-19 #
# 2,262 for Network Camera -Authenticate



# Matches #
matches [

# /main.html
{ :url=>"/main.html", :text=>'<div id="logo_icon"><a href="http://www.vivotek.com/" target="_blank"><img alt="logo" src="pic/logo.gif"></a></div>' },

# Frameset
{ :certainty=>25, :regexp=>/<frameset rows="2000,0" border="0" frameborder="no" framespacing="0">[\s]+<frame name="mainframe" src="main\.html" marginheight="0" marginwidth="0">/ },

# HTTP Server Header
{ :certainty=>25, :search=>"headers[server]", :regexp=>/^(Network Camera|Network Dome Camera|Network Camera with Pan\/Tilt|Wireless Network Camera)$/ },

# /cgi-bin/admin/getparamjs.cgi?system
{ :url=>"/cgi-bin/admin/getparamjs.cgi", :model   =>/system_modelname="([^"]+)"/ },
{ :url=>"/cgi-bin/admin/getparamjs.cgi", :version =>/system_supportscriptversion="([^"]+)"/ },
{ :url=>"/cgi-bin/admin/getparamjs.cgi", :firmware=>/system_firmwareversion="([^"]+)"/ },
{ :url=>"/cgi-bin/admin/getparamjs.cgi", :string  =>/system_hostname="([^"]+)"/ },
{ :url=>"/cgi-bin/admin/getparamjs.cgi", :account =>/security_user(pass|name)\.[\d]{1,2}="([^"]+)"/, :offset=>1 },

# /setup/system.html
{ :url=>"/setup/system.html", :text=>'<script type="text/javascript" 	src="/cgi-bin/admin/getparamjs.cgi?system">' },

]

end

