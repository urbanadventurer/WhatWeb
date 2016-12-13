##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches and version detection
##
Plugin.define "Burning-Board-Lite" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-26
version "0.2"
description "Burning Board 3 is the modern, secure and user friendly solution for your discussion board!"
website "http://www.woltlab.com/products/burning_board/index_en.php"

# 309 results for "Powered by Burning Board" -exploit -dork -johnny @ 2010-06-26

# Dorks #
dorks [
'"Powered by Burning Board" -exploit -dork -johnny'
]



matches [

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.woltlab.de[^>]*>Burning Board[\s]*<\/a>/ },

# Version Detection # 1.x # Powered by text
{ :version=>/Powered by <b><a href="http:\/\/www.woltlab.de" target="_blank">Burning Board ([^<]+)<\/a><\/b>/ },

# Version Detection # 2.x # Powered by text
{ :version=>/Powered by <b>Burning Board ([\d\.]+)<\/b>/ },

# Version Detection # 3.x # Copyright text
{ :version=>/<p class="copyright"><a href="http:\/\/www.woltlab.com">Forum Software: <strong>Burning Board&reg; ([\d\.]*)<\/strong>, developed by <strong>WoltLab&reg; GmbH<\/strong><\/a><\/p>/ },

]

end

