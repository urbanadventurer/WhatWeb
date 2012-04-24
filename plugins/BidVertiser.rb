##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BidVertiser" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-24
version "0.1"
description "Pay per click advertising - Homepage: http://www.bidvertiser.com/"

# Examples #
examples %w|
|

# Matches #
matches [

# HTML Comments
{ :text=>'<!-- Begin BidVertiser code -->' },
{ :text=>'<!-- End BidVertiser code -->' },

# NoScript
{ :text=>'<noscript><a href="http://www.bidvertiser.com/bdv/BidVertiser/bdv_publisher.dbm">make money online</a></noscript>' },

]

end

