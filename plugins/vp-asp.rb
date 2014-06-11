##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name, converted :regexp to :text
# Version 0.3
# Uses :version=>//

Plugin.define "VP-ASP" do
author "Andrew Horton"
version "0.3"

description "VP-ASP (Virtual Programming - ASP) Shopping Cart. Free & commercial versions. http://johnny.ihackstuff.com/ghdb/?function=detail&id=324  Homepage:www.vpasp.com"



matches [
{:certainty=>75, :ghdb=>'filetype:asp inurl:"shopdisplayproducts.asp"'},
{:certainty=>75, :text=>'src="vs350.js"'},
{:text=>'<a href="http://www.vpasp.com">Shopping Cart</a> powered by VP-ASP</p>'},
{:text=>'<a href="http://www.vpasp.com">Powered By VP-ASP Shopping Cart</a>'},
{:certainty=>75, :text=>'shopdisplayproducts.asp?id='},
{:version=>/<title>VP-ASP Shopping Cart ([^ <]*)/,  :name=>"powered by title" }
]

# <title>VP-ASP Shopping Cart 6.00</title>
# <title>VP-ASP Shopping Cart 4.50a</title>
# <title>VP-ASP Shopping Cart 6.50</title>
# <a href="http://www.vpasp.com">Powered By VP-ASP Shopping Cart</a>


end

