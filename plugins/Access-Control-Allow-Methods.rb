##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Access-Control-Allow-Methods" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "Specifies the method or methods allowed when accessing a resource"
website "http://www.w3.org/TR/2008/WD-access-control-20080912/"

# ShodanHQ results as at 2011-08-20 #
# 106 for Access-Control-Allow-Methods



# Matches #
matches [

# Access-Control-Allow-Methods Header
{ :search=>"headers[access-control-allow-methods]", :string=>/(.+)/ },

]

end

