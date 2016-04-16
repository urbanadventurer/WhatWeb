##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-21 #
# Updated version detection
##
Plugin.define "phpRaid" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-16
version "0.2"
description "phpRaid is a raid management tool for World of Warcraft - a MMORPG developed by Blizzard."
website "http://www.spiffyjr.com/"

# Google results as at 2010-06-16 #
# 32,800 for "Raid Management Provided by phpRaid"



# Matches #
matches [

# Provided by text
{ :certainty=>75, :text=>'Raid Management Provided by phpRaid' },

# Version Detection # provided by text
{ :version=>/Raid Management Provided by <a href="http:\/\/www.spiffyjr.com\/">phpRaid<\/a> v([\d\.]+)/ },

]

end

# an aggressive plugin could check for /docs/phpRaid_install_doc.pdf

