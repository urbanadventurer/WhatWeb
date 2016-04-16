##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VPON" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "Video Picture on Net (VPON) is a remote video web server"
website "http://www.vpon21.com/"
# Default login: webmonitor/oyo

# Google results as at 2011-04-20 #
# 5 for inurl:"start.htm?scrw="

# ShodanHQ results as at 2011-04-20 #
# 256 for VPON Server

# Dorks #
dorks [
'inurl:"start.htm?scrw="'
]



# Matches #
matches [

# Version Detection # /ctrl_ver.js
{ :url=>"/ctrl_ver.js", :version=>/^var live_video_control_version ="([^"]+)";/ },

# Model Detection # /ctrl_ver.js
{ :url=>"/ctrl_ver.js", :model=>/^var vpon_platform = "([^"]+)";/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^VPON Server\/([\d\.]+)$/ },

]

end

