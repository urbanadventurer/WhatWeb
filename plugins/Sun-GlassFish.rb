##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sun-GlassFish" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-19
version "0.1"
description "GlassFish is an open source application server project led by Sun Microsystems for the Java EE platform. The proprietary version is called Sun GlassFish Enterprise Server. GlassFish supports All Java EE API specifications, such as JDBC, RMI, e-mail, JMS, web services, XML, etc., and defines how to coordinate them. - Homepage: http://glassfish.java.net/"

# More Info #
# http://en.wikipedia.org/wiki/GlassFish

# ShodanHQ results as at 2011-06-19 #
# 4,489 for GlassFish
# 3,292 for GlassFish Sun
# 2,968 for GlassFish Enterprise
# 1,197 for GlassFish -Sun
#   733 for GlassFish Open Source

# Examples #
examples %w|
85.214.75.103
192.236.37.132
200.118.2.186
63.241.4.87
147.110.32.110
94.125.59.2
68.169.49.83
87.83.215.42
87.216.164.54
80.86.84.103
195.81.70.53
109.205.186.25
184.168.123.125
202.231.109.67
60.199.250.26
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /GlassFish/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^GlassFish v(.+)$/) } if @headers["server"] =~ /^GlassFish v(.+)$/

		# Version Detection # Open Source
		m << { :string=>"Open Source Edition", :version=>@headers["server"].scan(/^GlassFish Server Open Source Edition (.+)$/) } if @headers["server"] =~ /^GlassFish Server Open Source Edition (.+)$/

		# Version Detection # Enterprise
		m << { :string=>"Enterprise Server", :version=>@headers["server"].scan(/Sun GlassFish Enterprise Server v(.+)$/) } if @headers["server"] =~ /Sun GlassFish Enterprise Server v(.+)$/

	end

	# Return passive matches
	m
end

end

