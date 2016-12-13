##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RackStar-Server-Appliance-OS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "RackStar can be installed on almost any PC platform. That's what makes the RackStar Server Appliance Software so great! Now anyone can host sites! Still got a Cobalt RAQ? No problem! RackStar runs on that too!"
website "http://www.rackstar.net/"

# 322 ShodanHQ results for www.rackstar.net


# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/<A HREF='http:\/\/www.rackstar.net\/' TITLE='This server is powered by the RackStar Server Appliance OS'>RACKSTAR<\/A>/ },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/\(<A HREF=http:\/\/www.rackstar.net\/>RACKSTAR<\/A>\)/ },

]

end

