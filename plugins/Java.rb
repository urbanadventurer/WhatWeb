##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-06 #
# Updated OS detection
##
Plugin.define "Java" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-28
version "0.2"
description "Java allows you to play online games, chat with people around the world, calculate your mortgage interest, and view images in 3D, just to name a few. It's also integral to the intranet applications and other e-business solutions that are the foundation of corporate computing. - homepage: http://www.java.com/"

# ShodanHQ results as at 2011-01-28 #
#	10,814 for X-Powered-By: JSP
#	153,488 for JSESSIONID
#	571 for java.vendor=Sun Microsystems Inc
#	47 for java.vendor=IBM Corporation
#	118 for "x-powered-by" JSP JRE
#	13950 for server JAVA

# Examples #
examples %w|
218.206.13.2
60.250.19.169
134.114.242.15
68.177.195.53
66.151.98.104
202.55.180.36
142.58.102.95
96.17.113.243
128.32.16.69
140.110.17.152
222.173.62.219
219.143.227.131
218.17.204.41
124.117.242.211
221.202.118.32
61.60.124.105
58.52.201.107
58.19.244.250
58.254.232.252
200.55.152.136
217.22.227.98
91.135.230.4
192.192.170.183
218.249.41.17
64.239.95.24
219.141.136.104
85.24.155.77
148.241.188.50
|

# Passive #
def passive
	m=[]

	# JSESSIONID Cookie
	m << { :name=>"JSESSIONID Cookie" } if @meta["set-cookie"] =~ /JSESSIONID=[^;]{0,32};[\s]?path=\//i

	# X-Powered-By # JSP Version Detection
	m << { :version=>@meta['x-powered-by'].scan(/JSP\/([\d\.]+)/) } if @meta['x-powered-by'] =~ /JSP\/([\d\.]+)/
	# X-Powered-By # Servlet Version Detection
	m << { :string=>@meta['x-powered-by'].scan(/(Servlet\/[\d\.]+)/i) } if @meta['x-powered-by'] =~ /(Servlet\/[\d\.]+)/i
	# X-Powered-By # JRE Version Detection
	m << { :string=>@meta['x-powered-by'].scan(/(JRE\/[\d\.\-\_]+)/) } if @meta['x-powered-by'] =~ /(JRE\/[\d\.\-\_]+)/

	# Server # Version Detection
	m << { :version=>@meta['server'].scan(/java\/([\d\.\-\_]+)/) } if @meta['server'] =~ /java\/([\d\.\-\_]+)/
	# Server # JDK Version Detection
	m << { :string=>@meta['server'].scan(/(JDK [\d\.\-\_]+)/) } if @meta['server'] =~ /(JDK [\d\.\-\_]+)/

	# Servlet-Engine
	if @meta['servlet-engine'] =~ /\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/

		# JSP Version Detection
		m << { :string=>@meta['servlet-engine'].scan(/\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/)[0][0] }
		# Servlet Version Detection
		m << { :string=>@meta['servlet-engine'].scan(/\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/)[0][1] }
		# Version Detection
		m << { :version=>@meta['servlet-engine'].scan(/\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/)[0][2] }
		# OS Detection
		m << { :os=>@meta['servlet-engine'].scan(/\((.*?); (.*?); Java (.*?); (.*?); java.vendor=[^\)]{0,50}\)/)[0][3] }

	end

	# Return passive matches
	m

end

end

