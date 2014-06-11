##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Alpha-Five" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "The Alpha Five Application Server allows you to deploy the web applications you build with Alpha Five Developer. Each license allows you to install the server on one PC. - https://www.alphasoftware.com/shop/"

# ShodanHQ results as at 2011-08-20 #
# 463 for Alpha Five
# 275 for A5wSessionId
# 254 for A5wBrowserId

# Google results as at 2011-08-20 #
# 126 for inurl:/login.a5w

# Dorks #
dorks [
'inurl:/login.a5w'
]



# Matches #
matches [

# Version Detection # Server Header
{ :search=>"headers[server]", :version=>/^Alpha Five( Application Server)?\/([\d\.]+ Build\/[\d\-]+)/, :offset=>1 },

# A5wSessionId Cookie
{ :search=>"headers[set-cookie]", :regexp=>/A5wSessionId=[a-f\d]{32};/ },

# A5wBrowserId Cookie
{ :search=>"headers[set-cookie]", :regexp=>/A5wBrowserId=[a-f\d]{32};/ },

]

end

