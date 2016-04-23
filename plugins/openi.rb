##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenI" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-04
version "0.1"
description "OpenI is a Business Intelligence web application for on-demand or SaaS deployments. OpenI enables simple and clean data visualization from OLAP and RDBMS, so users can intuitively build and publish interactive reports, analyses, and dashboards."
website "http://openi.org/"

# Google results as at 2011-08-04 #
# 4 for "Openi Intelligence Portal" +Username +Password

# Dorks #
dorks [
'"Openi Intelligence Portal" "Username" "Password"'
]



# Matches #
matches [

# Version Detection
{ :version=>/<span class="big-title">Openi ([^\s^<]+)<\/span><br/ },

# Product Detection
{ :string=>/<span class="big-title">Openi-(Jasper)<\/span><br/ },

]

# Passive #
def passive
	m=[]

	# Version Detection
	if @body =~ /<span class="big-subtitle">Openi Intelligence Portal<\/span>/
		m << { :name=>"big-subtitle" }

		if @body =~ /<td align="right" style="font-size: 11px;">([^&^<]+)&nbsp;<\/td>/
			m << { :version=>"#{$1}" }
		end
	end

	# Return passive matches
	m
end
end

