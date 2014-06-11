##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zest-Web-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "Zest Web Engine - Homepage: http://www.zest-leisure.com/"

# Google results as at 2011-04-08 #
# 83 for inurl:/cgi-bin/web.asp

# ShodanHQ results as at 2011-04-08 #
# 13 for /cgi-bin/web.asp

# Dorks #
dorks [
'inurl:/cgi-bin/web.asp'
]



# Matches #
matches [

# Version Detection # Powered by logo+url+text
{ :version=>/Powered by the <br \/><img src='http:\/\/www.[^\/]+\/images\/zestlogo\.gif' style='border:0 ; ' alt='Zest Web Engine' \/><br \/>Zest web engine<br \/>V([\d\.]+)<br \/>/ },

]

# Passive #
def passive
	m=[]

	# Location HTTP Header
	m << { :name=>"Location HTTP Header" } if @headers["location"] =~ /cgi-bin\/web\.asp\?title=\*home$/

	# Return passive matches
	m
end

end


