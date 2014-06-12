##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache-Cocoon" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Apache Cocoon is a Spring-based framework (since version 2.2 of Cocoon) built around the concepts of separation of concerns and component-based development. - homepage: http://cocoon.apache.org/"

# ShodanHQ results as at 2011-02-24 #
# 707 for X-Cocoon-Version



# Passive #
def passive
	m=[]

	# X-Cocoon-Version Header
	m << { :version=>@headers['x-cocoon-version'].to_s } unless @headers['x-cocoon-version'].nil?

	# Return passive matches
	m
end

end


