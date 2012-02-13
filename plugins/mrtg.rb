##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "mrtg" do
author "Aung Khant <http://yehg.net/>" # 2012-02-10
version "0.1"
description "MRTG - Multi Router Traffic Grapher - http://oss.oetiker.ch/mrtg/"

# Google results as at 2012-02-13 #
# 1 for inurl:"aggregated.html" intitle:"Aggregated traffic"

# Examples #
examples %w|
http://www.six.sk/mrtg/aggregated.html
|

# Matches #
matches [
{:text=>'title="Multi Router Traffic Grapher" alt="Multi Router Traffic Grapher"'},
]

# Aggressive #
def aggressive
	m=[]

	target = URI.join(@base_uri.to_s,'mrtg/aggregated.html').to_s	
	status,url,ip,body,headers=open_target(target)	
	if status == 200

		if body =~ /title="Multi Router Traffic Grapher" alt="Multi Router Traffic Grapher"/
			m << {:name => 'HTML Body'}
		end

	end

end

end

