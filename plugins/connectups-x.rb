##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ConnectUPS-X" do
author "Andrew Horton"
version "0.1"
description "The ConnectUPS-X Web/SNMP device allows you to connect various types of UPS directly to the Ethernet network and the Internet. It provides telnet, SSH, SNMP and a web interface"
website "http://powerquality.eaton.com/Products-services/Power-Management/Connectivity/connectups.asp"

# Default Password is 'admin'

# ShodanHQ results as at 2012-03-02 #
# 1,162 for UPS_Server/1.0

# Google results as at 2012-03-02 #
# 2 for intitle:"ConnectUPS" inurl:"PSummary.html"

# Dorks #
dorks [
'intitle:"ConnectUPS" inurl:"PSummary.html"'
]



# Matches #
matches [

# HTTP Server Header
{:text=>"UPS_Server/1.0",:search=>"headers[server]" },

# Title
{ :regexp=>/<TITLE>ConnectUPS (Web\/SNMP Card|SNMP\/WEB Adapter)<\/TITLE>/ },

# /PSummary.html # Model
{:url=>"/PSummary.html", :name=>"UPS Model", :model=>/<b>UPS Model<\/b><\/td>\s+<td><table><tr><td><b>([^<]+)/},

# /PSummary.html # Firmware Version Detection
{:url=>"/PSummary.html", :name=>"UPS Firmware version", :firmware=>/<b>UPS Firmware version<\/b><\/td>\s+<td><table><tr><td><b>([^<]+)/},
{:url=>"/PSummary.html", :name=>"Firmware Revision", :firmware=>/<b>Firmware Revision<\/b><\/td>\s+<td><table><tr><td><b>\s+([^<]+)/}

]

end

