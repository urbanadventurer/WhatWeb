##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Blue-Coat-ProxySG" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-12
version "0.1"
description "Blue Coat ProxySG - provides complete control over all web traffic - includes user authentication, web filtering, data loss prevention, inspection and validation of SSL-encrypted traffic, content caching, bandwidth management, stream-splitting and more."
website "http://www.bluecoat.com/products/proxysg"

# ShodanHQ results as at 2012-09-12 #
# 13 for location proxysg



# Matches #
matches [

# Location Header # proxysg hostname # cfru param = base64(url)
{ :search=>"headers[location]", :regexp=>/https?:\/\/proxysg\/\?cfru=[^\s]+$/ },

]

end

