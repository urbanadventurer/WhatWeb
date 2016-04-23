##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RedShop" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "ASP Powered shopping cart software [Chinese]"
website "http://www.rednetcms.com/redshop/"

# 1 result for "Powered by Redshop" @ 2010-10-12


matches [

# Powered by text
{ :text=>'Powered by:<a href="http://www.rednetcms.com/redshop" target="_blank">Redshop</a>' },

# Default CSS # CSS file in the images folder o_0
{ :text=>'<link href="images/redcms.css" rel="stylesheet" type="text/css" />' },

]

end

