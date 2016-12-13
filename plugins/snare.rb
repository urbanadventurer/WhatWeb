##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Snare" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-12
version "0.1"
description "Snare - Snare Server Remote Control web interface"
website "http://www.intersectalliance.com/projects/"

# Default Port: 6161

# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^SNARE\/([\d\.]+)$/ },

# WWW-Authenticate realm
{ :search=>"headers[www-authenticate]", :regexp=>/Digest realm="SNARE"/ },

# Version Detection
{ :version=>/<H2><CENTER>SNARE Version ([\d\.]+) Status Page<\/H2><\/CENTER>/ },

# 401 Page # Address Tag
{ :certainty=>75, :text=>'<ADDRESS>Snare Server Remote Control facility</ADDRESS>' },

]

end

