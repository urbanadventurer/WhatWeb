##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "eLitius" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.2"
description "eLitius is a free software package that allows a person to easily create and manage his own Affiliate Program, recruit affiliates, track visitors and sales."
website "http://www.elitius.com/"

# 21 results for "Powered by eLitius Version" -exploit -vulnerabilities



# Matches #
matches [

	# Meta Description
	{ :text=>'<meta name="description" content="eLitius Affiliate Management Software" />' },

	# Version Detection # Powered by text
	{ :version=>/[\s]+Powered by <a href="http:\/\/www.elitius.com\/" target="_blank" title="Affiliate [^>]{8,10} Software">eLitius<\/a> Version ([\d\.]+)<br \/>/ },

]

end

