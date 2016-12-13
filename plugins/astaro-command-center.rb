##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Astaro-Command-Center" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-12
version "0.1"
description "Astaro Command Center is a central management solution which provides direct access for application configuration, enables real-time system status surveillance and maintains device software and pattern updates."
website "http://www.astaro.com/"

# Google results as at 2012-04-12 #
# 3 for intitle:"WebAdmin" "You have forgotten to enable JavaScript in your Browser!"

# Dorks #
dorks [
'intitle:"WebAdmin" "You have forgotten to enable JavaScript in your Browser!"'
]



# Matches #
matches [

# JavaScript
{ :text=>'<script src="wfe/acc/js/acc_aggregated_reporting.js?t=' },

# JavaScript # Also used by Astaro Security Gateway
{ :certainty=>75, :text=>'<script src="wfe/asg/js/_variables_from_backend.js?t=' },

# /core/img/topbar/topbar_center.png
{ :url=>"/core/img/topbar/topbar_center.png", :md5=>"530834f021dab3082c36592e259404e6", :version=>"3.x" },

]

end

