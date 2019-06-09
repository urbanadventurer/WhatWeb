##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ispCP-Omega"
authors [
  "Andrew Horton",
  # v0.2 # removed :probability. 
  # Andrew Horton, # v0.3 # 2016-04-17 # Added website parameter. 
]
version "0.3"
description "PHP opensource, virtual hosting system"
website "http://www.isp-control.net/"


# <title>ispCP Omega a Virtual Hosting Control System</title>
# Powered by <a class="login" href="http://www.isp-control.net" target="_blank">ispCP Omega</a>
# themes/omega_original/images/login/login_lock.jpg

# Dorks #
dorks [
'Powered by ispCP Omega',
'intitle:"ispCP Omega a Virtual Hosting Control System"'
]

# Matches #
matches [
{:text=>'<title>ispCP Omega a Virtual Hosting Control System</title>' },
{:text=>'Powered by <a class="login" href="http://www.isp-control.net" target="_blank">ispCP Omega' },
{:text=>'themes/omega_original/images/login/login_lock.jpg' }
]

end

