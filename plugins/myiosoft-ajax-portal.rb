##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "MyioSoft-Ajax-Portal"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-08-14
  # v0.2 # 2011-02-18 # Updated version detection. 
]
version "0.2"
description "AjaxPortal is based on Sajax technology - an open source tool to make programming websites using the Ajax framework known as XMLHTTPRequest or remote scripting as easy as possible."
website "http://myiosoft.com/"

# Google results as at 2010-08-14 #
# 20 for "powered by Ajax Portal"

# Dorks #
dorks [
'"powered by Ajax Portal"'
]



# Matches #
matches [

# Version Detection # Powered by footer text
{ :version=>/      <td align="right"  style="padding:5px; background-color: #EDF2FB;" nowrap> Powered by <a href="http:\/\/myiosoft.com\/\?[\d\.]+">Ajax Portal ([\d\.]+)<\/a><\/td>/ },

]

# Passive #
passive do
	m=[]

	# ajaxp cookie
	m << { :name=>"ajaxp cookie" } if @headers["set-cookie"] =~ /ajaxp=[0-9a-f]{20,32}/

	# Return passive matches
	m

end

end

