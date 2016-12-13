##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PowerSchool" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "PowerSchool is the fastest-growing, most widely used web-based student information system, supporting more than 8.5 million students in 50 states and over 50 countries."
website "http://www.pearsonschoolsystems.com/products/powerschool/"

# ShodanHQ results as at 2011-04-08 #
# 3,328 for PowerSchool



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^PowerSchool$/ },

]

end

