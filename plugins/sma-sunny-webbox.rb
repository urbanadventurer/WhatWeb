##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SMA-Sunny-WebBox" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-27
version "0.1"
description "Sunny WebBox is a high-performance communication hub for medium to large-scale solar power plants. It features system monitoring, remote diagnosis, data storage and visualization."
website "http://www.sma-america.com/en_US/products/monitoring-systems/sunny-webbox.html"

# Manual #
# http://files.sma.de/dl/2585/SWebBox-BEN111033.pdf

# The two user groups are distinguished by two different passwords. If the
# password is the same for both user groups, you will be logged in as the
# installer.

# As of firmware v1.46b the user is prompted to change the default password

# Default IP # 192.168.0.168

# Default Credentials #
# Installer:sma
# User:sma

# ShodanHQ results as at 2011-08-27 #
# 4,113 for Webbox
# 4,007 for Sunny WebBox
#    74 for WebBox-20



# Matches #
matches [

# Version Detection # /culture/index.dml
{ :url=>"/culture/index.dml", :account=>["User","Installer"], :version=>/<UserLevels><Items><XmlItem name="[^"^\s]*"><Items \/><Value>User<\/Value><\/XmlItem><XmlItem name="[^"^\s]*"><Items \/><Value>Installer<\/Value><\/XmlItem><\/Items><\/UserLevels><\/Element><\/Content><StatusBar deviceKey="[^"^\s]*" hideDataTransfer="[^"^\s]*" hidePasswordSafety="[^"^\s]*" hidePlantTime="[^"^\s]*" hideUserLevel="[^"^\s]*" hideUpdateState="[^"^\s]*" noRefresh="[^"^\s]*" serialNumber="[\d]*" version="([^"^\s]+)" \/><\/Page>/ },

# Frameset Page
{ :url=>"/", :regexp=>/<title>Sunny WebBox<\/title>[\s]+<\/head>[\s]+<frameset rows="75,\*,22" frameborder="no" border="2" framespacing="0">/ },

# Redirect Page
{ :url=>"/", :regexp=>/<meta http-equiv="refresh" content="0; URL=\/culture\/index\.dml">[\s]+<meta http-equiv="Content-Type" content="text\/html; charset=utf-8">[\s]+<title>SMA Sunny Webbox<\/title>[\s]+<link rel="SHORTCUT ICON" href="\.\.\/img\/favicon\.ico">/ },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^(WebBox-20|Sunny WebBox)$/ },

]

end

