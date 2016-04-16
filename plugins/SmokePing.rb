##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmokePing" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-05
version "0.1"
description "SmokePing keeps track of your network latency"
website "http://oss.oetiker.ch/smokeping/index.en.html"

# Google results as at 2012-03-05 #
# 365 for "Probing Targets" inurl:"show.cgi?target="

# Dorks #
dorks [
'"Probing Targets" inurl:"show.cgi?target="'
]



# Matches #
matches [

# td class="menuitem" link
{ :text=>'<tr><td class="menuitem" colspan="2">&nbsp;-&nbsp;<a class="menulink" HREF="?target=' },

# Homepage Link # Version Detection
{ :version=>/<A HREF="http:\/\/oss\.oetiker\.ch\/smokeping\/counter\.cgi\/([^\s^\/^\"]+)"><img border="0" src="[^"]+"><\/a>/ },

]

end

