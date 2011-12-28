##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Bentley-Systems-ProjectWise" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-28
version "0.1"
description "ProjectWise - Project Collaboration and Content Management Software for Architecture, Construction, and Engineering Projects - Homepage: http://www.bentley.com/en-US/Products/ProjectWise"

# ShodanHQ results as at 2011-12-28 #
# 15 for Bentley.WebSession

# Google results as at 2011-12-28 #
# 43 for intitle:"ProjectWise Web Server" "ProjectWise Web Server"

# Dorks #
dorks [
'intitle:"ProjectWise Web Server" "ProjectWise Web Server"'
]

# Examples #
examples %w|
206.227.137.49
58.56.159.37
114.251.196.90
209.131.10.244
117.79.80.67
208.82.223.243
206.211.200.42
206.227.137.45
94.95.109.13
209.131.10.175
pw.amg-eng.com
pw.carollo.com
https://pw.hntb.com/
https://projectwise.dot.ny.gov/
https://planroom.dot.illinois.gov/
https://pw1.mbakercorp.com/
|

# Matches #
matches [

# Login Page # Favicon HTML
{ :text=>'</title><meta http-equiv="X-UA-Compatible" content="IE=8" /><link rel="shortcut icon" href="ProjectWise.ico" />' },

# Login Page # Title
{ :regexp=>/<title>\s+ProjectWise Web Server\s+<\/title>/ },

# Login Page # HTML Comment
{ :certainty=>75, :text=>'<!-- Initially invisible login form -->' },

# Set-Cookie # Bentley.WebSession
{ :search=>"headers[set-cookie]", :regexp=>/Bentley.WebSession=/ },

# /ProjectWise.ico
{ :url=>"/ProjectWise.ico", :md5=>"c20606b0a22e4c91940798a485d7eff7" },

]

end

