##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AvantFAX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-10
version "0.1"
description "AvantFAX is a web application for managing faxes on HylaFAX fax servers. - Homepage: http://avantfax.com/"

# ShodanHQ results as at 2011-05-10 #
# 216 for AvantFAX

# Examples #
examples %w|
206.169.74.3
213.155.192.10
205.134.248.165
8.17.32.43
95.39.23.118
216.30.213.178
77.38.12.137
94.100.70.33
|

# Matches #
matches [

# Meta description
{ :text=>'<meta name="description" content="Web 2.0 HylaFAX management" />' },

# Password input HTML
{ :text=>'</label><br /><br /><input type="password" name="password" id="password" style="width: 12em" maxlength="15" /></p><br />' },

]

# Passive #
def passive
	m=[]

	# AvantFAX Cookie
	m << { :name=>"AvantFAX Cookie" } if @meta["set-cookie"] =~ /AvantFAX=[a-z\d]{26}; path=\//

	# Return passive matches
	m
end

end


