##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "AirOS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-30
]
version "0.1"
description "AirOS is an intuitive, versatile, highly developed Ubiquiti firmware technology that resides on Ubiquiti Station products. It is exceptionally intuitive and was designed to require no training to operate. Behind the user interface is a powerful firmware architecture which enables hi-performance outdoor multipoint networking. "
website "http://www.ubnt.com/airos"

# ShodanHQ results as at 2010-10-30 #
# 8,411 for "Set-Cookie:" "AIROS_SESSIONID" Path= Version=
# 8,411 for "cookiechecker uri="



matches [

# Login page
{ :text=>"cache_images(['main_top.png', 'main.png', 'link.png', 'net.png', '4dv.png', 'srv.png', 'system.png', 'border.gif', 'spectr.gif']);" },

]

# Passive # HTTP Header
passive do
	m=[]

	# Cookie
	m << { :name=>"AIROS_SESSIONID Cookie" } if @headers["set-cookie"] =~ /AIROS_SESSIONID=[a-z0-9]{32}; Path=\/; Version=([\d\.]+)/

	# Location: /cookiechecker?uri=/
	m << { :name=>"Location HTTP Header", :status=>301 } if @headers["location"] =~ /\/cookiechecker\?uri=\//

	m

end

end

