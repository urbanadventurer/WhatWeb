##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Symfony" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-31
version "0.1"
description "Symfony - open-source PHP web framework"
website "http://www.symfony-project.org/"



# Matches #
matches [

	# GHDB Match
	{ :ghdb=>'"powered by symfony"', :certainty=>25 },

	# Powered by text
	{ :text=>'Powered by <a href="http://www.symfony-project.org/">' },

]

end


