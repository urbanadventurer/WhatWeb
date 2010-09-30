##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PG-Roomate-Finder-Solution" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-21
version "0.1"
description 'PG Roommate Finder Solution - a web-based application built on PHP/MySQL for creating a roommate finder and roommate search service - a business that you can start with a minimum investment. - homepage: http://www.realtysoft.pro/roommate/'
examples %w|
demo.realtysoft.pro/roommate/index.php
www.mydesres.com
www.roommatesusa.com
www.roomieworld.com
demo.realtysoft.pro/roommate/
www.roommateplanet.com
www.roomrentalworld.com
www.roomfindster.com
www.roommateusa.com
www.roomieworld.com
roommateusa.com
www.roomrentalworld.com
|

matches [

# 16 results @ 2010-06-21
{:name=>'GHDB: "Powered by PG Roomate Finder Solution - roommate estate web site design"',
:certainty=>75,
:ghdb=>'"Powered by PG Roomate Finder Solution - roommate estate web site design"'
},

{:name=>'powered by text',
:certainty=>100,
:text=>'<div align="center" style="padding-top: 20px; padding-bottom:20px;">Powered by <a href="http://www.realtysoft.pro/roommate/" title="real estate web site design, real estate listing software">PG Roomate Finder Solution - roommate estate web site design</a></div></td></tr>'
}

]


end

