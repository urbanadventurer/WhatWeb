##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TomatoCart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Shopping Cart"
website "http://www.tomatocart.com/"

# 216 results for "powered by TomatoCart" -Vulnerability @ 2010-09-18


matches [

# Meta generator
{ :text=>'<meta name="generator" content="TomatoCart Open Source Shopping Cart Solutions" />' },

# Powered by text
{ :text=>'Powered by <a href="http://www.tomatocart.com" target="_blank">TomatoCart</a>' },

# Default favicon
{ :md5=>"600924763aa7af6c968f53e0f6d9e608", :url=>"/templates/glass_gray/images/tomatocart.ico" },

]

end

