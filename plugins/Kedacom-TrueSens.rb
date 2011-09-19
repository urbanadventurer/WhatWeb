##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kedacom-TrueSens" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-20
version "0.1"
description "Kedacom TrueSens videoconferencing system - Homepage: http://www.kedacom.co/defaulti.aspx?id=2"

# ShodanHQ results as at 2011-09-20 #
# 6,435 for KEDACOM-Webs

# Examples #
examples %w|
113.12.64.90
58.213.143.121
222.190.167.62
220.170.195.119
222.92.69.37
218.94.172.122
183.167.195.96
220.168.7.236
183.167.193.63
58.211.56.12
|

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

