##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Access-Control-Allow-Methods" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "Specifies the method or methods allowed when accessing a resource - More info: http://www.w3.org/TR/2008/WD-access-control-20080912/"

# ShodanHQ results as at 2011-08-20 #
# 106 for Access-Control-Allow-Methods

# Examples #
examples %w|
196.33.235.224
4.53.93.165
188.40.205.227
74.81.195.155
85.17.224.91
186.215.208.107
209.20.76.103
216.127.144.113
69.168.111.70
|

trigger "access-control-allow-methods"

# Matches #
matches [

# Access-Control-Allow-Methods Header
{ :search=>"headers[access-control-allow-methods]", :string=>/(.+)/ },

]

end

