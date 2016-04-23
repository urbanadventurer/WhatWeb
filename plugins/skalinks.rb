##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SkaLinks" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "SkaLinks - Free Links Exchange software"
website "http://www.skalinks.com/"

# 305 results for "powered by SkaLinks" "Link Exchange Script" @ 2010-08-14


matches [

{ :text=>'Powered by <a class=sub_cat href="http://www.skalinks.com">SkaLinks - Link Exchange Script' },

{ :text=>'Powered by <a class=sub_cat href="http://www.skalinks.com" rel="nofollow">SkaLinks - Link Exchange Script' },

{ :text=>'Powered by <a class=sub_cat rel="nofollow" href="http://www.skalinks.com">SkaLinks - Link Exchange Script' },

]

end

