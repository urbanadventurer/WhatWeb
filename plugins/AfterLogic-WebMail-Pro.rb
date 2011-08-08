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

# Examples #
examples %w|
webmail.mailstone.net
webmail.mailstone.net/adminpanel/
www.cccga.org/mail/
mail.icerocket.com/webmail.php
mail.shkoder.net
banster.net/mail/
mail.geoalb.org
afterlogic.zoombuzz.net
201.33.17.15
200.203.89.54
201.33.21.49
201.33.22.225
195.239.148.123
41.162.143.12
200.155.38.14
94.21.6.43
|

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

