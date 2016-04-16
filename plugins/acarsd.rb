##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "acarsd" do
author "Andrew Horton"
version "0.1"
description "acarsd is an Aircraft Communication Addressing and Reporting System (ACARS) decoder for a LINUX or Windows. It decodes ACARS transmissions collected from a radio scanner in real-time using sound cards. acarsd also provides realtime webserver."
website "http://www.acarsd.org/"

# More examples here: http://www.acarsd.org/webservers.html
# Google results as at 2012-02-21 #
# 11 for intitle:"RealTime Web ACARS" "ACARS decoder for Linux and Windows" "Help" "Map" "Reports" "Search"

# Dorks #
dorks [
'intitle:"RealTime Web ACARS" "ACARS decoder for Linux and Windows" "Help" "Map" "Reports" "Search"'
]



# Matches #
matches [

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^acarsd\/([^\s]+)$/ },

# Meta Author
{ :certainty=>75, :text=>'<meta name="author" content="KjM <acarsd@acarsd.org>">' },

# Title
{ :certainty=>75, :regexp=>/<title>[^<]*RealTime Web ACARS/ },

# HTML Comment
{ :certainty=>75, :text=>'<!-- MAIN PART OF WEBACARS -->' },

# Meta Description # Location
{ :string=>/<meta name="description" content="Realtime Web ACARS - [^\s]+ Location: ([^\.^\"^>]+)\./ },

]

end

