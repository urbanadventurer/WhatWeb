##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "x-machine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "This plugin identifies the x-machine and x-machine-id headers and extracts their values."

# ShodanHQ results as at 2011-04-08 #
# 285 for x-machine



# Passive #
def passive
	m=[]
	
	# X-Machine HTTP Header
	m << { :string=>@headers["x-machine"] } unless @headers["x-machine"].nil?

	# X-Machine-ID HTTP Header
	m << { :string=>@headers["x-machine-id"] } unless @headers["x-machine-id"].nil?

	# Return passive matches
	m

end

end

