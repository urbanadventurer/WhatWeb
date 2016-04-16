##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ThoughtConduit" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-19
version "0.1"
description "ThoughtConduit is a groupware application for people who create with sound, video, animation, text and Virtual Reality. ThoughtConduit provides a creative environment on the internet where users have access to cross-platform tools for articulating, organizing, and distributing multimedia. The ThoughtConduit System consists of two primary components: The Web Server Framework and the desktop Client Application. The Web framework allows access to many ThoughtConduit features from virtually any modern web browser. The Client Application provides communication between other clients and the web server."
website "http://www.thoughtconduit.net/"
# More info: http://www.thoughtconduit.net/cgi-bin/WebObjects/thoughtconduit.woa/wa/doc?id=1

# Google results as at 2011-05-19 #
# 56 for "This site runs on ThoughtConduit * by Sensory Research"

# Dorks #
dorks [
'"This site runs on ThoughtConduit * by Sensory Research"'
]



# Matches #
matches [

# Error Page
{ :certainty=>10, :text=>'<html><body>There has been an error</body></html>' },
{ :certainty=>25, :text=>'<html><head><title>Error</title></head><body>Your request produced an error.</body></html>' },

# Error Page # The resource you are looking for is unavailable.
{ :md5=>"6554c90f59823801b2791edff3c3998c" },

# Version Detection # This site runs on footer
{ :version=>/This site runs on ThoughtConduit v([^\s]+) by <A TARGET=new HREF="http:\/\/www\.sensoryresearch\.com">Sensory Research<\/A><\/FONT><\/I><\/TD><\/TR><\/table><\/body>/ },

]

end

