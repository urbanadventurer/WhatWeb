##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMyBackupPro" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-30
version "0.1"
description "phpMyBackup Pro is a very easy to use, free, web-based MySQL backup application, licensed under the GNU GPL."
website "http://www.phpmybackuppro.net/"



# Matches #
matches [

# WWW-Authenticate # Realm
{ :search=>"headers[www-authenticate]", :regexp=>/[bB]asic realm="phpMyBackupPro"/ },

# Login message
{ :text=>'Please login (use your MySQL username and password): <a href="index.php?login=TRUE">Login</a>' },

]

end

