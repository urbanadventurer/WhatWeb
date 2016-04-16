##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HP-Virtual-Connect-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-07
version "0.1"
description "HP Virtual Connect Enterprise Manager (VCEM) centralizes connection management and workload mobility for HP BladeSystem servers that use Virtual Connect to access LANs, SANs and converged network infrastructures. Virtual Connect is technology that rethinks how blade servers are connected to your LAN and SAN. With HP Virtual Connect, you can connect and pre-assign all of the LAN MAC addresses and SAN WWNs that the server pool might ever need at the same time that you wire the rack and enclosures."
website "http://h18004.www1.hp.com/products/blades/components/ethernet/vcem/index.html"

# More Info #
# http://h18000.www1.hp.com/products/blades/virtualconnect/infrastructure.html

# ShodanHQ results as at 2011-07-07 #
# 60 for Virtual Connect -0
# 56 for Module Virtual Connect



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- HP Virtual Connect Manager                                            -->' },

# progress_bar_large.gif
{ :text=>'<h2><img src="./images/progress_bar_large.gif"></h2><br />Loading, please wait...' },

# Year Detection
{ :string=>/<!--[\s]+\(C\) Copyright (20[\d]{2}) Hewlett-Packard Development Company, L\.P\.[\s]+-->/ },

# /html/index.html # Title 
{ :url=>"/html/index.html", :text=>'<title>HP Virtual Connect Manager</title>' },

# /html/index.html # iframe
{ :url=>"/html/index.html", :text=>"<frame id='MX_HIDDEN' name='MX_HIDDEN' src=\"common/hiddenFrame.html\" noresize>" },

]

end

