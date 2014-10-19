##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FatWire-Content-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-14
version "0.1"
description "FatWire Content Server - previously known as Future Tense Content Server CMS"
website "http://www.fatwire.com/"

# ShodanHQ results as at 2011-09-14 #
# 38 for host_service FutureTenseContentServer

# Google results as at 2011-09-14 #
# 169 for (inurl:"servlet/Satellite?pagename="|inurl:"servlet/ContentServer?pagename=")
# 157 for inurl:"servlet/Satellite?pagename="
# 115 for inurl:"servlet/ContentServer?pagename="
#  36 for allinurl:ContentServer pagename "inifile=futuretense.ini"
#  35 for "An error occurred during processing. Check the info log." (inurl:"servlet/ContentServer"|inurl:"servlet/Satellite"

# Dorks #
dorks [
'inurl:"servlet/Satellite?pagename="',
'inurl:"servlet/ContentServer?pagename="'
]



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[host_service]", :version=>/^FutureTenseContentServer:([^\s]+)$/ },

# Error Page
{ :text=>'<!-- this tag to be replaced with autogen stuff -->' },
{ :text=>'<h1>FatWire Corporation<br />&nbsp;Content Server</h1>' },
{ :text=>'<b>Open Market, Inc.<br>&nbsp;ContentServer</b><hr>' },
{:certainty=>75, :text=>'An error occurred during processing. Check the info log.<br' },

]

end

