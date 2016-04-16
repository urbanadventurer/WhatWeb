##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Realtor-747" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.2"
description "IT747.COM is proudly presenting a property listings management system REALTOR 747 for real estate agents which adopted template based design so that web site designers can fully express their own imagination."
website "http://www.it747.com/realtor747/"

# Google results as at 2010-08-27 #
# 10 for "powered by Realtor 747"



# Matches #
matches [

# Admin Page
{ :text=>'<body onload="start_realtor747_admin();" onunload="stop_realtor747_admin();">' },

# Version Detection # Powered by text
{ :version=>/    <a href="http:\/\/www.it747.com\/realtor747" target="_blank"><span style="color: green;">Powered by REALTOR 747 - The Property Listings Management System - Version ([\d\.]+)<\/span><\/a><br>/ },

# Version Detection # Admin Page # Default Title
{ :version=>/<title>REALTOR 747 - The Property Listings Management System - Administration  - Version ([\d\.]+)<\/title>/ },

]

end


