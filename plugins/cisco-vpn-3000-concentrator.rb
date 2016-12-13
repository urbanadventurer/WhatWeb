##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cisco-VPN-3000-Concentrator" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "Cisco VPN 3000 Series Concentrators provide your business with unprecedented cost savings through flexible, reliable, and high-performance remote-access solutions. Last Date of Support: 2012-08-31"
website "http://www.cisco.com/en/US/products/hw/vpndevc/ps2284/index.html"

# 15 results for "intitle:Cisco Systems, Inc. VPN 3000 Concentrator" @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=791
# Default login: admin/admin

matches [

{ :text=>"<title>Cisco Systems, Inc. VPN 3000 Concentrator " },
{ :text=>'<p>You are using an old browser or have disabled JavaScript. You <b>must</b> use version 4 or higher of Netscape Navigator/Communicator or version 4 or higher of Microsoft Internet Explorer with JavaScript enabled.</p>' },

]
end

