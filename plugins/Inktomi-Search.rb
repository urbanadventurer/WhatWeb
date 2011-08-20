##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Inktomi-Search" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "Inktomi Search engine - Homepage: http://www.inktomi.com/products/search/"

# ShodanHQ results as at 2011-08-20 #
# 20 for Inktomi

# Examples #
examples %w|
202.32.165.73
64.140.216.209
213.121.208.42
139.76.164.26
63.127.194.201
159.247.0.197
63.127.194.135
202.175.15.184
216.83.98.68
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Inktomi Search ([^\s]+)$/ },

# Version Detection # /util/badkey.html
{ :url=>"/util/badkey.html", :version=>/<font size="\+1"><b>License Key Problems<\/b><\/font><br>[\s]+<b>Inktomi Search ([^<^\s]+)<\/b><br>/ },

]

end

