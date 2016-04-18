##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "4D" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-11
version "0.1"
description "4D web application deployment server"
website "Homepage: http://www.4d.com/products.html"

# ShodanHQ results as at 2011-04-11 #
# 431 for 4D_v11_SQL

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^4D_v[\d]{1,2}(_SQL)?\/([\d\.]+)$/, :offset=>1 },

]

end

