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

# Examples #
examples %w|
www.binarysec.com
195.98.231.142
91.121.97.83
87.98.160.245
213.223.138.13
87.98.130.144
87.98.221.237
91.121.62.246
hug.re
www.hoteldugolfetizzano.com
antennereunion.fr
vity.fr
www.rer.re
www.occasions-guadeloupe.com
|

# Passive #
def passive
	m = []

	# X-BinarySEC-Via header
	unless @meta["x-binarysec-via"].nil?
		m << { :name=>"X-BinarySEC-Via header" }
	end

	# X-BinarySEC-NoCache
	unless @meta["x-binarysec-nocache"].nil?
		m << { :name=>"X-BinarySEC-NoCache header" }
	end

	# Server Header
	if @meta['server'] =~ /BinarySec/i

		m << { :name=>"server header" }

		# Version Detection # HTTP Server header
        	m << { :version=>@meta['server'].scan(/BinarySEC\/(\d{1,3}\.\d{1,4}\.\d{1,4})/i) } if @meta['server'] =~ /BinarySEC\/(\d{1,3}\.\d{1,4}\.\d{1,4})/i
	end

	# Return passive matches
	m
end

end


