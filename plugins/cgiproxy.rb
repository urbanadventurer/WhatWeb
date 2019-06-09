##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CGIProxy"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-06
  # v0.2 # Updated version detection and matches. 
]
version "0.2"
description "This CGI script acts as an HTTP or FTP proxy. Through it, you can retrieve any resource that is accessible from the server it runs on."
website "http://www.jmarshall.com/tools/cgiproxy/"

# About 15 results for +filetype:cgi "Start browsing through this CGI-based proxy by entering a URL below" @ 2010-06-06


matches [

# GHDB Match
# http://johnny.ihackstuff.com/ghdb?function=detail&id=531
{ :ghdb=>'filetype:cgi "Start browsing through this CGI-based proxy by entering a URL below"', :certainty=>75 },

# Default title
{ :text=>'<title>Start Using CGIProxy</title>' },

# Vesion detection
{ :version=>/<a href="http:\/\/www.jmarshall.com\/tools\/cgiproxy\/"><i>CGIProxy ([^<]+)<\/i><\/a>/ },

]

end

