##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ShopEx" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "eCommerce [Chinese]"
website "http://www.shopex.cn/"

# Dorks #
dorks [
'"Powered by ShopEX"'
]



# Matches #
matches [

# Powered by title
{ :certainty=>75, :regexp=>/<title>[^<]* -- Powered by Shop(e|E)x<\/title>/ },

# Powered by link
{ :text=>"<p align=center><font color=black style='font-size:9pt;font-family:Arial'>Powered by </font><a href='http://www.shopex.cn' target='_blank'><font color=navy style='font-size:9pt;font-family:Arial;text-decoration:under-line'>Shop<font><font color=orange style='font-size:9pt;font-family:Arial;text-decoration:under-line'>Ex<font></a>" },

# CSS
{ :regexp=>/<link href="syssite\/home\/shop\/[\d]+\/images\/[\d]+\/css\.css" rel="stylesheet" type="text\/css">/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="ShopEx ([\d\.]+)" \/>/ },

]

end


