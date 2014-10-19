##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sockso" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-16
version "0.1"
description "Sockso is a free, open-source, personal music host server"
website "http://sockso.pu-gh.com/"

# ShodanHQ results as at 2012-03-16 #
# 25 for Sockso

# Google results as at 2012-03-16 #
# 33 for "Login" intext:"If you've created an account you can put your info into the form below to login."

# Dorks #
dorks [
'"Login" intext:"If you\'ve created an account you can put your info into the form below to login."'
]



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Sockso$/ },

# Footer # Version Detection
{ :version=>/<p id="legal">[\s]+<strong>Sockso<\/strong>[\s]+v([^<]+)<br \/>[\s]+&copy; 20[\d]{2}/ },

]

end

