##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Minecraft-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "Minecraft server web UI. Minecraft is a deceptively simple yet addictive game with a clingy online community. MineOS is a Linux distribution designed for the sole purpose of hosting Minecraft worlds. It comes complete with web-admin interface, SSH interaction, and SCP capability for easy filesystem access."
website "http://minecraft.com/ - MineO"
website "http://minecraft.codeemo.com/index.html"

# ShodanHQ results as at 2011-08-06 #
# 6 for minecraft admin

# Google results as at 2011-08-06 #
# 3 for intitle:"MineOS Admin Page" "Map type"

# Dorks #
dorks [
'intitle:"MineOS Admin Page" "Map type"'
]



# Matches #
matches [

# Map type select input
{ :text=>'<span>Map type:</span><select id="mode" onchange="show(1,$(\'#mode\').val())">', :os=>"MineOS (Linux)" },

# Title
{ :text=>'<title>MineOS Admin Page</title>', :os=>"MineOS (Linux)" },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate Header
	m << { :certainty=>75, :name=>"WWW-Authenticate Header" } if @headers["www-authenticate"] =~/Basic realm="Minecraft Admin Login" /

	# Return passive matches
	m
end
end

