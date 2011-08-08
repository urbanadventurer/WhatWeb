##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Bomgar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Bomgar simplifies support by letting technicians control remote computers, servers, smartphones and network devices over the internet or network. With Bomgar, a support rep can see what customers see or control their computers for support. - Homepage: http://www.bomgar.com/remotedesktopaccess/"

# ShodanHQ results as at 2011-05-31 #
# 3,453 for Bomgar

# Examples #
examples %w|
194.209.83.100
130.57.1.144
173.9.73.146
65.51.112.173
69.169.180.41
70.61.233.243
195.67.111.50
209.12.223.8
|

# Matches #
matches [

# Powered by logo
{ :text=>'<img src="/content/poweredby.jpg" alt="Remote Support by BOMGAR"/>' },

# Aggressive # /content/poweredby.jpg
{ :url=>"/content/poweredby.jpg", :md5=>"11a7db4d9e6f72253c60a3f649c5a157" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Bomgar$/

		m << { :name=>"HTTP Server Header" }

		# Version Detection # HTML Comment
		m << { :version=>@body.scan(/<!--Product Version: ([\d\.]+)-->/) } if @body =~ /<!--Product Version: ([\d\.]+)-->/
		m << { :version=>@body.scan(/<!--Bomgar Version: ([\d\.]+)-->/) } if @body =~ /<!--Bomgar Version: ([\d\.]+)-->/

	end

	# Return passive matches
	m
end

end

