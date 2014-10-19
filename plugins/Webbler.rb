##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Webbler" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-05
version "0.1"
description "The Webbler is a powerful tool to build new websites or add additional areas or functionality to your existing website. It is a Content Management System (CMS) and an Application Toolkit that we customise to suit your needs."
website "http://www.tincan.co.uk/Webbler"

# ShodanHQ results as at 2011-04-05 #
# 1 for WebblerSession

# Google results as at 2011-05-04 #
# 122 for "Powered by the Webbler"

# Dorks #
dorks [
'"Powered by the Webbler"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="webbler ([^\s]+) - http:\/\/tincan\.co\.uk\/webbler"  \/?>/ },

]

# Passive #
def passive
	m=[]

	# Cookie
	m << { :name=>"WebblerSession Cookie" } if @headers["set-cookie"] =~ /WebblerSession=/

	# Return passive matches
	m
end

end


