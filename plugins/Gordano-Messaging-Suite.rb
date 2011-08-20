##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Gordano-Messaging-Suite" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "Gordano WebMail Server web interface - Homepage: http://gordano.com/products/webmail.htm"

# ShodanHQ results as at 2011-08-20 #
# 1,344 for Gordano Messaging Suite
#    18 for Gordano -Messaging

# Examples #
examples %w|
62.49.107.82
217.16.50.138
69.67.96.180
217.16.50.178
91.151.210.214
69.67.96.176
77.239.97.218
69.67.96.152
93.166.166.214
207.159.60.226
83.145.127.235
83.145.127.225
83.145.127.2
83.145.127.231
83.145.127.7
83.145.127.181
194.184.184.5
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Gordano (Messaging Suite )?Web Server v([^\s]+)$/, :offset=>1 },

]

end

