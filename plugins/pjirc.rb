##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PJIRC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-28
version "0.1"
description "PJIRC is the best free java irc client available. It can be run as an applet or stand alone and it is fully opensource."
website "http://www.pjirc.it/"

# Google results as at 2011-02-28 #
# 25 for "Chat Room" "Applet Style" "Nickname" ext:php

# Dorks #
dorks [
'"Chat Room" "Applet Style" "Nickname" ext:php'
]



# Matches #
matches [

# Default body tag
{ :text=>'<body onload="document.login.nick.focus();" style="margin: 5px;">' },

# Default JavaScript
{ :text=>'					document.writeln(\'<input name="jsenabled" type="hidden" value="1" \/>\');' },

# Default form tag
{ :regexp=>/				<form name="login" action="[^"]*index\.php" method="post" onsubmit="return CheckForm\('[^']*index\.php\?page=advanced'\)">/ },

# Version Detection # Login Page
{ :version=>/	<td align="left">PJIRC Login Page Version ([\d\.]{1,5})<\/td>/ },

]

end


