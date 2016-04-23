##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sawmill" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-20
version "0.1"
description "Sawmill is a universal log analysis/reporting tool for almost any log including web, media, email, security, network and application logs."
website "http://www.sawmill.net/"

# ShodanHQ results as at 2012-03-20 #
# 130 for Sawmill

# Google results as at 2012-03-20 #
# 7 for intitle:"Sawmill Login" "Sawmill Login" "Please enter your username and password."

# Dorks #
dorks [
'intitle:"Sawmill Login" "Sawmill Login" "Please enter your username and password."'
]



# Matches #
matches [

# Old Versions # <=6.x ???
{ :regexp=>/<tr><td>Username:<\/td><td>Administrator<input type="hidden" name="cgionly_authentication_username" value="([^\"]+)"><\/td><\/tr>/ },

# New Versions # >=7.x ???
{ :text=>'<td><input id="password" class="username-psw text" type="password" value="" /><div id="password:error" class="form-error"></div></td>' },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Sawmill\/([^\s]+)/ },

]

end

