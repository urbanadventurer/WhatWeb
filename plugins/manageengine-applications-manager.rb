##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ManageEngine-Applications-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-04
version "0.1"
description "ManageEngine Applications Manager - monitoring software - includes server monitoring, application server monitoring, database monitoring, web services monitoring, virtualization monitoring, cloud monitoring"
website "http://www.manageengine.com/products/applications_manager/"

# Google results as at 2012-08-04 #
# 11 for intitle:"Applications Manager Login Screen" "Applications Manager" "Number of Monitor"
#  2 for inurl:"webclient/common/jsp/home.jsp"

# Dorks #
dorks [
'intitle:"Applications Manager Login Screen" "Applications Manager" "Number of Monitor"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- This comment is for Instant Gratification to work applications.do -->' },

# JavaScript
{ :text=>'<SCRIPT LANGUAGE="JavaScript1.2" SRC="/template/appmanager.js"></SCRIPT>' },

# Title
{ :text=>'<title>Applications Manager Login Screen</title>' },

# Build Version Detection # Login Page
{ :version=>/<td>Applications Manager \((Build No:[\d]+)\) &nbsp;&nbsp;&nbsp;&nbsp;Number of Monitor\(s\) : / },

# images/am_logo.gif
{ :url=>"images/am_logo.gif", :md5=>"4454cf4db9355b0e26b98cc354213c56" },

]

end

