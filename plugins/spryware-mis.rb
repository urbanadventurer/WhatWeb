##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SpryWare-MIS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "SpryWare Market Information Server (MIS)"
website "http://www.spryware.com/products_MIS.html"

# ShodanHQ results as at 2011-03-13 #
# 67 for spryware



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^SpryWare\/([^\s]+)$/ },

# X-Deprecated-Response Header
{ :search=>"headers[x-deprecated-response]", :regexp=>/^Invalid CheckSum Received$/ },

]

end

