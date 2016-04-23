##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Owl-Intranet-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-30
version "0.1"
description "Owl is a multi user document repository (knowledge base) system written in PHP for publishing files/documents onto the web."
website "http://owl.anytimecomm.com"

# ShodanHQ results as at 2012-08-30 #
# 87 for owl_sessid

# Google results as at 2012-08-30 #
# 143 for "Owl Intranet Engine, Version Owl" "Username" "Password"

# Dorks #
dorks [
'"Owl Intranet Engine, Version Owl" "Username" "Password"'
]



# Matches #
matches [

# Cookie # owl_sessid
{ :search=>"headers[set-cookie]", :regexp=>/owl_sessid=/ },

# Footer # Version Detection
{ :version=>/<a class="version2" href="http:\/\/owl\.sourceforge\.net\/" target="_blank">Owl Intranet Engine, Version Owl ([^<]+)<\/a>/ },

# Title # # Version Detection
{ :version=>/<title>[^<]+ Owl ([\d\.]+ [\d]{8})<\/title>/ },

]

end

