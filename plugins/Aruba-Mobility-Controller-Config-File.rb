##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Aruba-Mobility-Controller-Config-File" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "Aruba's family of mobility controllers are purpose-built network infrastructure devices, designed from the ground up to provide secure, scalable solutions for campus wireless LAN, wired security, branch office deployments, and remote networking. "
website "http://www.arubanetworks.com/products/mobility_controllers.php"

# 4 results for "logging level warnings stm" @ 2010-10-14


matches [

{ :text=>'logging level warnings stm' },
{ :text=>'packet-capture-defaults tcp disable udp disable sysmsg disable other disable' },
{ :text=>'ids-policy rate-frame-type-param disassoc node-time-interval' },

]

def passive
	m=[]

	if @body =~ /ids-policy rate-frame-type-param disassoc node-time-interval/ or @body =~/logging level warnings stm/ or @body =~ /packet-capture-defaults tcp disable udp disable sysmsg disable other disable/

		# Get version
		if @body =~ /^version ([\d\.]+)/
			version=@body.scan(/^version ([\d\.]+)/).flatten
			m << { :version=>version }
		end

		# Get enabled services and ports
		if @body =~ /^netservice svc-([^\n]+)/
			modules=@body.scan(/^netservice svc-([^\n]+)/).flatten
			m << { :module=>modules }
		end

		# Get admin username and password hash
		if @body =~ /^mgmt-user admin ([^\n]+)/
			accounts=@body.scan(/^mgmt-user admin ([^\n]+)/).flatten
			m << { :account=>accounts }
		end

		# Get WPA passphrase
		if @body =~ /wpa-passphrase ([^\n^\ ]+)/
			accounts=@body.scan(/wpa-passphrase ([^\n^\ ]+)/).flatten
			m << { :account=>"WPA-Passphrase:"+accounts }
		end

	end

	m

end

end

