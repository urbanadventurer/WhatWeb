##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Op5-Statistics" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-24
version "0.1"
description "Op5 Statistics"
website "http://op5.com/"

# Google results as at 2012-08-24 #
# 2 for intitle:"Login to op5 Statistics" "Please enter your op5 Statistics user name and password below"

# Dorks #
dorks [
'intitle:"Login to op5 Statistics" "Please enter your op5 Statistics user name and password below"'
]



# Matches #
matches [

# /statistics/ # Login Page # Logo HTML
{ :text=>'<td colspan="2"><center><img src="/statistics/plugins/op5gui/op5_statistics.gif" border="0" alt=""></center></td>' },

# Title
{ :text=>'<title>Login to op5 Statistics</title>' },

]

end

