##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kedacom-TrueSens" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-20
version "0.1"
description "Kedacom TrueSens videoconferencing system"
website "http://www.kedacom.co/defaulti.aspx?id=2"

# ShodanHQ results as at 2011-09-20 #
# 6,435 for KEDACOM-Webs



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^KEDACOM-Webs$/ },

# Redirect Page # /index.htm
{ :url=>"/index.htm", :text=>'<body><span style="font:12px;">Loading...</span></body>' },

# Logo HTML
{ :text=>'<img src="./img/kedacom-logo.jpg" alt="WEB CONSOLE" /></td>' },

]

end

