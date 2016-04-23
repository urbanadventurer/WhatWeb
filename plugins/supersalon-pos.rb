##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SuperSalon-POS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-22
version "0.1"
description "SuperSalon is one of the newest salon software systems in the market, but has already been licensed in thousands of national chain, regional chain and independent salons and cosmetology schools in the US, Canada, Europe and Asia, making it one of the most widely licensed salon POS software in the world."
website "http://www.supersalon.com/"

# ShodanHQ results as at 2011-06-22 #
# 403 for "SuperSalon POS"



# Passive #
def passive
	m=[]

	# WWW-Authenticate realm
	m << { :name=>"WWW-Authenticate realm" } if @headers["www-authenticate"] =~ /^Basic realm="SuperSalon POS"$/

	# Return passive matches
	m
end

end

