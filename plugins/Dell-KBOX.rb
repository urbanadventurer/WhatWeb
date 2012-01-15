##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dell-KBOX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "KBOX by KACE delivers total software management in an easy to manage enterprise appliance. - Hompeage: http://www.kace.com/"
# Datasheet: http://www.kace.com/pdf/datasheet/KACE-K-Series-Overview.pdf

# ShodanHQ results as at 2011-05-23 #
# 249 for X-KBOX

# Examples #
examples %w|
202.93.109.199
203.45.224.73
198.30.131.17
165.228.78.126
169.198.0.13
165.228.203.42
65.74.148.84
97.65.106.46
114.111.132.51
|


trigger "x-dellkace-version"

# Passive #
def passive
	m=[]

	# Version Detection # X-DellKACE-Version Header
	m << { :version=>@headers["x-dellkace-version"].to_s } unless @headers["x-dellkace-version"].nil?

	# Version Detection # X-KBOX-Version Header
	m << { :version=>@headers["x-kbox-version"].to_s } unless @headers["x-kbox-version"].nil?

	# Model Detection # X-DellKACE-Appliance Header
	m << { :model=>@headers["x-dellkace-appliance"].to_s } unless @headers["x-dellkace-appliance"].nil?

	# Hostname Detection # X-KBOX-WebServer
	m << { :string=>@headers["x-kbox-webserver"].to_s } unless @headers["x-kbox-webserver"].nil?

	# Hostname Detection # X-DellKACE-Host
	m << { :string=>@headers["x-dellkace-host"].to_s } unless @headers["x-dellkace-host"].nil?

	# Return passive matches
	m
end

end

