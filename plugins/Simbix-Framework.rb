##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Simbix-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "Simbix Framework [Russian]"
website "http://www.simbix.com/"

# ShodanHQ results as at 2011-08-06 #
# 6 for X-Powered-By: Simbix Framework
# 2 for X-Simbix-Version



# Matches #
matches [

# MD5 # /logo-lpage-owner.png
{ :url=>"logo-lpage-owner.png", :md5=>"500cf2101e7b3512f602203695726520" },

# logo html
{ :text=>'<div class="image"><img src="/logo-lpage.png" width="40" height="40" alt="Simbix Framework" /></div>' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Simbix Framework v([^"^\s]+)" \/>/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # X-Powered-By Header
	if @headers["x-powered-by"] =~ /^Simbix Framework\/([^\s]+)$/
		m << { :version=>"#{$1}" }
	end
	
	# Version Detection # X-Simbix-Version Header
	if @headers["x-simbix-version"] =~ /^([^\s]+)\.YYMMDD-HHMM$/
		m << { :version=>"#{$1}" }
	end

	# Return passive matches
	m
end
end

