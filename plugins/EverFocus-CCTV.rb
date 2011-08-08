##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EverFocus-CCTV" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "EverFoxus CCTV router web interface - Homepage: http://www.everfocus.com/products.cfm"

# Default Logins:
# EverFocus - PowerPlex - admin:admin
# EverFocus - PowerPlex - supervisor:supervisor
# EverFocus - PowerPlex - operator:operator

# ShodanHQ results as at 2011-04-08 #
# 5,871 for http server/everfocus

# Examples #
examples %w|
174.57.238.243
163.20.137.103
91.54.56.236
24.73.208.30
98.108.68.194
141.153.246.138
96.63.252.30
219.76.191.68
66.204.134.139
65.15.170.96
|

# Matches #
matches [

# Redirect page
{ :regexp=>/^	If the page is not redirected, please click <a href="\/login\.html\?[\d]{4}&1">here<\/a><br>$/ },

# HTML Comment
{ :text=>'<!--mei20071101 input type="image" name="recMode" style="visibility:hidden" src="stoprec.gif" onclick="changeRecordMode()"-->' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^http server\/everfocus$/

		m << { :name=>"HTTP Server Header" }

		# HTML Comment
		if @body =~ /<!--Version [\d]{8} for [\d\.]+ EF -->/

			# Version Detection
			m << { :version=>@body.scan(/^<!--Version [\d]{8} for ([\d\.]+) EF -->/) }

			# Firmware Build/Year Detection
			m << { :firmware=>@body.scan(/^<!--Version ([\d]{8}) for [\d\.]+ EF -->/) }

		end

		# ERViewer.ocx Version Detection # JavaScript
		m << { :module=>"ERViewer.ocx/"+@body.scan(/var g_sVersion = "([\d\.]+)"/).to_s } if @body =~ /var g_sVersion = "[\d\.]+"/

	end

	# Return passive matches
	m
end

end

