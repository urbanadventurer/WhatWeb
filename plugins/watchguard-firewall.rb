##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-18 # Brendan Coles <bcoles@gmail.com>
# Updated regex
# Added HTTP Server Header match
# Added string extraction from www-authenticate realm
##
Plugin.define "WatchGuard-Firewall" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.2"
description "WatchGuard Firewall - http://www.watchguard.com/products/edge-e/overview.asp"

# ShodanHQ results as at 2011-03-18 #
# 4,976 for WatchGuard Firewall

# Examples #
examples %w|
http://70.91.220.169/
http://208.180.252.118/
http://76.205.188.242/
http://173.14.242.29/
http://203.232.90.253/
http://67.167.120.91/
http://64.232.118.26/
http://74.222.222.160/
http://78.70.110.42/
http://24.227.203.135/
http://119.192.80.242/
http://119.196.217.76/
http://121.133.227.94/
http://121.143.123.57/
http://121.159.164.45/
http://173.162.75.189/
http://173.165.228.17/
http://173.25.141.99/
http://193.253.214.176/
http://206.255.36.198/
http://207.109.253.97/
http://211.192.91.27/
http://216.163.77.138/
http://216.223.141.17/
http://216.223.154.193/
http://216.223.158.241/
http://217.128.168.37/
http://217.211.53.241/
http://218.92.204.230/
http://59.1.182.146/
http://59.7.204.180/
http://65.198.212.27/
http://65.40.170.38/
http://67.76.207.78/
http://67.76.232.167/
http://68.15.235.200/
http://68.213.102.82/
http://70.147.42.201/
http://70.239.32.125/
http://70.88.50.181/
http://71.33.228.49/
http://75.144.48.193/
http://75.145.208.13/
http://77.43.67.10/
http://79.38.10.65/
http://80.25.138.106/
http://80.34.60.117/
http://80.38.129.24/
http://83.232.73.162/
http://85.233.189.91/
http://91.48.1.198/
http://91.84.26.245/
http://95.152.77.48/
http://99.239.2.191/
http://99.38.136.54/
|


# Passive #
def passive
	m = []

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^WatchGuard Firewall$/

	# WWW-Authenticate
	m << { :name=>"WWW-Authenticate Header" } if @meta["www-authenticate"] =~ /^(Basic|Digest) realm="WatchGuard (SOHO|Firebox)/i

	# SOHO
	m << { :string=>@meta["www-authenticate"].scan(/^Digest realm="WatchGuard (SOHO [^"]+) Configuration"/) } if @meta["www-authenticate"] =~ /Digest realm="WatchGuard (SOHO [^"]+) Configuration"/

	# Firebox
	m << { :string=>"Firebox" } if @meta["www-authenticate"] =~ /^Digest realm="WatchGuard Firebox Local User"/

	# Return passive matches       
	m
end

end


