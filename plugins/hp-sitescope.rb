##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HP-SiteScope" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "HP SiteScope is an agentless monitoring software focused on monitoring the availability and performance of distributed IT infrastructures, including servers, operating systems, network and Internet services, applications and application components. Originally written by Freshwater Software in 1996, a company acquired by Mercury Interactive in 2001. Mercury Interactive was subsequently acquired by Hewlett Packard (HP) in 2006."
website "More Info: http://en.wikipedia.org/wiki/HP_SiteScope"

# ShodanHQ results as at 2011-08-06 #
# 178 for SiteScope -Administrator
#  10 for SiteScope Administrator

# Google results as at 2011-08-06 #
# 5 for "SiteScope Login" intitle:"SiteScope Login" "Mercury Interactive Corporation"

# Dorks #
dorks [
'"SiteScope Login" intitle:"SiteScope Login" "Mercury Interactive Corporation"'
]



# Matches #
matches [

# H2 Heading
{ :text=>'<center><H2>SiteScope Login</H2></center><hr>' },

# Version Detection # All Rights Reserved Footer
{ :url=>"/", :version=>/<p class=fine align=center><small>SiteScope ([\d\.]+)/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^SiteScope\//
		if @headers["server"] =~ /^SiteScope\/(.+) [\d]{1,2}:[\d]{2} [ap]m [\d]{1,2}\/[\d]{2}\/[\d]{2} [Bb]uild:? ([\d]+)$/
			m << { :version=>"#{$1} build #{$2}" }
		elsif @headers["server"] =~ /^SiteScope\/([^\s]+( [A-Z]\d)?)/
			m << { :version=>"#{$1}" }
		end
	end

	# WWW-Authenticate Header
	if @headers["www-authenticate"] =~ /BASIC realm="SiteScope Administrator"/
		m << { :name=>"WWW-Authenticate Header" }
	end

	# Return passive matches
	m
end
end

