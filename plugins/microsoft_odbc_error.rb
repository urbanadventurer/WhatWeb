##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Microsoft-ODBC-Error"
authors [
  "Caleb Anderson",
  "Brendan Coles <bcoles@gmail.com>", # v0.2 # 2011-03-05 # Updated error code string detection to reduce false positives. 
]
version "0.2"
description "This plugin identifies Microsoft ODBC error codes."

# Error code list :
# http://www.easysoft.com/developer/interfaces/odbc/sqlstate_status_return_codes.html

# Google results as at 2011-03-05 #
# 100 for "ODBC Error Code = 37000 (Syntax error or access violation)" ext:cfm



# Passive #
passive do
	m=[]

	# ODBC Error Code
	if @body =~ /\[ODBC/
		m << { :certainty=>25, :string=>@body.scan(/ODBC Error Code = ([a-zA-Z0-9]{3,5}) \(/) }
	end

	# Return passive matches
	m
end

end


