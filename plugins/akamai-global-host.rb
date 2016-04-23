##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Updated HTTP Server Header match
##
Plugin.define "Akamai-Global-Host" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "Akamai-Global-Host HTTPd"

# About 624,447 ShodanHQ results for "server: AkamaiGHost" @ 2010-10-26



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^AkamaiGHost/ },

]

end

