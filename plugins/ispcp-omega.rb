##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-17 # Andrew Horton
# Added website parameter
##
# Version 0.2
# removed :probability
##
Plugin.define "ispCP-Omega" do
author "Andrew Horton"
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

