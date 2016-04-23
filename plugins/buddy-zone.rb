##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Buddy-Zone" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "Buddy Zone is a social network script which has all latest technologies needed to run a new version 2.0 Social Network Website."
website "http://www.vastal.com/buddy-zone-social-networking-script.html"

# No results for "Powered By Buddy Zone" @ 2010-09-04

# Dorks #
dorks [
'"Powered By Buddy Zone"'
]



matches [

# Powered by text
{ :text=>'Powered By <a href="http://www.vastal.com" class="bottom">Buddy Zone</a>' },

]

end

