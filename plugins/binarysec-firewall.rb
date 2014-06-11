##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-04-02 #
# Updated regex
##
Plugin.define "BinarySec-Firewall" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.2"
description "BinarySec Web Application Firewall - http://www.binarysec.com"



# Passive #
def passive
	m = []

	# X-BinarySEC-Via header
	unless @headers["x-binarysec-via"].nil?
		m << { :name=>"X-BinarySEC-Via header" }
	end

	# X-BinarySEC-NoCache
	unless @headers["x-binarysec-nocache"].nil?
		m << { :name=>"X-BinarySEC-NoCache header" }
	end

	# Server Header
	if @headers['server'] =~ /BinarySec/i

		m << { :name=>"server header" }

		# Version Detection # HTTP Server header
        	m << { :version=>@headers['server'].scan(/BinarySEC\/(\d{1,3}\.\d{1,4}\.\d{1,4})/i) } if @headers['server'] =~ /BinarySEC\/(\d{1,3}\.\d{1,4}\.\d{1,4})/i
	end

	# Return passive matches
	m
end

end


