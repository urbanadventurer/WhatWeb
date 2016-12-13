##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SABnzbd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-05
version "0.1"
description "SABnzbd is an Open Source Binary Newsreader written in Python."
website "http://sabnzbd.org/"

# Google results as at 2011-03-05 #
# 13 for inurl:"sabnzbd" intitle:Login username password
# 7 for inurl:":8080/sabnzbd"

# ShodanHQ results as at 2011-03-05 #
# 155 for realm SABnzbd



# Matches #
matches [

# Default form tag
{ :regexp=>/    <form action="\/sabnzbd\/[^"]*" method="POST">/ },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate # realm="SABnzbd"
	m << { :name=>'HTTP WWW Authenticate header' } if @headers['www-authenticate'] =~ /realm="SABnzbd"/

	# Return passive matches
	m
end

end


