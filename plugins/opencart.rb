##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenCart" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-11
version "0.1"
description "OpenCart - Open Source Shopping Cart Solution"
website "http://www.opencart.com/"

# Google results as at 2012-04-11 #
# 308 for intitle:"Powered By OpenCart"
#  74 for intitle:"Administration" "Please enter your login details" "Username" "Password" "OpenCart"

# Dorks #
dorks [
'intitle:"Administration" "Please enter your login details" "Username" "Password" "OpenCart"'
]



# Matches #
matches [

# HTML Comment
{ :regexp=>/<!--\s+OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation\./ },

# Powered by link
{ :regexp=>/<div id="powered">Powered By <a href="http:\/\/www\.opencart\.com"( title="OpenCart")?>OpenCart<\/a>/ },

# ./admin/ # Admin Page # Footer # Version Detection
{ :version=>/<div id="footer">\s*<a href="http:\/\/www\.opencart\.com">OpenCart<\/a> &copy; 2009(-20[\d]{2})? All Rights Reserved\.<br \/>Version ([^<]+)<\/div>/, :offset=>1 },

# ./admin/ # Admin Page # Footer # Version Detection
{ :version=>/All Rights Reserved\.<br \/>OpenCart Version ([^<]+)\<\/div>/ },

# ./admin/ # Admin Page
{ :text=>'/admin/index.php?route=common/login" method="post" enctype="multipart/form-data" id="form">' },

]

end

