##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebAsyst-Shop-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-29
version "0.1"
description "Shop-Script . ecommerce platform for creating online stores. Available as PHP software and hosted service."
website "http://www.shop-script.com/"

# 282 results for "powered by WebAsyst Shop-Script" @ 2010-08-29


matches [

# Powered by text
{ :text=>'Powered by WebAsyst Shop-Script <a href="http://www.shop-script.com/" style="font-weight: normal">shopping cart software</a>' },
{ :text=>'Powered by <a href="http://www.shop-script.com" style="font-weight: bold;" target="_blank">WebAsyst Shop-Script</a> - <a href="http://www.shop-script.com/" style="font-weight: normal;" target="_blank">shopping cart software</a>' },

# Default JavaScript
{ :regexp=>/[\s]+var WAROOT_URL = '[^\']+';\/\/ok/ },

# Default logo
{ :md5=>'34a3750e95f81f5bb7b552393b3b37b6', :url=>'published/common/html/res/images/logo.gif' },
{ :md5=>'d7139ea1c479be1993d01e22e2c36a12', :url=>'images/logos/wa_logo136_white.gif' },

]

end

