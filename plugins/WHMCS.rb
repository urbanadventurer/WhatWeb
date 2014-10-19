##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WHMCS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "WHMCS is an all-in-one client management, billing & support solution for online businesses."
website "http://www.whmcs.com/"

# Google results as at 2011-08-25 #
# 595 for "Powered by WHMCompleteSolution" inurl:cart.php +Language
# 163 for intitle:"WHMCS Complete Billing & Support System - Login" "Remember me until I logout"
#  47 for intitle:"WHMCS Mobile Edition" +Home +Clients +Tickets +Orders +Activity +Logout +Version

# Dorks #
dorks [
'"Powered by WHMCompleteSolution" inurl:cart.php "Language"',
'intitle:"WHMCS Complete Billing & Support System - Login" "Remember me until I logout"'
]



# Matches #
matches [

# Powered by link
{ :text=>'<p align="center">Powered by <a href="http://www.whmcs.com/" target="_blank">WHMCompleteSolution</a></p>' },

# Login Page # Powered by link
{ :text=>'<td align="right" valign="middle">Powered by <a href="http://www.whmcs.com/" target="_blank">WHMCS</a></td>' },

# Login + Register links HTML
{ :text=>'<div id="welcome_box">Please <a href="clientarea.php" title="Login"><strong>Login</strong></a> or <a href="register.php" title="Register"><strong>Register</strong></a></div>' },

# Version Detection # Mobile Login Page # Footer
{ :version=>/<tr><td bgcolor="#efefef" height="20" align="center"><a href="index\.php">Home<\/a> \| <a href="clients\.php">Clients<\/a> \| <a href="supporttickets\.php">Tickets<\/a> \| <a href="orders\.php">Orders<\/a> \| <a href="activitylog\.php">Activity<\/a> \| <a href="logout\.php">Logout<\/a><\/td><\/tr>[\s]+<tr><td align="center">[^,^\s]+, [^<]+<br \/>Version: ([^<^\s]+)<\/td><\/tr>/ },

# License Error Page # Change license key link
{ :text=>'<p>Got a new license key?  <a href="licenseerror.php?licenseerror=change">Click here to enter it</a></p>' },

]

# An aggressive plugin could retrieve the version from ./mobile/login.php #

end

