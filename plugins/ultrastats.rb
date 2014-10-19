##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-16 #
# Updated version detection
##
Plugin.define "Ultrastats" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.2"
description "UltraStats is a php based gamelog parser for the famous Call of Duty franchise supporting Call of Duty, Call of Duty: United Office, Call of Duty2, Call of Duty 4: Modern Warfare and Call of Duty: World at War. In order to fully support UltraStats, you need a Apache or IIS Webserver with PHP5 ( PHP4 should still work ) installed. You also need a MySQL Database to store the data into."
website "http://www.ultrastats.org/"

# Google results as at 2010-08-22 #
# 50  for "powered by Ultrastats" intitle:Ultrastats
# 383 for intitle:"Ultrastats :: Home"

# Dorks #
dorks [
'intitle:"Ultrastats :: Home"'
]



# Matches #
matches [

# Powered by text
{ :text=>'<DIV align=center>Powered by Ultrastats' },

# Default logo HTML
{ :text=>'<img src="./images/main/ultrastatslogo.png" width="300" height="200" name="ultrastats_logo" align="center">' },

# Default title
{ :regexp=>/<title>Ultrastats :: [^<]+<\/title>/i },

# Error page
{ :text=>'<title>UltraStats :: Critical Error occured</title>' },

# Version Detection
{ :version=>/ &nbsp;<a href="http:\/\/www.ultrastats.org[\/]?" target="_blank">Ultrastats<\/a> Version ([\d\.]+)/i },

]

end

