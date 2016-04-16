##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "net2ftp" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-30
version "0.1"
description "net2ftp is a web based FTP client"
website "http://www.net2ftp.com/"

# Google results as at 2011-10-30 #
# 211 for intitle:"net2ftp" "Clear cookies"
# 133 for intitle:"net2ftp" "Clear cookies" "Passive mode"
#  81 for "Powered by net2ftp - a web based FTP client" intitle:"net2ftp - a web based FTP client" "Clear cookies"

# Dorks #
dorks [
'intitle:"net2ftp" "Clear cookies"',
'"Powered by net2ftp - a web based FTP client" intitle:"net2ftp - a web based FTP client" "Clear cookies"'
]



# Matches #
matches [

# Title
{ :certainty=>25, :text=>'<title>net2ftp - a web based FTP client</title>' },

# Version Detection # HTML Comment
{ :version=>/<!-- net2ftp version ([^\s]+) -->/ },

# HTML Comment
{ :text=>'<!-- End of net2ftp login form -->' },

]

end

