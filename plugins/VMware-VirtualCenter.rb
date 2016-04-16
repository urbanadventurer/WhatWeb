##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VMware-VirtualCenter" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-06
version "0.1"
description "VMware VirtualCenter is a software suite designed to centralize the management of virtualized IT environments."
website "http://www.vmware.com/products/vcenter-server/"

# Data Sheet #
# http://www.vmware.com/pdf/vc_datasheet.pdf

# Manual #
# http://www.vmware.com/pdf/vsphere4/r40/vsp_40_web_access.pdf



# Matches #
matches [

# JavaScript
{ :text=>'<script type="text/javascript">document.write("<title>" + ID_VC_Welcome + "</title>");</script>' },

# Meta Description
{ :text=>'<meta name="description" content="VMware vSphere is virtual infrastructure software for partitioning, consolidating and managing systems in mission-critical environments. VMware ESX Server provides a highly scalable platform with advanced resource management capabilities, which can be managed by vSphere.">' },

# /en/welcomeRes.js # Version Detection
{ :url=>"/en/welcomeRes.js", :version=>/var ID_VC_Welcome = "Welcome to VMware vSphere ([^\s^\"]+)";/ },

# Title
{ :certainty=>75, :text=>'<title>VMware Virtual Infrastructure Web Access</title>' },

# /banner.png
{ :url=>"/banner.png", :md5=>"53ea8ad28aabd281be50075c4977d31b" },

]

end

