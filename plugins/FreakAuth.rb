##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FreakAuth" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-11
version "0.1"
description "FreakAuth is a simple authentication library for the Code Igniter PHP framework - Homepage: http://freakauth.4webby.com/"

# Google results as at 2011-04-11 #
# 13 for intitle:"FreakAuth" "Welcome on board ! / Login"

# ShodanHQ results as at 2011-04-11 #
# 129 for Location: /framework/index.php

# Dorks #
dorks [
'intitle:"FreakAuth" "Welcome on board ! / Login"'
]

# Examples #
examples %w|
toughta.info
quilla.info
ns204603.ovh.net
ade.net84.net
mobileespn.lordsofodds.com
178.33.139.165
178.33.5.243
178.33.139.113
178.33.5.98
178.33.139.1
178.33.139.46
178.33.5.92
178.33.139.32
178.33.5.247
188.165.116.193
|

# Matches #
matches [

# Default title
{ :regexp=>/<title>FreakAuth &raquo; [^<]+<\/title>/ },

# Login link
{ :regexp=>/Welcome on board ! \/ <a href="http[^"]+">Login<\/a>		<\/div>/ },

]
 # Passive #
def passive
	m=[]

	# FreakAuth Cookie
	m << { :name=>"FreakAuth Cookie" } if @headers["set-cookies"] =~ /^FreakAuth=/

	# Location Header # /framework/index.php
	m << { :name=>"Location Header" } if @headers["location"] =~ /^\/framework\/index\.php$/

	# Return passive matches
	m
end

end


