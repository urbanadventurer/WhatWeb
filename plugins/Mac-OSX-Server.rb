# coding: ascii-8bit
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mac-OSX-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Powerful yet streamlined, Snow Leopard Server makes it easier than ever for the people in your organization to collaborate, communicate, and share information. Up to 2x faster than its predecessor, Mac OS X Server v10.6 Snow Leopard is a full 64-bit UNIX server OS with dozens of new and updated features."
website "http://www.apple.com/server/macosx/"

# ShodanHQ results as at 2011-03-25 #
# 246 for "Mac OS X Server Web Services Server"



# Matches #
matches [

# Title
{ :certainty=>75, :text=>'<title>Mac OS X Server</title>' },

# Version Detection # div page_footer_appversion
{ :version=>/<div class="page_footer_appversion">Mac OS X Server Web Services Server ([\d\.]+)<\/div>/, :os=>"Mac OSX" },

# Username Detection
{ :account=>/<li><a href="\/users\/([^\/]+)\/"><span class="img"><img src="\/collaboration\/images\/user\.jpg" alt="" width="32" height="32"><\/span><span class="title">[^<]+<\/span><span class="description"><\/span><\/a><\/li>/, :os=>"Mac OSX" },

# iframe + html comment
{ :text=>'<iframe id="webmail_frame" src="/webmail/src/"><!-- this frame will enable the webmail link if webmail is active --></iframe>', :os=>"Mac OSX" },

# CSS
{ :text=>'<link rel="stylesheet" type="text/css" media="screen, projection" href="/collaboration/css/required_compressed.css">', :os=>"Mac OSX" },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate realm
	if @status == 401 and @headers["www-authenticate"] =~ /basic realm="Mac OS X Server Web Services"/
		m << { :name=>"WWW-Authenticate realm", :os=>"Mac OSX" }
	end

	# Return passive matches
	m

end

end

