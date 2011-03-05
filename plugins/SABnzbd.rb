##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SABnzbd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-05
version "0.1"
description "SABnzbd is an Open Source Binary Newsreader written in Python. - Homepage: http://sabnzbd.org/"

# Google results as at 2011-03-05 #
# 13 for inurl:"sabnzbd" intitle:Login username password
# 7 for inurl:":8080/sabnzbd"

# ShodanHQ results as at 2011-03-05 #
# 155 for realm SABnzbd

# Examples #
examples %w|
217.19.25.113
184.154.13.24
82.246.148.36
67.184.98.31
217.122.216.183
95.96.145.165
195.240.231.115
85.228.108.74
84.29.109.249
alkmaar.kanniets.nl:8080/sabnzbd/
www.seventh-july.com:7777/sabnzbd/
starbuck.salgo.net/sabnzbd/
77.164.145.154:9200/sabnzbd/
placidus.org:31337/sabnzbd/
82.74.213.253:9200/sabnzbd/
www.familiebos.info:9200/sabnzbd/
|

# Matches #
matches [

# Default form tag
{ :regexp=>/    <form action="\/sabnzbd\/[^"]*" method="POST">/ },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate # realm="SABnzbd"
	m << { :name=>'HTTP WWW Authenticate header' } if @meta['www-authenticate'] =~ /realm="SABnzbd"/

	# Return passive matches
	m
end

end


