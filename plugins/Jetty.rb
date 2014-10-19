##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Jetty" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-22
version "0.1"
description "Jetty is a pure Java application server. Jetty provides an HTTP server, HTTP client, and javax.servlet container."
website "http://jetty.codehaus.org/jetty/"

# ShodanHQ results as at 2011-08-22 #
# 18,555 for Jetty

# Google results as at 2011-08-22 #
# 68 for inurl:"snoop.jsp" intitle:Snoop
# 45 for intitle:"Powered By Jetty"

# Dorks #
dorks [
'intitle:"JSP snoop page" "WebApp JSP Snoop page"'
]



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Jetty(\/|\()([^\s^\)]+)/, :offset=>1 },

# Servlet Version Detection # Servlet-Engine Header
{ :search=>"headers[servlet-engine]", :module=>/^(Jetty\/[^\s]+)/ },

# Logo HTML
{ :url=>"/", :text=>'<A HREF="http://jetty.mortbay.org"><IMG SRC="jetty_banner.gif"></A>' },

# Error page # Powered by footer
{ :text=>'<p><i><small><a href="http://jetty.mortbay.org">Powered by Jetty://</a></small></i></p>' },

]

end

