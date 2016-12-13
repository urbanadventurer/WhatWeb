##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "bitcoin-js-remote" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-17
version "0.1"
description "A JavaScript Remote for Bitcoin - bitcoin-js-remote is a user interface for Bitcoin written in JavaScript and released under the MIT/X11 License. It works in most modern browsers as well as on Android and iPhones."
website "http://tcatm.github.com/bitcoin-js-remote/"

# 2 for "bitcoin-js-remote by tcatm" "This information is not transmitted, it'll only be stored in your wallet."

# Dorks #
dorks [
'"bitcoin-js-remote by tcatm" "This information is not transmitted, it\'ll only be stored in your wallet."'
]



# Matches #
matches [

# Malformed HTML
{ :certainty=>75, :text=>'<span id="balance"</span>' },

# homepage link
{ :text=>'<p><a href="http://tcatm.github.com/bitcoin-js-remote">bitcoin-js-remote</a> <span id="version"></span> by <a href="mailto:tcatm@gawab.com">tcatm</a></p>' },

]

end

