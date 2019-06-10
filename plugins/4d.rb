##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "4D"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-11
  "Andrew Horton", # v0.2 # 2019-07-10 # Removed Homepage: from the website
]
version "0.2"
description "4D web application deployment server"
website "http://www.4d.com/products.html"

# ShodanHQ results as at 2011-04-11 #
# 431 for 4D_v11_SQL

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^4D_v[\d]{1,2}(_SQL)?\/([\d\.]+)$/, :offset=>1 },

]

end

