##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPWind" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "BBS [Chinese]"
website "http://www.phpwind.net/"

# Google results as at 2011-03-18 #
# 602 for "Powered by PHPWind"

# Dorks #
dorks [
'"Powered by PHPWind"'
]



# Matches #
matches [

# Title
{ :certainty=>25, :regexp=>/<title>[^<]+ - (powered by phpwind.net|Powered by PHPWind)<\/title>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="PHPWind [v]?([^"^\(]+)(\([\d]+\))?" \/>/i },

# Powered by text
{ :text=>'Powered by <a href="http://www.phpwind.net/" target="_blank"><b>PHPWind</b></a>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.phpwind.net\/" target="_blank"><b>PHPWind<\/b><\/a>[\s]*<a href="http:\/\/www.phpwind.net\/" target="_blank"><b style="color:#FF9900">v([\d\.]+)<\/b><\/a>/ },

]

end


