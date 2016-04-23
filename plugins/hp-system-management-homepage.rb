##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HP-System-Management-Homepage" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-28
version "0.1"
description "The HP System Management Homepage is a web-based interface that consolidates and simplifies the management of individual ProLiant and Integrity servers running Microsoft Windows or Linux operating systems, or HP 9000 and HP Integrity servers running HP-UX 11i."
website "http://h18002.www1.hp.com/products/servers/management/agents/index.html"

# Google results as at 2011-12-28 #
# 4 for intitle:"HP System Management Homepage Login" (inurl:2381|inurl:2301)
# 0 for inurl:"2301/red2301.html?RedirectUrl=/"

# ShodanHQ results as at 2011-12-28 #
# 0 for CompaqHTTPServer

# Dorks #
dorks [
'intitle:"HP System Management Homepage Login" (inurl:2381|inurl:2301)'
]



# Matches #
matches [

# Title
{ :certainty=>75, :regexp=>/<TITLE>HP System Management Homepage Login<\/TITLE>/ },

# Set-Cookie # Compaq-HMMD
{ :search=>"headers[set-cookie]", :regexp=>/Compaq-HMMD=/ },

# Version Detection # Server Header
{ :search=>"headers[server]", :version=>/CompaqHTTPServer\/[^\s]+ HP System Management Homepage\/([\d\.]+)$/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # JavaScript
	if @body =~ /<TITLE>HP System Management Homepage Login<\/TITLE>/
		if @body =~ /systemname = "([^\"^\s]+)";[\s]+smhversion = "HP System Management Homepage v([^\"^\s]+)";[\s]+smhcopyright = "&copy;2003-20[\d]{2} Hewlett-Packard Development Company, L.P.";/
			m << { :string=>"#{$1}" }
			m << { :version=>"#{$2}" }
		end
	end

	# Return passive matches
	m
end
end

