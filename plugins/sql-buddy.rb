##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SQL-Buddy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-28
version "0.1"
description "SQL Buddy - Web based MySQL administration"
website "http://www.sqlbuddy.com/"

# Google results as at 2011-09-28 #
# 79 for intitle:"SQL Buddy" +Host +Username +Password +Database -sbconfig -site:www.sqlbuddy.com -site:code.google.com
# 26 for inurl:"sqlbuddy/" +Host +Username +Password +Database -sbconfig
#  5 for inurl:"sqlbuddy/login.php" +Host +Username +Password +Database -sbconfig

# Dorks #
dorks [
'intitle:"SQL Buddy" "Host" "Username" "Password" "Database" -sbconfig -site:www.sqlbuddy.com -site:code.google.com',
'inurl:"sqlbuddy/login.php" "Host" "Username" "Password" "Database" -sbconfig'
]



# Passive #
def passive
	m=[]

	# Help link
	if @body =~ /<td colspan="2"><div class="loginheader"><h3><strong>Login<\/strong><\/h3><a href="http:\/\/www\.sqlbuddy\.com\/help\/"/

		m << { :name=>"help link" }

		# Version Detection
		if @body =~ /<link type="text\/css" rel="stylesheet" href="themes\/bittersweet\/css\/main\.css\?ver=([\d\_]+)" \/>/
			m << { :version=>"#{$1}".gsub!(/_/, ".") }
		end
	end

	# Return passive matches
	m
end
end

