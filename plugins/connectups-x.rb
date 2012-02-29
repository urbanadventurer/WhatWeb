##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "ConnectUPS-X" do
author "Andrew Horton"
version "0.1"
description "The ConnectUPS-X Web/SNMP device allows you to connect various types of UPS directly to the Ethernet network and the Internet. It provides telnet, SSH, SNMP and a web interface. Homepage: http://powerquality.eaton.com/Products-services/Power-Management/Connectivity/connectups.asp"

# Default Password is 'admin'

examples %w| 85.196.1.62 201.148.53.41|

matches [

{:text=>"UPS_Server/1.0",:search=>"headers[server]" },
{:text=>"<TITLE>ConnectUPS Web/SNMP Card</TITLE>"},
{:text=>"<TITLE>ConnectUPS SNMP/WEB Adapter</TITLE>"},

{:url=>"/PSummary.html", :name=>"UPS Model", :model=>/<b>UPS Model<\/b><\/td>\s+<td><table><tr><td><b>([^<]+)/},
{:url=>"/PSummary.html", :name=>"UPS Firmware version", :firmware=>/<b>UPS Firmware version<\/b><\/td>\s+<td><table><tr><td><b>([^<]+)/},
{:url=>"/PSummary.html", :name=>"Firmware Revision", :firmware=>/<b>Firmware Revision<\/b><\/td>\s+<td><table><tr><td><b>\s+([^<]+)/}

]


end

