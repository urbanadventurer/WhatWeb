##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "cpCommerce" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "Web shopping cart"
website "http://cpcommerce.org/"

# 58 results for "powered by cpCommerce" @ 2010-08-14


matches [

{ :text=>'        Powered by cpCommerce' },
{ :text=>'    <title>cpCommerce by Matthew Wilkin</title>' },
{ :text=>'Powered by <a href="http://cpcommerce.cpradio.org/" target="_blank">cpCommerce</a>.' },
{ :text=>'Powered by <a href="http://cpcommerce.org/" target="_blank">cpCommerce</a>.' },

]

end

