##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MACOS-Personal-Websharing" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "Web Sharing is a feature in Mac OS X that allows you to serve documents and other files from your computer."
website "http://support.apple.com/kb/HT2973"

# More info #
# http://guides.macrumors.com/Personal_Web_Sharing
# http://kb.iu.edu/data/algt.html

# ShodanHQ results as at 2011-06-02 #
# 88 for MACOS_Personal_Websharing



# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header", :string=>"Apache" } if @headers["server"] =~ /^MACOS_Personal_Websharing$/

	# Return passive matches
	m
end

end

