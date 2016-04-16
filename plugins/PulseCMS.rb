##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PulseCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-08
version "0.1"
description "Manage Content, Simply. Pulse is a simple CMS designed for small websites. It enables you to add content management to an existing site in five minutes."
website "http://pulsecms.com/"

# Google results as at 2011-02-08 #
# 9 for intitle:"Pulse Content Manager" +Pulse +CMS +Password +Login

# Dorks #
dorks [
'intitle:"Pulse Content Manager" "Pulse" "CMS" "Password" "Login"'
]



# Matches #
matches [

# Login Page # Default logo HTML
{ :text=>'<img src="img/new-logo.png" alt="Pulse CMS">' },

# Login Page # Default Password HTML
{ :text=>'<input type="password" size="27" name="mpass_pass">' },

# Login Page # Default Title
{ :text=>'<title>Pulse Content Manager</title>' },

# Login Page # Body HTML
{ :text=>'<body id="login-page" onload="document.login.mpass_pass.focus()">' },

# Default Logo
{ :url=>"img/new-logo.png", :md5=>"079d0b95c76564c1bb450650f17c3e7f" },
{ :url=>"img/new-logo.png", :md5=>"652807728bfb1cd7ffba4a5d40c4e374" },

]

end


