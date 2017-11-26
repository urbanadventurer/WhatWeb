##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2017-11-27 # Andrew Horton
# Added website and updated description
##
# Version 0.2 # 2016-08-19 # Bhavin Senjaliya
# Add cookie
##
Plugin.define do
name "BLOX"
author "Shuai Lin"
version "0.2"
description "BLOX is a cloud based CMS"
website "https://www.townnews365.com./"

matches [

	{:regexp => /BLOX CMS version: [\d.]+/},

	{ :search => "headers[set-cookie]", :regexp => /^TNNoMobile/, :name=>"TNNoMobile cookie" },

]

end
