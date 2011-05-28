##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VMware-ESXi-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-28
version "0.1"
description "VMware ESXi Server is virtual infrastructure software for partitioning, consolidating and managing systems in mission-critical environments. VMware ESXi Server provides a highly scalable virtual machine platform with advanced resource management capabilities, which can be managed by vSphere. - Homepage: http://www.vmware.com/products/vsphere-hypervisor/overview.html"

# Examples #
examples %w|
https://210.0.227.45/
https://giatamedia.de/
https://abestinfo.com/
https://havalgroup.com/
https://novycasmobil.sk/
https://zanzibar.cz/
|

# Matches #
matches [

# Title
{ :text=>'<script type="text/javascript">document.write("<title>" + ID_EESX_Welcome + "</title>");</script>' },

# Meta Description
{ :text=>'<meta name="description" content="VMware ESXi Server is virtual infrastructure software for partitioning, consolidating, and managing systems in mission-critical environments. VMware ESXi Server provides a highly scalable virtual machine platform with advanced resource management capabilities, which can be managed by VMware vCenter Server.">' },

# h1 heading
{ :text=>'<h1><script type="text/javascript">document.write(ID_EESXServer3);</script></h1>' },

]

end

