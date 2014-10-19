##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tab-and-Link-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-23
version "0.1"
description "The Tab And Link Manager engine is a total replacement for the default vBulletin NavBar"
website "http://www.wolfshead-solutions.com/ws-products/product-1"

# Google results as at 2012-03-23 #
# 98 for "Powered by Tab and Link Manager Version"

# Dorks #
dorks [
'"Powered by Tab and Link Manager Version"'
]



# Matches #
matches [

# Powered by link # Version Detection
{ :version=>/<div id="footer_copyright" class="shade footer_copyright">Powered by <a href="http:\/\/www\.wolfshead-solutions\.com\/ws-products\/product-1" rel="wsBlank">Tab and Link Manager<\/a> Version ([^<^\s]+)<br \/>Copyright &copy; 20[\d]{2} Wolfshead Solutions\. All rights reserved\.<br \/>/ },

]

end

