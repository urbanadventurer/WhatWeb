##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DVWA" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-05
version "0.1"
description "Damn Vulnerable Web App (DVWA) is a PHP/MySQL web application that is damn vulnerable."
website "http://www.dvwa.co.uk/"

# Google results as at 2011-03-05 #
# 1 for intutle:"Damn Vulnerable Web App (DVWA) - Login"
dorks [
'intitle:"Damn Vulnerable Web App (DVWA) - Login"'
]




# Matches #
matches [

# Default title
{ :text=>'		<title>Damn Vulnerable Web App (DVWA) - Login</title>' },

# Default stylesheet HTML
{ :regexp=>/		<link rel="stylesheet" type="text\/css" href="[^"]*dvwa\/css\/login.css" \/>/ },

# Password input
{ :text=>'			<p><label for="pass">Password</label><input type="password" AUTOCOMPLETE="off" size="20" name="password"></p><br />' },

]

end


