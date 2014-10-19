##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated version detection
##
Plugin.define "X7-Chat" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.2"
description "X7 Chat is a free script that can be modified and redistributed in any way that you want as long as the X7 Chat copyright logo remains in place."
website "http://x7chat.com/"

# Google results as at 2010-06-13 #
# 30 for inurl:x7chat "Please enter your username and password to login"

# Dorks #
dorks [
'inurl:x7chat "Please enter your username and password to login"'
]



# Matches #
matches [

# GHDB Match
{ :certainty=>75, :ghdb=>'inurl:x7chat "Please enter your username and password to login"' },

# Version Detection # Powered by text # new versions
{ :version=>/Powered By <a href="http:\/\/www.x7chat.com\/" target="_blank">X7 Chat<\/a> ([\d\.A-Z]+)[\s]*[^&]*&copy; 2004 By The <a href="http:\/\/www.x7chat.com\/" target="_blank">X7 Group<\/a>/ },

# Version Detection # Powered by text # old versions
{ :version=>/<Br><font size="2">Powered By X7 Chat Version ([^<]+)<\/font>/ },

]

end

