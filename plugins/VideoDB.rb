##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VideoDB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-13
version "0.1"
description "VideoDB is a web application to manage a personal video collection - Requires: PHP and MySQL"
website "http://www.videodb.net/"

# ShodanHQ results as at 2011-08-13 #
#  3 for VDBpassword VDBuserid VDBusername

# Google results as at 2011-08-13 #
# 27 for inurl:borrow.php?diskid=

# Dorks #
dorks [
'inurl:borrow.php?diskid='
]



# Matches #
matches [

# Export as pdf link
{ :text=>'<a href="index.php?export=pdf&amp;ext=.pdf"><img src="images/pdfexport.png" /></a>' },

# HTML Comment
{ :text=>'<!-- /content --><!-- footer.tpl -->' },

# VideoDB RSS link
{ :text=>'<link rel="alternate" type="application/rss+xml" title="VideoDB RSS" href="index.php?export=rss" />' },

# Meta Description
{ :text=>"<meta name='description' content='VideoDB' />" },
{ :text=>'<meta name="description" content="VideoDB" />' },

# Version Detection # Footer
{ :version=>/<a href="http:\/\/www\.splitbrain\.org\/go\/videodb" class="splitbrain">v\.([^<]+)<\/a>/ },
{ :version=>/<div id="footerversion">[\s]*<a href="http:\/\/www\.videodb\.net">v([^<]+)<\/a>[\s]*<\/div>/ },

]

# Passive #
def passive
	m=[]

	# Cookies
	if @headers["set-cookie"] =~ /VDBuserid=/ and @headers["set-cookie"] =~ /VDBusername=/ and @headers["set-cookie"] =~ /VDBpassword=/
		m << { :name=>"Cookies" }
	end

	# Return passive matches
	m
end
end

