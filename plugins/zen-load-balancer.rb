##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zen-Load-Balancer" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-29
version "0.1"
description "Zen Load Balancer is a complete solution for load balancing to provide a high availability for TCP and UDP services and data line communications."
website "http://www.zenloadbalancer.com/web/"

# Default Port  # 444 (HTTPS)
# Default Login # admin / admin



# Matches #
matches [

# /config/global.conf
{ :url=>"/config/global.conf", :version=>/#version ZEN\s+\$version=\"([^\"]+)"/ },

# WWW-Authenticate: Basic realm="Zen Load Balancer"
{ :search=>"headers[www-authenticate]", :text=>'Basic realm="Zen Load Balancer"' },

]

end

