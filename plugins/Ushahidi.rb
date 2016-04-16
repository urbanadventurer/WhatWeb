##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ushahidi" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-05
version "0.1"
description "The Ushahidi Platform is a platform for information collection, visualization and interactive mapping."
website "http://www.ushahidi.com/"

# ShodanHQ results as at 2011-06-05 #
# 22 for ushahidi_data



# Matches #
matches [

# /favicon.ico
{ :md5=>"7350c3f75cb80e857efa88c2fd136da5", :url=>"/favicon.ico" },

]

# Passive #
def passive
	m=[]

	# ushahidi cookie
	m << { :name=>"ushahidi cookie" } if @headers["set-cookie"] =~ /ushahidi=[^;]+;/

	# ushahidi_data cookie
	m << { :name=>"ushahidi_data cookie" } if @headers["set-cookie"] =~ /ushahidi_data=[^;]+;/

	# Return passive matches
	m
end

end

