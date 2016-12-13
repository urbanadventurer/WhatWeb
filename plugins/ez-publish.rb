##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eZ-Publish" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "eZ Publish is an Open Source Content Management System chosen by thousands of enterprises and organizations world wide."
website "http://ez.no/"

# ShodanHQ results as at 2011-03-17 #
# 1,716 for X-Powered-By: eZ Publish

# Google results as at 2011-03-17 #
# 58 for Admin intitle:"eZ publish administration"

# Dorks #
dorks [
'Admin intitle:"eZ publish administration"'
]



# Matches #
matches [

# Admin # Title
{ :text=>'<title>eZ publish administration</title>' },

# Admin # CSS
{ :text=>'<link rel="stylesheet" type="text/css" href="/admin/templates/ezpublish/style.css" />' },

# Admin # body
{ :text=>"topmargin=\"6\" marginheight=\"6\" leftmargin=\"6\" marginwidth=\"6\" onload=\"MM_preloadImages('/admin/images/ezpublish/redigerminimrk.gif','/admin/images/ezpublish/slettminimrk.gif','/admin/images/ezpublish/downloadminimrk.gif')\">" },

# X-Powered-By Header
{ :search=>"headers[x-powered-by]", :regexp=>/^eZ [p|P]ublish/ },

]

end


