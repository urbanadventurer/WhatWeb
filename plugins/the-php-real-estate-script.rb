##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "The-PHP-Real-Estate-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "The Real Estate Script is a fully scalable turn-key PHP MySQL Real Estate Classifieds."
website "http://www.therealestatescript.com/"

# Version 0.1 can fingerprint only the admin login page:
# - This script is closed source and there are very few online examples.



matches [
{ :text=>"<tr><td><h3>Administration Login<hr size=1/></h3><form action='login.php' method='post'><table border=0 cellpadding=2><tr><td>Username</td><td><input type='text' name='Username' required='yes' validate='text' message='Enter Admin Username.'></td></tr><tr><td>Password</td><td><input type='password' name='Password' required='yes' validate='text' message='Enter Admin Password.'></td></tr><td valign='top'>Image Verification</td>" },

{ :text=>"<tr><td><h3>Administration Login<hr size=1/></h3><form action='login.php' method='post'><table border=0 cellpadding=2><tr><td>Username</td><td><input type='text' name='Username' required='yes' value='admin' validate='text' message='Enter Admin Username.'></td></tr><tr><td>Password</td><td><input type='password' name='Password' required='yes' validate='text' value='admin' message='Enter Admin Password.'></td></tr><td valign='top'>Image Verification</td>" },

]


end

