##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CitrusDB" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-11
version "0.1"
description "CitrusDB is a web based customer care and billing software solution (CC&B) - Requires PHP and MySQL"
website "http://www.citrusdb.org/"

# Google results as at 2012-04-11 #
# 36 for intitle:CitrusDB "Enter your username and password" "username" "password"

# Dorks #
dorks [
'intitle:CitrusDB "Enter your username and password" "username" "password"'
]



# Matches #
matches [

# input
{ :text=>'<INPUT TYPE="SUBMIT" NAME="submit" VALUE="Login"  onclick="password.value = calcMD5(password.value)" class=smallbutton>' },

# logo html
{ :certainty=>75, :text=>'<center><table><td valign=top><img src="images/my-logo.png">' },

]

end

