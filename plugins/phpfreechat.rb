##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated GHDB match and version detection
##
Plugin.define "phpFreeChat" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.2"
description "phpFreeChat is a free, simple to install, fast, customizable and multi languages chat that uses a simple filesystem for message and nickname storage."
website "http://www.phpfreechat.net/"

# About 434,000 results for "powered by phpfreechat" @ 2010-06-12

# Dorks #
dorks [
'"powered by phpfreechat"'
]



matches [

# GHDB Match
{ :ghdb=>'"powered by phpfreechat"', :certainty=>75 },

# Version detection # Default logo HTML
{ :version=>/<img src="http:\/\/www.phpfreechat.net\/pub\/logo[2]*_80x15.gif" alt="PHP FREE CHAT \[powered by phpFreeChat-([\d\.\-a-z]*)\]"/ },

]

end

# An aggressive plugin could check for the existance of a /demo folder.
# The demos still exist on many phpFreeChat isntallations, for example:
#  www.radioambientalfm.com/chat/demo/
#  www.tvacapulco.com/chat/phpfreechat/demo/
#  files.ttr.net.au/demo/
#  www.sahl-tec.com/demo/
# This plugin will also detect these demos as instances of phpFreeChat

