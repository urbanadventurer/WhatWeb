##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Hughes-Satellite-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-14
version "0.1"
description "Hughes IPoS (IP over Satellite) router"
website "http://www.hughes.com/ProductsAndTechnology/BroadbandSatelliteSystems/Pages/default.aspx"

# ShodanHQ results as at 2011-08-14 #
# 3,874 for HUGHES Terminal

# Google results as at 2011-08-14 #
# 2 for inurl:sys_info "Print this page. It will be needed if your system fails."

# Dorks #
dorks [
'inurl:sys_info "Print this page. It will be needed if your system fails."'
]



# Matches #
matches [

# Frameset
{ :text=>'<frame src=/fs/dynaform/dw_logo.html scrolling=no marginheight=0 marginwidth=0 NORESIZE>' },

# Model Detection # Frameset # Title
{ :model=>/<title>([A-Z]{0,2}[\d]{1,5}[A-Z]?) System Control Center<\/title>/ },

# Model Detection # /fs/dynaform/welcome.html
{ :url=>"/fs/dynaform/welcome.html", :model=>/<ctrlCenter style="font-size: 14pt; color: #000000; font-weight: bold">([^\s]+) <\/ctrlCenter>/ },

# Version Detection # /sys_info/
{ :url=>"/sys_info/", :version=>/<\/td><\/tr><tr><td><div class=text>Software Release:<\/td><td><div class=text>([^<^\s]+)<\/td><\/tr>/ },

# MAC Address Detection # /sys_info/
{ :url=>"/sys_info/", :string=>/<\/td><\/tr><tr><td><div class=text>LAN[\d]{1,2} MAC Address:<\/td><td><div class=text>([A-F\d:]{17})<\/td><\/tr>/ },

# WWW-Authenticate Header
{ :search=>"headers[www-authenticate]", :regexp=>/^Basic realm="HUGHES Terminal"$/ },

]

end

