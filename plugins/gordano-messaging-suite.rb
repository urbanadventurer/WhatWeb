##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Gordano-Messaging-Suite" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "Gordano WebMail Server web interface"
website "http://gordano.com/products/webmail.htm"

# ShodanHQ results as at 2011-08-20 #
# 1,344 for Gordano Messaging Suite
#    18 for Gordano -Messaging



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Gordano (Messaging Suite )?Web Server v([^\s]+)$/, :offset=>1 },

]

end

