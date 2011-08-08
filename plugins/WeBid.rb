##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WeBid" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-17
version "0.1"
description "Open source php/mysql fully featured auction script. - Homepage: http://www.webidsupport.com/"

# ShodanHQ results as at 2011-06-17 #
# 26 for WEBID_ONLINE

# Google results as at 2011-06-17 #
# 243 for "powered by WeBid"

# Dorks #
dorks [
'"powered by WeBid"'
]

# Examples #
examples %w|
72.51.36.63
satraders.net/WeBid/
ticcmall.net/browse.php
www.kinkebay.co.uk/index.php
www.propertyplaces.com/contents.php
alaganga.com/WeBid-0.8.5/WeBid/browse.php
auction.ideorg.org/item.php
ezbid.dedlines.com/item.php
www.nelo.eu/auctions/user_login.php
www.b-ebe.com/browse.php
nobilis.nobles.edu/webid/item.php
site.tsodna.edu.ge/browse.php
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="WeBid">' },

# Year Detection # Powered by footer
{ :string=>/Powered by <a href="http:\/\/www\.webidsupport\.com\/">WeBid<\/a> &copy; 2008\s?[,-] ([\d]{4}) <a href="http:\/\/www\.webidsupport\.com\/">WeBid<\/a>/ },

]

# Passive #
def passive
	m=[]

	# WEBID_ONLINE cookie
	m << { :name=>"WEBID_ONLINE cookie" } if @headers["set-cookie"] =~ /WEBID_ONLINE=[a-f\d]{32};/

	# Return passive matches
	m
end

end

