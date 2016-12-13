##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nera-SatLink" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-14
version "0.1"
description "Nera SatLink router [Norwegian] - The Nera SatLink family of DVB-RCS Terminals act as IP routers to interface one or more PCs for bilateral communication via the satellite network."
website "http://www.neraworld.com/"

# Default Credentials #
# install:dvbrcs
# install:satlink

# Manual: ftp://193.213.87.161/Manuals/Nera%20Satlink/Nera%20SatLink%20Terminal%20User%20Guide%20Rev%20Q.pdf

# The Web interface supports the most common configuration tasks and displays the status of the SatLink terminal. Advanced configuration like configuring GRE tunnels, downloading software updates manually, configuring for automatic software updates, configuring system information, adding users and changing password, configuring SNMP access, and adding manual IP routes, are only available from the CLI via Telnet or the RS-232 port.

# The web interface requires a frame capable browser with JavaScript enabled.
# The following method is used to log out:
# <li><a href='#' onclick="top.close();" >Logout</a> </li>

# ShodanHQ results as at 2011-08-14 #
# 1,046 for SatLink Terminal



# Matches #
matches [

# WWW-Authenticate
{ :search=>"headers[www-authenticate]", :regexp=>/^Basic realm="SatLink Terminal"$/ },

# Requires authorization #
#{ :url=>"/wmi/dwp/home_status_satellite.dwp", :text=>'<FORM ID ="statussatellite" name = "statussatellite" method = "GET" action = "">' },

]

end

