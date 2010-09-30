##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cisco-VPN-3000-Concentrator" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "Cisco VPN 3000 Series Concentrators provide your business with unprecedented cost savings through flexible, reliable, and high-performance remote-access solutions. - homepage: http://www.cisco.com/en/US/products/hw/vpndevc/ps2284/index.html"

# 15 results for "intitle:Cisco Systems, Inc. VPN 3000 Concentrator" @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=791
# Default login: admin/admin
examples %w|
218.1.100.229/index.html
66.62.91.6
38.136.1.229
www.ciliance.fr
208.255.77.2
https://cgsn.org
206.67.182.219/admin.html
170.206.226.20
168.100.253.3
ciscovpn.alliedholdings.com
|

matches [

{ :text=>"<title>Cisco Systems, Inc. VPN 3000 Concentrator " },

{ :text=>'<p>You are using an old browser or have disabled JavaScript. You <b>must</b> use version 4 or higher of Netscape Navigator/Communicator or version 4 or higher of Microsoft Internet Explorer with JavaScript enabled.</p>' },

]


end

