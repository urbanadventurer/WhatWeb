##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Bitcoin-Address" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-18
version "0.1"
description "A Bitcoin address, or simply address, is an identifier of approximately 34 alphanumeric characters, beginning with the number 1 or 3, that represents a possible destination for a Bitcoin payment. - More Info: https://en.bitcoin.it/wiki/Address"

# Google results as at 2012-01-18 #
# 76 for "bitcoin"|"BTC" "my wallet address is"|"my bitcoin address is"|"my BTC address is"
# 64 for "my bitcoin address is"

# Dorks #
dorks [
'"bitcoin"|"BTC" "my wallet address is"|"my bitcoin address is"|"my BTC address is"',
'"my bitcoin address is"'
]

# Examples #
examples %w|
larrythecow.org/universe/archives/2010-12-13.html
greenunt.blogspot.com/2009/12/wireless-woman.html
sluggish.homelinux.net/wiki/Bitcoin
georgedonnelly.com/about/
harryrose.org/bitcoin/
matija.suklje.name/?q=node/209
curry.com
https://blockexplorer.com/
|

# Matches #
matches [

# Most Bitcoin addresses are 34 characters. They consist of random digits and uppercase and lowercase letters, with the exception of:
  # uppercase letter "O",
  # uppercase letter "I",
  # lowercase letter "l",
  # and the number "0"
# to prevent visual ambiguity.
# Some Bitcoin addresses can be shorter than 34 characters - these are completely valid. A significant percentage of Bitcoin addresses are only 33 characters, and some older addresses may be even shorter.

{ :string=>/([123][1-9A-HJ-NP-Za-km-z]{30,36})/ },

]

end

