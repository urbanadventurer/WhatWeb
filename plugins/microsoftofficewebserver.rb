##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-26 #
# Updated version detection regex
##
Plugin.define "MicrosoftOfficeWebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.2"
description "Microsoft Office Web Server"
website "http://microsoft.com/"

# About 233,672 ShodanHQ results for MicrosoftOfficeWebServer: @ 2010-10-23



# Passive #
def passive
	m=[]

	# MicrosoftOfficeWebServer HTTP Header
	m << { :version=>@headers["microsoftofficewebserver"].to_s } unless @headers["microsoftofficewebserver"].nil?

	# Return passive matches
	m

end

end

