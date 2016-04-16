##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "WoW-Raid-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-16
version "0.2"
description "WoW Raid Manager or WRM for short is a PHP based application supporting World of Warcraft guilds."
website "http://www.wowraidmanager.net/"

# Google results as at 2010-06-16 #
# 108,000 for "Raid Management Provided by WoW Raid Manager"



# Matches #
matches [

# GHDB Match
{ :certainty=>75, :ghdb=>'"Raid Management Provided by WoW Raid Manager"' },

# Version Detection # Provided by text
{ :version=>/Raid Management Provided by <a href="http:\/\/www.wowraidmanager.net\/">WoW Raid Manager<\/a> v([\d\.]+)/ },

]

end

