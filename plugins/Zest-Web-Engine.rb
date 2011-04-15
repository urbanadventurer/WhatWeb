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

# Examples #
examples %w|
www.zest-leisure.com
campusweb.warren-wilson.edu/cgi-bin/web.asp
campusweb.morningside.edu/cgi-bin/web.asp
216.15.215.240
65.175.91.208
65.175.102.138
66.165.120.93
65.175.109.102
66.165.127.218
216.15.170.67
66.201.115.102
216.15.131.22
216.198.243.234
|

# Matches #
matches [

# Version Detection # Powered by logo+url+text
{ :version=>/Powered by the <br \/><img src='http:\/\/www.[^\/]+\/images\/zestlogo\.gif' style='border:0 ; ' alt='Zest Web Engine' \/><br \/>Zest web engine<br \/>V([\d\.]+)<br \/>/ },

]

# Passive #
def passive
	m=[]

	# Location HTTP Header
	m << { :name=>"Location HTTP Header" } if @meta["location"] =~ /cgi-bin\/web\.asp\?title=\*home$/

	# Return passive matches
	m
end

end


