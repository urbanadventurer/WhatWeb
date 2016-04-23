##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Citrix-Web-PN-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-13
version "0.1"
description "Citrix Web PN Server - http://www.citrix.com"

# ShodanHQ results as at 2011-08-13 #
# 5,716 for Citrix Web PN Server



# Matches #
matches [

# Server Header
{ :search=>"headers[server]", :regexp=>/^Citrix Web PN Server$/ },

]

end

