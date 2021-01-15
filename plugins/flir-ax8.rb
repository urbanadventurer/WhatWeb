##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "Flir-AX8"
	authors [
		"Andrew Horton", # v0.1 # 2021-01-16 # Created plugin
	]
	version "0.1"
	description "FLIR AX8 is a Thermal Imaging Camera For Continuous Condition and Safety Monitoring"
	website "https://www.flir.com/products/ax8-automation/"

	# Dorks # 
	dorks [
	'intitle:"FLIR AX8" "User web" password'
	]

	# Matches #
	matches [
		# Title. Each FLIR AX8 has a different title
		{ :text => '<p style="display: inline-block" id="login-title">FLIR AX8' }
	] 

end
