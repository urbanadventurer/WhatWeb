##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Simplewire" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.2"
description "Simplewire - Wireless Messaging Network - Simplewire is a premium billing and messaging aggregator. Simplewire's aggregation services provide the most direct and reliable route into each mobile operator's network for the delivery of text-messages, premium content, cross-carrier short-codes, billing transactions and other value-added mobile services."
website "http://www.simplewire.com/"
# More Info #
# http://search.cpan.org/~rootlevel/Net-Pager-2.00/lib/Net/Pager.pm
# http://www.openmarket.com/

# ShodanHQ results as at 2011-05-31 #
# 5 for Simplewire

matches [

	# HTTP Server Header
	{ :regexp=>/^Simplewire/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Simplewire\/([^\s]+)$/, :search=>"headers[server]" },

]

end

