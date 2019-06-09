##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "BLOX"
authors [
  "Shuai Lin",
  "Bhavin Senjaliya", # v0.2 # 2016-08-19 # Add cookie. 
  "Andrew Horton", # v0.3 # 2017-11-27 # Added website and updated description. 
]
version "0.2"
description "BLOX is a cloud based CMS"
website "https://www.townnews365.com./"

matches [

	{:regexp => /BLOX CMS version: [\d.]+/},

	{ :search => "headers[set-cookie]", :regexp => /^TNNoMobile/, :name=>"TNNoMobile cookie" },

]

end
