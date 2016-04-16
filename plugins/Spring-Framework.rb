##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Spring-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-12
version "0.1"
description "Spring Framework is an open source application framework for the Java platform."
website "http://www.springsource.org/"

# ShodanHQ results as at 2011-09-12 #
# 20 for springframework



# Matches #
matches [

# org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE Cookie
{ :search=>"headers[set-cookie]", :text=>'org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE=' },

]

end

