##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Toner-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "Toner cart has all features needed for a toner business to go online. You can separate all the differentiate different types of toners from ribbons to inkjets to laser toners all can be added separately in the system."
website "http://www.vastal.com/toner-cart-a-specialized-script-to-help-you-sell-toners-online.html"

# No results for "Powered By Toner Cart" @ 2010-09-04


matches [

# Powered by text
{ :text=>'<p align="right"><font color="#FFFFFF">Powered by <a href="http://www.vastal.com/" target="_blank"><font color="#FFFFFF">Vastal I-Tech' },

]

end

