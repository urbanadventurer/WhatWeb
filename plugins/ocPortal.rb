##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ocPortal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "Cutting-edge CMS for building and maintaining a sophisticated social website. Fully flexible, themeable and extendible: suitable for building almost any kind of website. - Homepage: http://ocportal.com"

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

]

# Passive #
def passive
	m=[]

	# X-Powered-By ocPortal
	m << { :version=>@headers["x-powered-by"].scan(/^ocPortal ([^\(]+) \(PHP/) } if @headers["x-powered-by"] =~ /^ocPortal ([^\(]+) \(PHP/

	# ocp_session cookie
	m << { :name=>"ocp_session cookie" } if @headers["set-cookie"] =~ /ocp_session=[\d]+;/

	# Return passive matches
	m
end

end


