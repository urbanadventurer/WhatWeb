##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "McAfee-ePolicy-Orchestrator" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-22
version "0.1"
description "McAfee ePolicy Orchestrator (ePO) - unified security management"
website "http://www.mcafee.com/us/products/epolicy-orchestrator.aspx"

# Data Sheet #
# http://www.mcafee.com/us/resources/data-sheets/ds-epolicy-orchestrator.pdf

# Google results as at 2012-06-22 #
# 1 for inurl:"/core/orionSplashScreen.do" "Log On to ePolicy Orchestrator" "User name" "Password" "Language"

# Dorks #
dorks [
'inurl:"/core/orionSplashScreen.do" "Log On to ePolicy Orchestrator" "User name" "Password" "Language"'
]



# Matches #
matches [

# Title # Version Detection
{ :version=>/<title>\s+ePolicy Orchestrator ([^\s]+ \(Build: \d+\))\s+<\/title>/ },

# /EPOCore/images/epo-logo-login.gif # Version: 4.x
{ :url=>"/EPOCore/images/epo-logo-login.gif", :md5=>"aa4beb20b354c761257271e86e9ec92b", :version=>"4.x" },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Undefined$/ },

]

end

