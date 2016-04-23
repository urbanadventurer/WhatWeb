##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dell-KACE-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-02
version "0.1"
description "Dell KACE System Management Appliance"
website "http://www.kace.com/products/overview"

# ShodanHQ results as at 2012-05-02 #
# 284 for X-KBOX-WebServer
# 185 for X-DellKACE-Version



# Matches #
matches [

# /common/about.php # Version Detection
{ :url=>"/common/about.php", :version=>/<b>K1000 Systems Management Appliance<\/b> <b>v([^\s^<]+)<\/b>/ },

# X-DellKACE-Version # Version Detection
{ :search=>"headers[x-dellkace-version]", :version=>/^(.+)$/ },

# X-DellKACE-Host # Server Name Detection
{ :search=>"headers[x-dellkace-host]", :string=>/^(.+)$/ },

# X-DellKACE-Appliance # Model Detection
{ :search=>"headers[x-dellkace-appliance]", :model=>/^(.+)$/ },

# X-KBOX-Version # Version Detection
{ :search=>"headers[x-kbox-version]", :version=>/^(.+)$/ },

# X-KBOX-WebServer # Server Name Detection
{ :search=>"headers[x-kbox-webserver]", :string=>/^(.+)$/ },

]

end

