##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "crossdomain_xml" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-09
version "0.1"
description "This plugin extracts allowed domain from crossdomain.xml"

# 61 results for ext:xml "allow-access-from domain" inurl:"crossdomain.xml"



# Matches #
matches [

	# Default text
	{ :text=>'<cross-domain-policy>', :path=>"crossdomain.xml" },

	{ :text=>'<site-control permitted-cross-domain-policies="none"/>', :string=>"none", :module=>"Permit", :path=>"crossdomain.xml" },

	# Extract allowed domains
	{ :string=>/<allow-access-from domain="([^"]+)"/, :path=>"crossdomain.xml", :module=>"Allow" },

]

end

