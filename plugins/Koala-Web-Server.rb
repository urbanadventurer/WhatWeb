##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Koala-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-23
version "0.1"
description "Koala is an HTTP server written in Dylan programming language."
website "http://wiki.opendylan.org/wiki/view.dsp?title=Koala"

# ShodanHQ results as at 2011-11-23 #
# 17 for Koala Web Server



# Matches #
matches [

# HTTP Header # Server
{ :search=>"headers[server]", :regexp=>/^Koala Web Server/ },

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/^Koala Web Server\/([^\s]+)/ },

]

end

