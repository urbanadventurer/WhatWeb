##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "System-Shop" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "shopping cart"
website "http://system-shop.at/"

# 62 results for "powered by System Shop" @ 2010-09-18


matches [

# HTML comments
{ :text=>'      powered by System4you.com internet solutions' },
{ :text=>'                powered by System-Shop' },
{ :text=>'               http://www.system-shop.at' },

# Powered by text # truncated because some versions have newlines
{ :text=>'<a href="http://www.systemshop.at" target="_blank">Powered by System' },

]

end

