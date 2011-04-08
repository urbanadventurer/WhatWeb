##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ABO.CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "ABO.CMS - Hompage: http://www.abocms.com/"

# ShodanHQ results as at 2011-04-08 #
# 54 for A-Powered-By

# Examples #
examples %w|
www.abocms.ru
demo.abocms.ru
195.42.176.47
195.9.3.131
213.184.129.195
88.198.11.34
212.193.253.46
62.117.89.122
194.85.90.9
217.199.213.212
212.193.229.55
62.117.76.130
|

# Passive #
def passive
	m=[]

	# Version Detection # A-Powered-By Header
	m << { :version=>@meta["a-powered-by"].scan(/^ABO\.CMS( E-commerce| Corporative)? ([\d\.]+)/)[0][1] } if @meta["a-powered-by"] =~ /^ABO\.CMS( E-commerce| Corporative)? ([\d\.]+)/

	# Return passive matches
	m
end

end


