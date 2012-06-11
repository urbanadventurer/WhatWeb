##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Unica" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-11
version "0.1"
description "Unica is a leading provider of innovative marketing solutions. - Homepage: https://www-01.ibm.com/software/marketing-solutions/unica/"

# Examples #
examples %w|
www.news.com.au
|

# Matches #
matches [

# Account Detection
{ :account=>/<img src="\/\/[^\.^\s]+\.unica\.com\/ntpagetag\.gif\?js=0&amp;sitename=([^\s^"^&]+)"/ },

]

end

