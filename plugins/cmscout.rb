##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CMScout" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.1"
description "CMScout is a free and open-source CMS (Content management system) for Scouting related groups from around the world. A CMS is a piece of web software that makes it easy for you to install, and manage a website without needing to know any programming languages."
website "http://www.cmscout.co.za/"

# Google results as at 2010-08-22 #
# 93 for "powered by CMScout"

# Dorks #
dorks [
'"powered by CMScout"'
]



matches [

# Powered by text
{ :regexp=>/Powered by CMScout &copy;[\d\,]+ <a href="http:\/\/www.cmscout.za.net" title="CMScout Group" target="_blank">CMScout Group<\/a>/ },
{ :text=>'<!--Shows the CMScout and website copyright information. Please do not remove this without permission from the CMScout admin-->' },

]

end

