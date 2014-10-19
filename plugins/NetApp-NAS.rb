##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetApp-NAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "NetApp network-attached storage solutions and a unified storage architecture can help solve your file-storage challenges and lower your costs."
website "http://www.netapp.com/us/products/protocols/nas/nas.html"

# ShodanHQ results as at 2011-03-13 #
# 1,485 for NetApp -NetCache



# Matches #
matches [

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^NetApp\/(.+)$/ },

]

end

