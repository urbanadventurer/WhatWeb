##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Aladdin-HASP-License-Manager"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-09-17
]
version "0.1"
description "Aladdin HASP License Manager"
website "http://www3.safenet-inc.com/support/hasp/enduser.aspx#lm"



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^HASP LM\/([^\s]+)$/ },

]

end

