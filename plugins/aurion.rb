##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Aurion" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "Integrated HR and Payroll software available online, hosted or in-house. [Australian]"
website "http://www.aurion.com.au/"

# Google results as at 2011-08-25 #
# 2 for intitle:"Aurion V10"
# 2 for "Error: JavaScript is not enabled" "Please enable JavaScript in your browser or refer to you internal IT support for assistance."
# 1 for inurl:aurprod10

# Dorks #
dorks [
'"Error: JavaScript is not enabled" "Please enable JavaScript in your browser or refer to you internal IT support for assistance."'
]



# Matches #
matches [

# Login Page # Noscript
{ :text=>'<br/>Please enable JavaScript in your browser or refer to you internal IT support for assistance.<br/><br/></div>' },

# Login Page # HTML comment
{ :text=>'<!-- Aurion Teal will be used as the login-time default. Shell layouts will replace these after login. -->' },

# Login Page # HTML comment
{ :text=>'<!-- teal.css has stuff needed for div#loading-noscript -->' },

# meta http-equiv="X-UA-Compatible" and HTML comment
{ :text=>'<meta http-equiv="X-UA-Compatible" content="chrome=1; IE=8; IE=7"> <!-- Stop Internet Explorer from using "Compatability Mode" -->' },

# Login Page # Version Detection # Title
{ :version=>/<title>Aurion V([^\s^<]+)<\/title>[\s]+<link rel="shortcut icon" href="\.\/favicon\.ico" >/ },

]

end

