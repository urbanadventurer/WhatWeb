##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pharos-LPC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-14
version "0.1"
description "Pharos LPC web interface - All-in-one control solution for entertainment and LED lighting installations."
website "http://www.pharoscontrols.com/products/lighting_controllers/lpc"

# Two LPC models available: LPC 1 (512 DMX channels) and LPC 2 (1024 DMX channels)

# Datasheets for LPC and LPC X #
# http://www.pharoscontrols.com/assets/files/datasheets/pharos_lpc_datasheet.pdf
# http://www.pharoscontrols.com/assets/files/datasheets/pharos_lpc_x_datasheet.pdf

# ShodanHQ results as at 2011-07-14 #
# 5 for pharos_lpc



# Passive #
def passive
	m=[]

	# Default Title
	if @body =~ /<title>Pharos LPC[^<]*<\/title>/

		# Firmware Detection
		if @body =~ /<td class = "header">Firmware Version:<\/td><td colspan = "4">([^<]+)<\/td>/
			m << { :firmware=>@body.scan(/<td class = "header">Firmware Version:<\/td><td colspan = "4">([^<]+)<\/td>/) }
		end
	
		# Module Detection
		if @body =~ /<td class = "header">Expansion Modules:<\/td><td>([^<]+)<\/td>/
			m << { :module=>@body.scan(/<td class = "header">Expansion Modules:<\/td><td>([^<]+)<\/td>/) }
		end

		# Model Detection
		if @body =~ /<td class = "header">Product Type:<\/td><td colspan = "4">([^<]+)<\/td>/
			m << { :model=>@body.scan(/<td class = "header">Product Type:<\/td><td colspan = "4">([^<]+)<\/td>/) }
		end
		if @body =~ /<title>Pharos (LPC[\d]) [\d]{6}[\s]*<\/title>/
			m << { :model=>@body.scan(/<title>Pharos (LPC[\d]) [\d]{6}[\s]*<\/title>/) }
		end

	end

	# Redirect Location
	m << { :certainty=>75, :name=>"Redirect Location" } if @headers["location"] =~ /^https?:\/\/[^\/]+\/pharos_lpc\/index\.asp$/

	# WWW-Authenticate Realm
	m << { :name=>"authenticate realm" } if @headers["www-authenticate"] =~ /Digest realm="PharosLPC"/

	# Return passive matches
	m
end

end

