##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Micronet-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-11
version "0.1"
description "Micronet Communications Router"
website "http://www.micronet.com.tw/mod/product/index.php?NodeID=23"

# ShodanHQ results as at 2012-04-11 #
# 1,394 for RCTTools (SecureSOHO Web configuration Tools)



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :certainty=>75, :search=>"headers[server]", :version=>/^RCTTools \(SecureSOHO Web configuration Tools\) v([^\s]+)$/ },

# /image/iso-8859-1/logo.jpg # SP888B
{ :url=>"/image/iso-8859-1/logo.jpg", :md5=>"25acf0f5466c0ba42901a0a0b3251f5d", :model=>"SP888B" },

]

end

