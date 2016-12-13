##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AppServ" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-23
version "0.1"
description "AppServ is an Apache, MySQL, PHP, phpMyAdmin installer package for Windows and Linux."
website "http://www.appservnetwork.com/"

# Google results as at 2011-09-23 #
# 55 for intitle:"AppServ Open Project" "About AppServ Version"

# Dorks #
dorks [
'intitle:"AppServ Open Project" "About AppServ Version"'
]



# Matches #
matches [

{ :version=>/<span class="headd"><strong><big>&nbsp; The AppServ Open Project - ([^\s]+) for (Windows|Linux) <\/big><\/strong><\/span><\/font><\/td>/ },

{ :text=>'<font color="#000080" class="headd">&nbsp;&nbsp;&nbsp;<img src="appserv/softicon.gif"' },

]

end

