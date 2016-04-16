##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RoSpora" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Spora The Burning Crusade Edition Means RoSpora - web script build for MaNGOS Free MMORPG Server. Revolution of Simple Page Of Registration of Accounts"
website "http://code.google.com/p/rospora/"

# Google results as at 2011-02-24 #
# 5 for "This server supports only 2.2.3 clients" "1x Quest XP , 1x Kill XP , 1x Discovery XP"
# 1 for "LET'S INSTALL YOUR ROSPORA!" ext:txt



# Matches #
matches [

# Default Shortcut Icon HTML
{ :text=>'<link rel="Shortcut Icon" href="img/wowlogoanim.gif" type="image/gif">' },

# Configuration # Configuration.php
{ :text=>"<li>This server supports only 2.2.3 clients<br><li>1x Quest XP , 1x Kill XP , 1x Discovery XP" },

]

end


