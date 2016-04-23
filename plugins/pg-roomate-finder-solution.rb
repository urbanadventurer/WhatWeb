##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PG-Roomate-Finder-Solution" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-21
version "0.1"
description 'PG Roommate Finder Solution - a web-based application built on PHP/MySQL for creating a roommate finder and roommate search service - a business that you can start with a minimum investment."
website "http://www.realtysoft.pro/roommate/'

# Google dorks as at 2010-06-21 #
# 16 for "Powered by PG Roomate Finder Solution - roommate estate web site design"

# Dorks #
dorks [
'"Powered by PG Roomate Finder Solution - roommate estate web site design"'
]



# Matches #
matches [

# GHDB
{:name=>'GHDB: "Powered by PG Roomate Finder Solution - roommate estate web site design"',
:certainty=>75,
:ghdb=>'"Powered by PG Roomate Finder Solution - roommate estate web site design"'
},

# powered by text
{ :text=>'<div align="center" style="padding-top: 20px; padding-bottom:20px;">Powered by <a href="http://www.realtysoft.pro/roommate/" title="real estate web site design, real estate listing software">PG Roomate Finder Solution - roommate estate web site design</a></div></td></tr>' }

]

end

