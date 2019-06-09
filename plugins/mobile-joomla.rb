##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Mobile-Joomla"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2012-03-15
]
version "0.1"
description "Mobile Joomla"
website "http://www.mobilejoomla.com/"

# ShodanHQ results as at 2011-03-13 #
# 70 for mjmarkup



# Matches #
matches [

# Set-Cookie # mjmarkup=deleted;
{ :search=>"headers[set-cookie]", :regexp=>/mjmarkup=deleted;/ },

]

end

