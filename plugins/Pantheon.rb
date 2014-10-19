##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pantheon" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-29
version "0.1"
description "Pantheon"
website "https://www.getpantheon.com/"

# ShodanHQ results as at 2012-09-29 #
# 17 for x-pantheon-edge-server



# Matches #
matches [

# x-pantheon-edge-server Header
{ :search=>"headers[x-pantheon-edge-server]", :string=>/^(.*)$/ },

# 404 message
{ :search=>"headers", :regexp=>/HTTP\/1\.[01] 404 Unknown site\!/ },

]

end

