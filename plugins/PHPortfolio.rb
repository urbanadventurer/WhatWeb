##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPortfolio" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "PHPortfolio is a simple system for photographers to publish a portfolio. Requirements: Unix/Linux, Apache 1.3.x, PHP 4.2+ with GD 2 libraries, and MySQL 3.23+. PHP will need to have short_tags enabled (it usually is)."
website "http://www.outshine.com/software/phportfolio/index.php"

# Google results as at 2011-05-23 #
# 63 for "Powered by PHPortfolio" -Dork -D0rk
# 36 for "Powered by PHPortfolio" inurl:photo.php

# Dorks #
dorks [
'"Powered by PHPortfolio" inurl:photo.php'
]



# Matches #
matches [

# Powered by text
{ :regexp=>/style="color:gray;font-size:smaller">Powered by <a href="http:\/\/www\.outshine\.com\/phportfolio\/"[^>]*>PHPortfolio<\/a>\./ },

]

end

