##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Clearwell-E-Discovery" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-21
version "0.1"
description "The Clearwell E-Discovery Platform is the leading enterprise e-discovery solution that enables enterprises, governments, and law firms to manage legal, regulatory, and investigative matters using a single application. The Clearwell Platform was purpose-built for e-discovery, making it easy for organizations to defensibly solve real-world challenges across the entire e-discovery lifecycle from legal hold and collections through analysis, review and production."
website "http://www.clearwellsystems.com/"

# ShodanHQ results as at 2011-05-21 #
# 124 for Clearwell

# Google results as at 2011-05-21 #
# 1 for intitle:"Clearwell E-Discovery Platform log in"

# Dorks #
dorks [
'intitle:"Clearwell E-Discovery Platform log in"'
]



# Matches #
matches [

# Login Page # Help link
{ :url=>"/esa/", :text=>'/><a class="needHelp" style="text-decoration:none" href="javascript:logonHelp();void(0);">Need help?</a>' },

# Login Page # Default Title # /esa/
{ :url=>"/esa/", :text=>'<title>Clearwell E-Discovery Platform log in</title>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Clearwell$/

		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :version=>@body.scan(/<p class="build">v([^<]+)<\/p>/) } if @body =~ /<p class="build">v([^<]+)<\/p>/

	end

	# Return passive matches
	m
end

end

