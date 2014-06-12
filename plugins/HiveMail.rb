##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HiveMail" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-24
version "0.1"
description "HiveMail - PHP Webmail Portal Script - Hompage: http://www.hivemail.com/"

# ShodanHQ results as at 2012-08-24 #
# 5 for hivesession

# Google results as at 2012-08-24 #
# 52 for "You are not logged in" "Forgot your password" "Choose a skin"
#  1 for intitle:"Database Error in HiveMail"

# Dorks #
dorks [
'"You are not logged in" "Forgot your password" "Choose a skin"'
]



# Matches #
matches [

# Error Page # Title
{ :text=>'<title>Database Error in HiveMail&trade;</title>' },

# Login Page # Version Detection # JavaScript
{ :version=>/\/\/ myaccounts holds the userpics\s+myaccounts = '[^']*';\s+recaptcha_global = "[^"]+";\s+hiveversion = "v([^"]+)";/ },

# Login Page # input field
{ :text=>'<input type="text" class="validate[ajax[ajaxUserCall]] input" name="answer" id="answer" />' },

# Login Page # Meta Product # Version Detection
{ :version=>/<meta name="product" content="Hivemail v([^"]+)">/ },

# hivesession Cookie
{ :search=>"headers[set-cookie]", :regexp=>/hivesession=/ },

]

end

