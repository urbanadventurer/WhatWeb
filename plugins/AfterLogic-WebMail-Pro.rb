##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AfterLogic-WebMail-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "AfterLogic WebMail Pro is a webmail front-end for your existing POP3/IMAP mail server. - Homepage: http://www.afterlogic.com/mailbee/webmail-pro.asp"

# ShodanHQ results as at 2011-05-20 #
# 226 for PHPWEBMAILSESSID

# Google results as at 2011-05-20 #
# 94 for "Powered by AfterLogic WebMail Pro" intitle:"AfterLogic WebMail Pro"

# Dorks #
dorks [
'"Powered by AfterLogic WebMail Pro" intitle:"AfterLogic WebMail Pro"'
]



# Matches #
matches [

# Powered by link
{ :text=>'Powered by <a href="http://www.afterlogic.com/products/webmail-pro" target="_blank">AfterLogic WebMail Pro</a><br />' },

# Version Detection # HTML Comment
{ :version=>/AfterLogic Corporation<\/a>\s?<\/div>\s+<\/body>\s<\/html>\s<!--\s?([\d\.]+)\s?-->/ },
{ :version=>/AfterLogic Corporation<\/a>\s?<\/div>\s+<!--\s?([\d\.]+)\s?-->\s<\/body>\s<\/html>/ },

]

# Passive #
def passive
	m=[]

	# PHPWEBMAILSESSID cookie
	m << { :name=>"PHPWEBMAILSESSID cookie" } if @headers["set-cookie"] =~ /^PHPWEBMAILSESSID=[^;]+;/

	# PHPWMADMINSESSID cookie
	m << { :name=>"PHPWMADMINSESSID cookie" } if @headers["set-cookie"] =~ /^PHPWMADMINSESSID=[^;]+;/

	# Return passive matches
	m
end

end

