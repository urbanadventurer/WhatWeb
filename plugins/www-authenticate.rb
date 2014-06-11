##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-23 # Brendan Coles <bcoles at gmail dot com>
# Fixed regex bug where WWW-Authenticate header is present but regex match fails
# Updated regex to accept more than one www-authenticate header
# Added examples
##
Plugin.define "WWW-Authenticate" do
author "Aung Khant, http://yehg.net" # modified by Andrew Horton
version "0.2"
description "This plugin identifies the WWW-Authenticate HTTP header and extracts the authentication method and realm."

# More info #
# http://en.wikipedia.org/wiki/Basic_access_authentication"
# http://tools.ietf.org/html/rfc2617

# ShodanHQ results as at 2011-01-23 #
# About 7,089,753 results for "www authenticate"
# About 99,620 results for "www authenticate" -realm
# About 6,718,455 for HTTP/1.0 401 Unauthorized



# Passive #
def passive
	m=[]

	# Check HTTP Header for www-authenticate
	unless @headers['www-authenticate'].nil?

		# Detect Realm
		if @headers['www-authenticate'].to_s =~ /realm=/

			# Extract Authentication Method
			m << { :module=>@headers['www-authenticate'].scan(/([a-z]{3,20})[^\r^\n]{1,256}realm="/i).flatten } if @headers['www-authenticate'].to_s =~ /[a-z]{3,20}[^\r^\n]{1,256}realm="/i

			# Extract Authentication Realm
			m << { :string=>@headers['www-authenticate'].scan(/realm="([^\"]{1,256})"/i).flatten } if @headers['www-authenticate'].to_s =~ /realm="[^\"]{1,256}"/i

		else

			# No Realm # Extract Authentication Method
			m << { :module=>@headers['www-authenticate'].to_s }

		end

	end

	# Return passive matches
	m

end

end


