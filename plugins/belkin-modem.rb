##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name and :certainty=>100

Plugin.define "Belkin-Modem" do
author "Andrew Horton"
version "0.2"
description "Homepage: http://www.belkin.com/"


# http://122.58.46.235 Generic-Server = 'micro_httpd'
# http://121.73.151.115/ server-header = 'IP_SHARER WEB 1.0'
# <meta name="description" content="Belkin 2307">
# 2nd one is a belkin wireless router

matches [
{:name=>"html comments", :regexp=>/\/\/ when proto = Bridge or ipExt = 1, DHCP should show disabled/ },
{:text=>"href=\"main_router.css\" src=\"showMenu.js\"" },
{:regexp=>/<meta name="description" content="Belkin [\S]+/}, #"
{:version=>"2307 wireless router", :text=>"<meta name=\"description\" content=\"Belkin 2307"},
{:version=>"F5D7230-4P", :text=>"<td bgcolor=\"#94CAE4\" width=\"50%\" height=\"18\">F5D7230-4P</td>"},
{:name=>"inline javascript", :text=>"var isPPPoE, isStatic, isDynamic, isnat, isdialup, isbigpond, ispptp, isfirewall;"}
]


end

