##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NexusPHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-01
version "0.1"
description "BitTorrent private tracker scripts written in PHP"
website "http://sourceforge.net/projects/nexusphp/"

# Google results as at 2011-07-01 #
# 353 for "Powered by NexusPHP"
#  31 for "Powered by NexusPHP" inurl:aboutnexus.php

# Dorks #
dorks [
'"Powered by NexusPHP"',
'"Powered by NexusPHP" inurl:aboutnexus.php'
]



# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta name="generator" content="NexusPHP"[\s]?\/>/ },

# Cookies required message # English
{ :text=>'<p><b>Note</b>: You need cookies enabled to log in or switch language.<br /> [<b>' },

# HTTPS mode input box # Multiple languages
{ :text=>'<tr><td class="rowhead">SSL (HTTPS):</td><td class="rowfollow" align="left"><input class="checkbox" type="checkbox" name="ssl" value="yes"' },

# Year Detection # Powered by footer
{ :string=>/<\/a> (20[\d]{2})-20[\d]{2} Powered by <a href="aboutnexus\.php">NexusPHP<\/a>/ },

]

end

