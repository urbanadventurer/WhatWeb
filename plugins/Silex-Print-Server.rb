##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Silex-Print-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-08
version "0.1"
description "Silex Print Server - Print servers connect printers directly to the network so that multiple PCs can share them. - Homepage: http://www.silexamerica.com/"

# ShodanHQ results as at 2011-03-08 #
# 154 for silex Web Admin

# Google results as at 2011-03-08 #
# 4 for "System Description:" "silex SX-500"

# Examples #
examples %w|
198.110.201.67
129.10.83.243
69.224.25.130
99.91.180.154
69.230.13.10
99.24.26.178
75.40.71.140
99.22.154.2
209.232.101.210
99.129.51.67
69.237.161.34
99.153.120.163
76.245.82.74
66.60.140.151
99.23.166.19
76.200.109.20
99.18.249.74
67.126.19.147
76.249.169.226
134.48.90.79
66.60.140.152
69.230.6.146
67.121.130.139
12.35.73.148
69.230.5.131
130.238.108.247
207.47.30.148
75.22.178.250
74.8.207.109
65.66.35.148
69.106.167.18
12.135.167.148
75.128.162.253
67.64.196.21
99.23.84.2
63.67.69.215
160.94.204.10
99.14.77.162
71.130.72.219
99.101.194.67
99.61.77.202
99.167.68.35
70.147.136.245
64.163.147.82
134.48.90.75
75.40.71.139
|

# Matches #
matches [

# Default Printer Logo
{ :url=>"/troy_large_bw.gif", :md5=>"ba4feb9ffb5d77f9c72269549d07b78e" },

# Default Logo
{ :url=>"/silex_logo.gif", :md5=>"ba4feb9ffb5d77f9c72269549d07b78e" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^silex Web Admin$/

		# HTTP Server Header
		m << { :name=>"HTTP Server Header" }

		# Printer Model Detection # Default Title
		m << { :string=>@body.scan(/<TITLE>([^<]{5,20})<\/TITLE>/) } if @body =~ /<TITLE>([^<]{5,20})<\/TITLE>/

		# Print Server Model Detection # Default Title
		m << { :model=>@body.scan(/<TITLE>[S|s]ilex ([^\s^<]{5,10})<\/TITLE>/), } if @body =~ /<TITLE>[S|s]ilex ([^\s^<]{5,10})<\/TITLE>/

	end

	# Return passive matches
	m
end

end


