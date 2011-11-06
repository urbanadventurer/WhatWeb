##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MeetingPlaza" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-21
version "0.1"
description "MeetingPlaza Distance Conference Service for internet conferencing, meeting, presentations, seminars, collaboration, events, and training. - Homepage: http://www.meetingplaza.com/e/"

# ShodanHQ results as at 2011-07-21 #
# 20 for InterSpace HTTP Tunneling

# Google results as at 2011-07-21 #
# 5 for "Hello. I'm MeetingPlaza HTTP Tunneling Server." +Date

# Dorks #
dorks [
'"Hello. I\'m MeetingPlaza HTTP Tunneling Server." "Date"'
]

# Examples #
examples %w|
mp1.meetingplaza.com
mp1.meetingplaza.com:15501
mp2.meetingplaza.com
mp3.meetingplaza.com
mp4.meetingplaza.com
66.77.128.68
218.213.250.231
122.215.200.58
122.215.192.67
|

# Matches #
matches [

{ :certainty=>25, :text=>'<html> <body> Hello. I\'m MeetingPlaza HTTP Tunneling Server.<br>Date: ' },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^InterSpace HTTP Tunneling\/([^\s]+)$/) } if @headers["server"] =~ /^InterSpace HTTP Tunneling\/([^\s]+)$/

	# Return passive matches
	m
end

end

