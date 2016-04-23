##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "MeetingPlaza" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-21
version "0.2"
description "MeetingPlaza Distance Conference Service for internet conferencing, meeting, presentations, seminars, collaboration, events, and training."
website "http://www.meetingplaza.com/e/"

# ShodanHQ results as at 2011-07-21 #
# 20 for InterSpace HTTP Tunneling

# Google results as at 2011-07-21 #
# 5 for "Hello. I'm MeetingPlaza HTTP Tunneling Server." +Date

# Dorks #
dorks [
'"Hello. I\'m MeetingPlaza HTTP Tunneling Server." "Date"'
]



# Matches #
matches [

{ :certainty=>25, :text=>'<html> <body> Hello. I\'m MeetingPlaza HTTP Tunneling Server.<br>Date: ' },

# Version Detection # HTTP Server Header
{ :version=>/^InterSpace HTTP Tunneling\/([^\s]+)$/, :search=>"headers[server]" },

# HTTP Server Header
{ :regexp=>/^InterSpace HTTP Tunneling/, :search=>"headers[server]" },

]


end

