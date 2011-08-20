##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebSitePro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "WebSitePro is an HTTP web server for Microsoft Windows. The 16-bit web server software was originally developed by Bob Denny in 1994 for Windows 3.1. WebSite Professional is now published by Deerfield.com under the name Deerfield WebSite, as of August 20, 2001. - Homepage: http://website.ora.com/"

# More info #
# http://en.wikipedia.org/wiki/WebSitePro
# http://websitepro.com.ua/

# ShodanHQ results as at 2011-06-04 #
# 1,344 for WebSitePro

# Examples #
examples %w|
217.25.65.44
206.180.231.218
209.189.56.60
206.82.159.103
209.189.56.173
68.123.18.136
208.187.248.152
208.187.250.120
216.174.158.220
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^WebSitePro\/([^\s]+)/ },

]

end

