##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SlideShowPro-Director" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-03-18
version "0.1"
description "Content management and universal slideshow publishing for desktops, Apple iOS and Android."
website "http://slideshowpro.net/products/slideshowpro_director/"

# Google results as at 2013-03-18 #
# 161 for intitle:"SlideShowPro Director" "Lost Username" "Password" "Sign in" "Remember me"

# Dorks #
dorks [
'intitle:"SlideShowPro Director" "Lost Username" "Password" "Sign in" "Remember me"'
]



# Matches #
matches [

# /admin/ # Login Page # Version Detection
{ :version=>/<div id="simple-footer">\s+<span>SlideShowPro Director ([^<]+)<\/span>/ },

# /admin/ # Login Page
{ :text=>'</div> <!--close login-container-->	</body>' },

]

end

