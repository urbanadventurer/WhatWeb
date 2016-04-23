##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MJNioHttpDaemon" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-14
version "0.1"
description "MJNioHttpDaemon"
# Any idea who makes this? Please contact me

# ShodanHQ results as at 2011-09-14 #
# 12 for MJNioHttpDaemon
# 12 for MJNIOHTTPDSESSIONID



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^MJNioHttpDaemon\/([^\s]+)/ },

# MJNIOHTTPDSESSIONID Cookie
{ :search=>"headers[set-cookie]", :regexp=>/MJNIOHTTPDSESSIONID=/ },

]

end

