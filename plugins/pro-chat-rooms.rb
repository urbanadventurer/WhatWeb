##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-15 #
# Updated version detection
##
Plugin.define "Pro-Chat-Rooms" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.2"
description "An Ideal Solution For Web Conferencing, Dating and all Online Communities."
website "http://www.prochatrooms.com/"

# Google results as at 2010-08-30 #
# 4 for "Pro Chat Rooms" "Please enter your login details below." "Select Room"

# Dorks #
dorks [
'"Pro Chat Rooms" "Please enter your login details below." "Select Room"'
]



# Matches #
matches [

# Login Page # Default title
{ :text=>'<title>Pro Chat Rooms</title>' },

# Login Page # Default form HTML
{ :text=>'<tr id="doPasswordBox"><td>Password:</td><td><input type="password" name="password" id="password" value="" onblur="def(\'password\')" class="uInput"/></td></tr>' },

# Login Page # Default JavaScript # error message
{ :text=>'	showError("char_error", "Sorry, Username is already registered.");' },

# Login Page # Default JavaScript # error message
{ :text=>"var loginNameErrorChr = 'Your username has special characters.<br>These characters are not allowed,<br>!@#$\%SPC^&*()+=-[]\&#39;;,./{}|&#34:<>?.<br>Please remove them and try again.';" },

# Version Detection # logo alt text
{ :version=>/<img src="images\/chat.gif" border="0" alt="Pro Chat Rooms v([\d\.]+)" title="Pro Chat Rooms v([\d\.]+)" \/>/ },

]

end

