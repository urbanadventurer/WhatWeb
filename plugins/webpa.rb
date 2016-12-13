##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebPA" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-25
version "0.1"
description "WebPA is an open source online peer assessment tool that enables every team member to recognise individual contributions to group work."
website "http://www.webpaproject.com/"

# Google results as at 2012-08-25 #
# 12 for intitle:"WebPA OS" "Web-PA Login"

# Dorks #
dorks [
'intitle:"WebPA OS" "Web-PA Login"'
]



# Matches #
matches [

# Login Page # Logo HTML
{ :string=>/<td align="right"><div id="inst_logo"><img src="[^"]+" alt="([^"]*)" \/><\/div>/ },

# Login Page # keep alive iframe
{ :regexp=>/<iframe src="https?:\/\/[^\/]+\/keep_alive\.php" height="1" width="1" style="display: none;">keep alive<\/iframe>/ },

# /images/tool/appbar_webpa_logo.png
{ :md5=>"4bfb4898e9927666d6d5a35c7570a960", :url=>"/images/tool/appbar_webpa_logo.png" },

]

end

