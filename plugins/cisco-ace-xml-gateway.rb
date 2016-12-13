##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cisco-ACE-XML-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-21
version "0.1"
description "The Cisco ACE XML Gateway is a key component of the Cisco Application Control Engine (ACE) family of products. The ACE XML Gateway delivers an integrated XML firewall."
website "http://www.cisco.com/en/US/products/ps7314/index.html"

# ShodanHQ results as at 2011-09-21 #
# 231 for ACE XML Gateway



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^ACE XML Gateway$/ },

]

end

