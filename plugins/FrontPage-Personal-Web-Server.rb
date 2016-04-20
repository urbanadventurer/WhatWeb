##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "FrontPage-Personal-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.2"
description "Microsoft Personal Web Server (PWS) is a scaled-down web server software for Windows operating systems. It has fewer features than Microsoft's Internet Information Services (IIS) and its functions have been superseded by IIS and Visual Studio. Since Windows 2000 and FrontPage 2000, PWS was replaced by IIS as a standard Windows component. Personal Web Server was originally created by Vermeer Technologies, the same company which created Microsoft FrontPage, before they were acquired by Microsoft."
website "http://www.microsoft.com/"

# More Info #
# http://www.microsoftbob.com/post/History-of-the-FrontPage-Personal-Web-Server.aspx
# http://en.wikipedia.org/wiki/Microsoft_Personal_Web_Server

# ShodanHQ results as at 2011-06-04 #
# 9 for FPWS

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/^FPWS\/([^\s]+)/, :search=>"headers[server]" },
	{ :regexp=>/^FPWS/, :search=>"headers[server]" },
]

end

