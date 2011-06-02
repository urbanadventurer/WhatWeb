##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SoftPLC-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "All SoftPLC controller CPUs provide the same rich set of features. Every SoftPLC is a high-performance, feature-rich Programmable Automation Controller (PAC), combining the functions of a proprietary PLC with the benefits of both an open architecture design and computer technologies. - Homepage: http://www.softplc.com/products.php"

# ShodanHQ results as at 2011-06-02 #
# 81 for SoftPLC

# Examples #
examples %w|
82.100.49.144
213.180.49.110
83.69.35.246
92.62.229.192
217.196.212.7
90.180.41.35
82.99.182.227
188.167.59.157
90.176.143.179
|

# Passive #
def passive
	m=[]

	# No HTTP Server Header
	if @meta["server"].nil?

		# Location
		if @status.to_s =~ /^302$/ and @meta["location"] =~ /\/syswww\/login\.xml/
			m << { :name=>"Location Header" }
		end

		# SoftPLC Cookie
		m << { :name=>"SoftPLC Cookie" } if @meta["set-cookie"] =~ /^SoftPLC=-?[\d]+; Path=\//

	end

	# Return passive matches
	m
end

end

