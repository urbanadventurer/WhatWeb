##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "VP-ASP"
authors [
  "Andrew Horton",
  # v0.2 # removed :certainty=>100 & :name, converted :regexp to :text
  # v0.3 # Uses :version=>//
  # v0.5 # 2019-07-10 # Added website field.
]
version "0.5"

description "VP-ASP (Virtual Programming - ASP) Shopping Cart. Free & commercial versions. http://johnny.ihackstuff.com/ghdb/?function=detail&id=324"
website "www.vpasp.com"

matches [
{:certainty=>75, :ghdb=>'filetype:asp inurl:"shopdisplayproducts.asp"'},
{:certainty=>75, :text=>'src="vs350.js"'},
{:text=>'<a href="http://www.vpasp.com">Shopping Cart</a> powered by VP-ASP</p>'},
{:text=>'<a href="http://www.vpasp.com">Powered By VP-ASP Shopping Cart</a>'},
{:certainty=>75, :text=>'shopdisplayproducts.asp?id='},
{:version=>/<title>VP-ASP Shopping Cart ([^ <]*)/,  :name=>"powered by title" }
]

end

