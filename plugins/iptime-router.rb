##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ipTIME-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "ipTIME Rrouter [Korean] - developed by EFM Networks"
website "http://www.iptime.co.kr/~iptime/prd.php?pf=3"

# Google results as at 2011-03-19 #
# 103 for intitle:"EFM Networks ipTIME" +Version



# Matches #
matches [

# Model Detection # Title
{ :model=>/<head><title>EFM Networks ipTIME ([A-Z0-9]+)<\/title>/ },
{ :model=>/<head><title>EFM networks - ipTIME ([A-Z0-9]+)<\/title>/ },

# IP Detection
{ :url=>"/login/login.cgi", :string=>/([\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3})<\/span><br>[\s]*<span class=item_text><b>Version [\d\.]+<\/b><\/span>/ },

# Firmware Detection
{ :url=>"/login/login.cgi", :firmware=>/(No IP|[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3})<\/span><br>[\s]*<span class=item_text><b>(F\/W )?Version ([\d\.]+)<\/b><\/span>/, :offset=>2 },

]

end


