##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "APC-InfraStruXure-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Modular, adaptable, on-demand solutions for data centers. InfraStruxure is a scalable and adaptable data center IT room architecture that dramatically reduces time and complexity from concept and design through installation."
website "http://www.apc.com/products/infrastruxure/index.cfm"



# Matches #
matches [

# Title
{ :certainty=>75, :text=>'<title>APC | InfraStruXure Manager</title>' },

# ldrISX.jpg
{ :text=>'<td align="center" width="725" height="72"><img src="images/ldrISX.jpg" alt="ISX Manager" align="left" border="0"/></td>' },

# Xlogo_Layer-1.gif
{ :text=>'<td><img src="images/Xlogo_Layer-1.gif" height="327" width="342" align="left"/></td>' },

]

# Passive #
def passive
	m=[]

	# Location
	if @headers["server"] =~ /^Acme\.Serve/ and @status.to_s =~ /^302$/ and @headers["location"] =~ /^isx\.html$/
		m << { :certainty=>25, :name=>"isx.html redirect" }
	end

	# Return passive matches
	m
end

end

