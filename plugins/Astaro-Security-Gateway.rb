##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Astaro-Security-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-12
version "0.1"
description "Astaro Security Gateway - Unified Threat Management (UTF) Firewall device"
website "http://www.astaro.com/products/hardware-appliances"

# Data Sheet #
# http://www.astaro.com/sites/default/files/Resources/datasheets/astaro-security-gateway-en.pdf

# Google results as at 2012-04-12 #
# 3 for intitle:"WebAdmin" "You have forgotten to enable JavaScript in your Browser!"

# Dorks #
dorks [
'intitle:"WebAdmin" "You have forgotten to enable JavaScript in your Browser!"'
]



# Matches #
matches [

# JavaScript
{ :text=>'<script src="wfe/asg/js/app_selector.js?t=' },

# JavaScript # Also used by Astaro Command Center
{ :certainty=>75, :text=>'<script src="wfe/asg/js/_variables_from_backend.js?t=' },

# /core/img/topbar/topbar_center.png
{ :url=>"/core/img/topbar/topbar_center.png", :md5=>"2e6cdce49c669ec305b2d73eead50e4c", :version=>"8.x" },

]

end

