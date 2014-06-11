##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Star-Network" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "hompage: http://www.starltd.net/"

# 5 results for "Powered by Star Network" @ 2010-08-08


matches [
{ :regexp=>/Powered [b|B]+y <a href="http:\/\/www.[starltd.net|s4u.co.il]+[\/]*">Star Network[\ and\ Promotion\ LTD|\&amp\;\ Promotion\ LTD]*<\/a>/ },
]

end

