##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Home-Control-Box" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "The Home Control Box is a small, powerful computer that integrates the various sensors and electronic systems in the home into one single functional system. - Homepage: http://www.homecontrolbox.com/"
# The username is the same as the name of your Home Control Box without 'hcb-', so hcb-xxx-yyyy becomes yyy-xxxx

# ShodanHQ results as at 2011-05-23 #
# 15 for hcb_web
# 15 for BoxTalk
# Most results are from Netherlands



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^hcb_web\/v[^\s]+ BoxTalk\/[^\s]+ SWILL\/[^\s]+ \([^\)]+\)$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^hcb_web\/v([^\s]+) BoxTalk\/[^\s]+ SWILL\/[^\s]+ \([^\)]+\)$/) }

		# BoxTalk Version
		m << { :module=>@headers["server"].scan(/^hcb_web\/v[^\s]+ (BoxTalk\/[^\s]+) SWILL\/[^\s]+ \([^\)]+\)$/) }

		# SWILL Version
		m << { :module=>@headers["server"].scan(/^hcb_web\/v[^\s]+ BoxTalk\/[^\s]+ (SWILL\/[^\s]+) \([^\)]+\)$/) }

		# No Login Required
		if @body =~ /<frame frameborder="0" name="MGUI" src="myhcb_gui\.html" scrolling="no" \/>/
			m << { :string=>"No Login Required" }
		end

	end

	# Username Detection # WWW-Authenticate header
	if @headers["www-authenticate"] =~ /^Basic realm="Home Control Box Configuration \(hcb-([a-z]{3}-[\d]{4})\)"$/
		m << { :account=>@headers["www-authenticate"].scan(/^Basic realm="Home Control Box Configuration \(hcb-([a-z]{3}-[\d]{4})\)"$/) }
	end

	# Return passive matches
	m
end

end

# An aggressive plugin could get the device uptime, country, firmware version and owner's address from /config/general.pl if the device does not require authentication

