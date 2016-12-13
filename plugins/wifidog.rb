##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WiFiDog" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-23
version "0.1"
description "The Wifidog project is an open source captive portal solution. Requires: PHP and postgresql"
website "http://dev.wifidog.org/"

# 69 for "I am unable to retrieve the schema version. Either the wifidog database hasn't been created yet, the postgresql server is down, or pg_hba.conf does not allow your web server to connect to the wifidog database." +host +port +dbname
#  4 for intitle:"Wifidog Auth-server installation and configuration" "Welcome to the WifiDog Auth-Server installation and configuration script"

# Dorks #
dorks [
'"I am unable to retrieve the schema version. Either the wifidog database hasn\'t been created yet, the postgresql server is down, or pg_hba.conf does not allow your web server to connect to the wifidog database." "host" "port" "dbname"'
]



# Matches #
matches [

# Title # Install Page
{ :text=>'<TITLE>Welcome - Wifidog Auth-server installation and configuration</TITLE>' },

# Next Link
{ :text=>"<p><br></p><A HREF=\"#\" ONCLICK=\"document.myform.page.value = 'Prerequisites'; document.myform.action.value = ''; document.myform.submit();\" CLASS=\"submit\">Next</A>" },

# Error page
{ :text=>"<html><body><h1>I am unable to retrieve the schema version. Either the wifidog database hasn't been created yet, the postgresql server is down, or pg_hba.conf does not allow your web server to connect to the wifidog database.</h1>" },

]

end

