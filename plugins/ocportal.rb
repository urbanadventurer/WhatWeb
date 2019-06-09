##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ocPortal"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-12
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Cutting-edge CMS for building and maintaining a sophisticated social website. Fully flexible, themeable and extendible: suitable for building almost any kind of website."
website "http://ocportal.com"

# ShodanHQ results as at 2011-05-12 #
# 24 for X-Powered-By ocPortal

# Matches #
matches [

# html id
{ :text=>'<html id="main_website_html" xmlns="http://www.w3.org/1999/xhtml"' },

# Meta Generator
{ :text=>'<meta name="GENERATOR" content="ocPortal" />' },

# Version Detection # HTML Comment
{ :version=>/<!--\nPowered by ocPortal\n([^\n]+) version\nCopyright ocProducts Limited\nhttp:\/\/ocportal\.com\n-->/ },

# X-Powered-By ocPortal
{ :version=>/^ocPortal ([^\(]+) \(PHP/, :search=>"headers[x-powered-by]" },

# ocp_session cookie
{ :name=>"ocp_session cookie", :regexp=>/ocp_session=[\d]+;/, :search=>"headers[set-cookie]" },

]

end


