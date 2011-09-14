##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FatWire-Content-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-14
version "0.1"
description "FatWire Content Server - previously known as Future Tense Content Server CMS - Homepage: http://www.fatwire.com/"

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

# Examples #
examples %w|
89.107.242.80
69.20.90.74
69.20.90.84
50.16.242.223
155.199.166.196
210.160.254.24
91.116.143.117
83.231.223.111
155.199.18.196
owner.ford.com/servlet/ContentServer
press.centerparcs.com/servlet/ContentServer
https://www.santander.no/servlet/ContentServer
www.firsttrustbank.co.uk/servlet/ContentServer
www.amtrak.com/servlet/ContentServer
solna-stockholm.rezidorparkinn.com/servlet/ContentServer
www.ksta.de/servlet/ContentServer
euwahl.fsg.or.at/servlet/ContentServer
www.proge.at/servlet/ContentServer
https://www.rspca.co.uk/servlet/ContentServer
www.arbeit-wirtschaft.at/servlet/ContentServer
https://www.santander.no/servlet/ContentServer
press.centerparcs.com/servlet/ContentServer
|

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

