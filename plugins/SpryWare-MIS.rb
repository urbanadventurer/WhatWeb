##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SpryWare-MIS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "SpryWare Market Information Server (MIS) - Homepage: http://www.spryware.com/products_MIS.html"

# ShodanHQ results as at 2011-03-13 #
# 67 for spryware

# Examples #
examples %w|
72.5.193.42
74.217.166.246
72.5.193.66
72.5.193.85
72.5.193.78
72.5.193.70
72.5.193.7
72.5.193.23
12.26.7.154
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^SpryWare\/([^\s]+)$/ },

# X-Deprecated-Response Header
{ :search=>"headers[x-deprecated-response]", :regexp=>/^Invalid CheckSum Received$/ },

]

end

