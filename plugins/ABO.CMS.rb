##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ABO_CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "ABO.CMS - Hompage: http://www.abocms.com/"

# ShodanHQ results as at 2011-04-08 #
# 54 for A-Powered-By



# Passive #
def passive
	m=[]

	# Version Detection # A-Powered-By Header
	m << { :version=>@headers["a-powered-by"].scan(/^ABO\.CMS( E-commerce| Corporative)? ([\d\.]+)/)[0][1] } if @headers["a-powered-by"] =~ /^ABO\.CMS( E-commerce| Corporative)? ([\d\.]+)/

	# Return passive matches
	m
end

end


