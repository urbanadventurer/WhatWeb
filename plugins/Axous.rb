##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Axous" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-20
version "0.1"
description "Axous is an e-shop system for software venders. - Homepage: http://www.axous.com/"

# Google results as at 2012-05-20 #
# 105 for "Powered by Axous" "Valid CSS"

# Dorks #
dorks [
'"Powered by Axous" "Valid CSS"'
]

# Examples #
examples %w|
www.axous.com
www.janusec.com/product/
www.monitortoolbox.com
www.fat32-formatter.com/cart.php
www.westwindsoft.net/page/about.html
www.zj-fountain.com
www.ezprog.com/cart.php
font-manager-mac-software.8bitsoft.com
www.axous.com/page/contact.html
www.magic-partition.com/page/about.html
us.cnsw.us
www.linren.com
www.cylogos.com/axous/
|

# Matches #
matches [

# Meta Generator # The version is a lie
{ :regexp=>/<meta name="generator" content="Axous V([^"]+)" \/>/ },

# Footer # Powered by link # Version Detection
{ :version=>/Powered by <a href="http:\/\/www\.axous\.com\/" target="_blank" title="Axous Shareware Shop">Axous ([^\s]+)<\/a> &copy;/ },

# tits? In my HTML? It's more likely than you think.
{ :text=>'<div class="tit2 tit3">Products</div>' },

]

end

