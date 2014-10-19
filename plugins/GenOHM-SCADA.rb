##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GenOHM-SCADA" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "GenOHM SCADA is a Visualization and Control system for KNX/EIB networks."
website "http://corp.genohm.eu/index.php?option=com_content&view=article&id=39&Itemid=34"

# Google results as at 2012-08-26 #
# 2 for intitle:"GenOHM Scada Launcher"

# Dorks #
dorks [
'intitle:"GenOHM Scada Launcher"'
]



# Matches #
matches [

# Title
{ :text=>'<title>GenOHM Scada Launcher</title>' },

# /favicon.ico
{ :url=>"/favicon.ico", :md5=>"311df4268641ef7c01f43a077ff2c9fe" },

# /cgi-bin/scada-vis/index.cgi # Version Detection
{ :url=>"/cgi-bin/scada-vis/index.cgi", :version=>/var LMVersion = '([^\s^']+)';/ },

]

end

