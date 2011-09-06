##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Elite-Gaming-Ladders" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-06
version "0.1"
description "Elite Gaming Ladders - Leagues, tournaments and online game battles script - Homepage: http://eliteladders.com/"

# Google results as at 2011-09-06 #
# 183 for "Powered by Elite Gaming Ladders"
# 147 for inurl:"ladders.php?platform="

# Dorks #
dorks [
'"Powered by Elite Gaming Ladders"',
'inurl:"ladders.php?platform="'
]

# Examples #
examples %w|
eliteladders.com/demoegla
eliteladders.com/demo/index.php
eliteladders.com/demov2
www.armaleague.com/apl_ladder/ladders.php?platform=13
league.hxclancenter.com/ladders.php?platform=2
clancompete.com/ladders.php?platform=1
gamearena.us/ladders.php?platform=
www.balkanesports.com/ladders.php?platform=
www.ps3leaderboard.com/ladders.php?platform=
brotherofwar.com/groundzero/ladders.php?platform=2
matches.clantacular.com/ladders.php?platform=2
www.fusionleague.com/ladders.php?platform=4
www.widowmakers.com/league/ladders.php?platform=
fragageddon.net/ladders.php?platform=3
rs8.com/ladders.php?platform=2
www.yodc.com/ladders.php?platform=8
www.armaleague.com/apl_ladder/ladders.php
ladderscript.com/ladders.php?platform=11
www.leikjamot.com/ladders.php?platform=2
rumblegt.com/ladders.php?platform=2
superiorpcs.net/ladders.php?platform=3
ps3cod.com/ladders.php?platform=2
nationalegl.com/ladders.php?platform=2
www.360battles.com/ladders.php?grid=30
p4fleague.com/profile.php?account=85
|

# Matches #
matches [

# GHDB # URL pattern + powered by text
{ :certainty=>75, :ghdb=>'inurl:"ladders.php?platform=" "Powered by Elite Gaming Ladders"' },

# @body == Could not connet to database, check your config file. For assistance, contact us at www.eliteladders.com.
{ :md5=>"ac60e7f75ff832cc7e0bab5eee67e008" },

# HTML Comments
{ :text=>"<!-- DO NOT EDIT ABOVE THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOIN - END -->" },
{ :text=>"<!-- Do Not Edit Below This Line Unless You Know What You're Doing -->" },
{ :text=>"<!-- EGL INFORMATION - BLOCK END -->" },
{ :text=>"<!-- DESIGNER AND POWERED BY - START  - You must leave this Copyright link back to Elite Ladders in place othersise your license will be revoked -->" },
{ :text=>"<!-- Copyright - Removing this link back to Elite Ladders without permission will result in suspension of your license  -->" },

# Powered by link
{ :regexp=>/<b><span style="color:#013171;">Design By: <\/span> Soulast<span style="color:#013171;"> \| Powered [bB]y: <\/span>[\s]?<a href="http:\/\/(www\.)?eliteladders\.com"/ },

# Version Detection # Powered by footer
{ :version=>/Powered by: <a href='http:\/\/(www\.)?eliteladders\.com'>Elite Gaming Ladders (\s|&nbsp;)?v([^<]+)<\/a>/, :offset=>2 },
{ :version=>/Powered [bB]y:? <a href='http:\/\/(www\.)?eliteladders\.com'>[\s]+<span style=["']color:#[^;]{6};["']>Elite Gaming Ladders v([^<]+)<\/span><\/a>/, :offset=>1 },

]

end

