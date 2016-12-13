##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Citrix-XenServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-28
version "0.1"
description "Citrix XenServer is a complete, managed server virtualization platform built on the powerful Xen hypervisor."
website "http://www.citrix.com/English/ps2/products/feature.asp?contentID=2300351"

# Google results as at 2011-08-28 # Lots of false positives
# intitle:"XenServer 5.6.100"
# intitle:"XenServer" "Citrix Systems, Inc. XenServer" "XenCenter CD image" "XenCenter installer"



# Matches #
matches [

# Version Detection
{ :url=>"/", :version=>/<html>\s+<title>XenServer ([^\s^<]+)<\/title>\s+<head>\s+<\/head>\s+<body>\s+<p\/>Citrix Systems, Inc\. XenServer ([^\s]+)\s+<p\/><a href="XenCenter\.iso">XenCenter CD image<\/a>\s+<p\/><a href="XenCenter\.msi">XenCenter installer<\/a>/ },

# Home Page # matches home page when version numbers aren't displayed
{ :url=>"/", :md5=>"141c8bbcda4cf773763e9f2108d62ff3" },

]

end

