##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nintendo-GameCube" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-02
version "0.1"
description "Nintendo GameCube video game console"
website "http://www.nintendo.com/"

# ShodanHQ results as at 2011-08-02 #
# 18 for GameCube
#  4 for X-Organization: Nintendo

# Google results as at 2011-08-02 #
# 4 for intitle:"HTML Page" +"This is test.html page"

# Dorks #
dorks [
'intitle:"HTML Page" "This is test.html page"'
]



# Passive #
def passive
	m=[]

	# Server: GameCube
	m << { :certainty=>75, :name=>"Server Header" } if @headers["server"] =~ /^Game[\s]?Cube$/

	# X-Organization: Nintendo
	m << { :certainty=>75, :name=>"X-Organization Header" } if @headers["x-organization"] =~ /^Nintendo$/

	# Return passive matches
	m
end
end

