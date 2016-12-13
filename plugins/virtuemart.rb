##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VirtueMart" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "VirtueMart is an Open Source E-Commerce solution to be used together with a Content Management System (CMS) called Joomla!. Joomla! and VirtueMart are written in PHP and can be used in typical PHP/MySQL environments."
website "http://virtuemart.net/"

# ShodanHQ results as at 2011-05-23 #
# 8,747 for virtuemart



# Matches #
matches [

# div id vmMainPage
{ :certainty=>25, :regexp=>/<div id=["']vmMainPage/ },

# Absolute registration URL without Search Engine Friendly (SEF) mode
{ :certainty=>75, :text=>'href="/index.php?option=com_virtuemart&amp;page=shop.registration">' },

]

# Passive #
def passive
	m=[]

	# virtuemart cookie
	m << { :name=>"virtuemart cookie" } if @headers["set-cookie"] =~ /virtuemart=[a-z\d]{26,32}/

	# Return passive matches
	m
end

end

