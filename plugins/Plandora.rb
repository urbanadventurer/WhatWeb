##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Plandora" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-04
version "0.1"
description "Web-based project management suite including time track, dashboard gadgets, requests, BSC (KPI), knowledge base, risks, agile board, resource capacity, surveys, SVN integration and gantt chart."
website "http://www.plandora.org/"

# 2 for "Plandora Project" +User +Password +Login inurl:pandora/do

# Dorks #
dorks [
'"Plandora Project" "User" "Password" "Login" inurl:"pandora/do"'
]



# Matches #
matches [

# area tag
{ :text=>'<area shape="rect" coords="180,1,215,30" href="javascript:void(0);" onClick="closeFloatPanel();" />' },

]

# Passive #
def passive
	m=[]

	# td background
	if @body =~ /<td background="\.\.\/images\/footer_backg\.png" class="footerNote">/

		m << { :name=>"td background" }

		# Version Detection
		if @body =~ / 2004-20[\d]{2}&nbsp;v([\d\.]+)/
			m << { :version=>"#{$1}" }
		end

	end

	# Return passive matches
	m
end
end

