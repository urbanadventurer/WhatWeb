##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "web2Project" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-11-02
version "0.1"
description "web2Project is a Free Open Source business-oriented Project Management System (PMS) - Homepage: http://web2project.net/"

# ShodanHQ results as at 2012-11-04 #
# 63 for web2project

# Google results as at 2012-11-02 #
# 21 for "Fatal Error. You haven't created a config file yet." "Click Here To Start Installation and Create One! (forwarded in 5 sec.)"
#  6 for inurl:"install/index.php" "Welcome to the web2Project Update Manager!"
#  2 for intitle:"web2Project Development :: web2Project Login"

# Dorks #
dorks [
'"Fatal Error. You haven\'t created a config file yet." "Click Here To Start Installation and Create One! (forwarded in 5 sec.)"'
]

# Examples #
examples %w|
84.52.99.58
190.16.249.213
193.108.161.124
199.84.140.9
200.217.178.237
130.79.201.106
193.178.138.63
200.155.4.67
demo.web2project.net
samulaci.uw.hu/index.php
yuddle.com/websites/deleted/dotproj/
geosimultaneous.com/eckel-binder/dotproject/
www.bankart.ru/support/index.php
|

# Matches #
matches [

# Title
{ :text=>'<title>web2Project Development :: web2Project Login</title>' },

# Install Redirect Page
{ :text=>"</head><body>Fatal Error. You haven't created a config file yet.<br/><a href=" },

# Meta Version # Version Detection
{ :certainty=>25, :version=>/<meta name="Version" content="([^"^\s]+)" \/>/ },

# web2project Cookie
{ :search=>"headers[set-cookie]", :regexp=>/web2project=[^;]+;/ },

]

end

