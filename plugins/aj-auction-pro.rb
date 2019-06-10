##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "AJ-Auction-Pro"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-02-28
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
]
version "0.2"
description "AJ Auction is a PHP-based Auction portal software which is a simple to use auction portal script with an effective administrative interface. You can control every aspect of your website through this all-inclusive user friendly Admin Panel with minimal server requirements."
website "http://www.ajauctionpro.com/"

# Google results as at 2011-02-28 #
# 25 for "Powered By AJ Auction Pro" -dork

# Dorks #
dorks [
'"Powered By AJ Auction Pro" -dork'
]



# Matches #
matches [

# GHDB Match
{ :certainty=>25, :ghdb=>'"Powered By AJ Auction Pro"' },

# Version Detection # Powered by text
{ :version=>/<td width="16%" class="site_statistics" align="left"><a class="site_statistics" href="http:\/\/www.ajauctionpro.com">Powered By AJ Auction Pro OOPD V([\d\.]{1,5})<\/a><\/td>/ },

]

end


