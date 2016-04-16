##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Wildcat" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-04
version "0.1"
description "Wildcat! Interactive Net Server - includes and combines SSL (Secured Socket Layer), WEB, SMTP/POP3 (EMAIL), FTP, TELNET, RADIUS, NNTP (News) Server, PPP server, Terminal Server, direct modem dial up technology with a secured User, Mail and File Database"
website "http://www.santronics.com/index.php"

# ShodanHQ results as at 2011-09-04 #
# 165 for wildcat



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^[wW]ildcat\/v([^\s]+)/ },

# Version Detection # X-Powered-By Header
{ :search=>"headers[x-powered-by]", :version=>/Wildcat.Net v([^\s]+)/ },

]

end

