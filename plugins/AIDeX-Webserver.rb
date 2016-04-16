##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AIDeX-Webserver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-29
version "0.1"
description "AIDeX Webserver - does not support CGI or PHP"
website "http://www.aidex.de/software/webserver/"

# ShodanHQ results as at 2011-08-29 #
# 272 for aidex

# Google results as at 2011-08-29 #
# 29 for intitle:"Directory Listing" +"Directory Listing" +"Powered by AIDeX Webserver"

# Dorks #
dorks [
'intitle:"Directory Listing" "Directory Listing" "Powered by AIDeX Webserver"'
]



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^aidex\/([^\s]+)/ },

# Directory Listing # Powered by text
{ :text=>'<br><small>Powered by <a href="http://www.aidex.de/software/webserver/" target="_blank">AIDeX Webserver</a></small></div></div><br><br><br>' },

]

end

