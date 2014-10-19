##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2012-02-19 # Brendan Coles <bcoles@gmail.com>
# Added aggressive logo match
# Added version detection
# Added google dork
# Removed JavaScript matches
##
# Version 0.2
# Removed :certainty=>100 & :name
##
Plugin.define "WebGuard" do
author "Andrew Horton"
version "0.3"
description "Security surveillance"
website "http://novuscctv.com/"

# ShodanHQ results as at 2012-02-19 #
# 618 for gsoap

# Google results as at 2012-02-19 #
# 61 for intitle:"WebGuard Login" "[LOGIN] [EXIT]"

# Dorks #
dorks [
'intitle:"WebGuard Login" "[LOGIN] [EXIT]"'
]



# Matches #
matches [

# Title
{ :certainty=>75, :text=>'<title>WebGuard Login</title>' },

# Login Page # body tag
{ :text=>'<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="GetInfo()" onResize="fit_center()">' },

# Login Page # Logo HTML
{ :text=>'<table id=loginback border="0" cellpadding="0" cellspacing="0" background="images/login_venus_back.gif" width=480 height=175 style=\'POSITION:absolute\'>' },

# Login Page # Password field
{ :text=>'<td align="left" valign="middle"><input name="login_passwd" type="password" class="noborder" size="26"></td>' },

# /UISelect.js # Version Detection
{ :url=>"/UISelect.js", :version=>/var _VERSION = "<acronym title='([^']+)'><table border='0'/ },

# /images/login_back.gif # Login Page Background Image
{ :url=>"/images/login_back.gif", :md5=>"4617667f3ec03b31a9971ff1c03da57e" },

# / # Redirect Page
{ :md5=>"457dff12099372b8415b29e2e50c3910" },

]

end

