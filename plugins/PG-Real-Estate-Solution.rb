##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PG-Real-Estate-Solution" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.1"
description "Turnkey Multilingual Real Estate Website script for Real Estate professionals."
website "http://www.realtysoft.pro/realestate/index.php"

# 134 results for "powered by PG Real Estate Solution" @ 2010-09-03

# Dorks #
dorks [
'"powered by PG Real Estate Solution"'
]



# Matches #
matches [

# Default title
{ :text=>'	<title>PG Real Estate Solution', :certainty=>75 },

# Powered by text
{ :text=>"Powered by <a href='http://www.realtysoft.pro/realestate/' title='real estate web site design, real estate listing software'>PG Real Estate Solution - real estate web site design</a>" },

{ :text=>'Powered by <a href="http://www.realtysoft.pro/realestate/" title="real estate web site design, real estate listing software">PG Real Estate Solution - real estate web site design</a>' },

]

end

