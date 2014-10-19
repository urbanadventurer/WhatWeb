##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ICEshop" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-26
version "0.1"
description "ICEshop e-commerce"
website "http://www.iceshop.nl/"

# Google results as at 2012-02-16 #
# 66 for "Powered by ICEshop"

# Dorks #
dorks [
'"Powered by ICEshop"'
]



# Matches #
matches [

# Powered by text
{ :text=>'<p id="power_by"><a href="http://www.iceshop.nl" target="_blank">Powered by ICEshop</a></p>' },

# Powered by text
{ :text=>'Powered by <a class="link copyright02" href="http://www.iceshop.nl/" target="_blank">ICEshop</a>' },

# dl class
{ :text=>'<dl class="box boxLogo  box02 iceshop">' },

]

end

