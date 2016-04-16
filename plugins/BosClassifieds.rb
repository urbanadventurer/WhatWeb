##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-08 #
# Updated version detection method
##
Plugin.define "BosClassifieds" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.2"
description "The BosClassifieds Classified Ad System will allow your web site visitors to place their own classified ads to your web site into categories which you specify. All BosDev, Inc products require a web server running PHP version 4.10 or higher, MySQL 3.23 or higher, and the GD2 graphics library."
website "http://www.bosdev.com/bosclassifieds/"

# Google results as at 2010-08-22 #
# 47 for "powered by BosClassifieds Classified Ads System"

# Dorks #
dorks [
'"powered by BosClassifieds Classified Ads System"'
]



# Matches #
matches [

	# Powered by text
	{ :text=>'Powered by <a href="http://www.bosdev.com/" target="_blank">BosClassifieds</a> <a href="http://www.bosdev.com/" target="_blank">Classified Ads</a> System<br>Copyright' },

	# Version Detection # Meta generator
	{ :version=>/  <meta name="generator" content="BosClassifieds ([\d\.]+) by BosDev">/ },

]

end

