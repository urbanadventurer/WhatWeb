##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AirOS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "AirOS is an intuitive, versatile, highly developed Ubiquiti firmware technology that resides on Ubiquiti Station products. It is exceptionally intuitive and was designed to require no training to operate. Behind the user interface is a powerful firmware architecture which enables hi-performance outdoor multipoint networking.  - homepage: http://www.ubnt.com/airos"

# 8411 ShodanHQ results for "Set-Cookie:" "AIROS_SESSIONID" Path= Version=
# 8411 ShodanHQ results for "cookiechecker uri="
examples %w|
109.73.178.41
79.110.115.131
88.148.20.201
91.202.136.212
82.177.204.114
208.65.187.90
209.150.15.65
62.122.121.201
190.221.44.70
78.28.122.244
|

matches [

# Login page
{ :text=>"cache_images(['main_top.png', 'main.png', 'link.png', 'net.png', '4dv.png', 'srv.png', 'system.png', 'border.gif', 'spectr.gif']);" },

]

# Passive # HTTP Header
def passive
	m=[]

	# Cookie
	m << { :name=>"AIROS_SESSIONID Cookie" } if @meta["set-cookie"] =~ /AIROS_SESSIONID=[a-z0-9]{32}; Path=\/; Version=([\d\.]+)/

	# Location: /cookiechecker?uri=/
	m << { :name=>"Location HTTP Header", :status=>301 } if @meta["location"] =~ /\/cookiechecker\?uri=\//

	m

end

end

