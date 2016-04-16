##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TangoCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "TangoCMS is an open source (GNU/GPL 2.1) PHP Content Management System (CMS)."
website "http://tangocms.org/"

# ShodanHQ results as at 2011-07-27 #
# 75 for ZULA_6666cd76f96956469e7be39d750cc7d9

# Google results as at 2011-07-27 #
# 154 for "Powered by TangoCMS"

# Dorks #
dorks [
'"Powered by TangoCMS"'
]



# Matches #
matches [

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/(www\.)?tangocms\.org" title="(Open Source CMS|TangoCMS)">TangoCMS<\/a>\./ },

# Login input
{ :text=>'<input type="checkbox" id="sessionRemember" name="session[remember]" value="1" checked="checked"> <label class="horizontal" for="sessionRemember">Remember me?</label>' },

]

# Passive #
def passive
	m=[]

	# ZULA_6666cd76f96956469e7be39d750cc7d9 Cookie
	# 6666cd76f96956469e7be39d750cc7d9 is the md5 hash for "/"
	m << { :name=>"ZULA_6666cd76f96956469e7be39d750cc7d9 Cookie" } if @headers["set-cookie"] =~ /ZULA_6666cd76f96956469e7be39d750cc7d9=[^;^\s]+;/

	# Return passive matches
	m
end
end

