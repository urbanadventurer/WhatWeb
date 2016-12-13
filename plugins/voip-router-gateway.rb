##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VoIP-Router-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "ALLWIN Tech VoIP Router Gateway device [ Chinese ] - Runs EIA AOS software"
# Default login: admin/admin

# About 1303 ShodanHQ results for WWW-Authenticate: Basic realm="Web Config System" @ 2010-11-01


matches [

# Admin page
{ :text=>'<area shape="poly" coords="152,237,152,180,194,180,260,215,293,214,293,236" href="enFrame.htm" alt="english version" onClick="form_submit(\'english\')">' },

]

# Passive #
def passive
	m=[]

	# Check HTTP Server Header
	if @headers["server"] =~ /^GoAhead-Webs/

		# HTTP Server Header and WWW-Authenticate Realm
		m << { :status=>401, :name=>"HTTP Server Header and WWW-Authenticate Realm" } if @headers["www-authenticate"] =~ /Basic realm="Web Config System"/

	end

	m

end

# An aggressive plugin could get the PPPoE account and password details from http://222.247.232.31/enLocalNetwork.htm

end

