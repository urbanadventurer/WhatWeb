##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Spring-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-12
version "0.1"
description "Spring Framework is an open source application framework for the Java platform. - Homepage: http://www.springsource.org/"

# ShodanHQ results as at 2011-09-12 #
# 20 for springframework

# Examples #
examples %w|
192.85.242.2
70.42.226.26
206.31.22.197
80.74.135.141
190.3.109.209
59.42.254.5
221.186.145.166
|

# Matches #
matches [

# org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE Cookie
{ :search=>"headers[set-cookie]", :text=>'org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE=' },

]

end

