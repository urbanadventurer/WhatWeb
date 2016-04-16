##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Gallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-10
version "0.1"
description "Photo gallery - Requires PHP and MySQL"
website "http://gallery.menalto.com/"

# Google results as at 2012-04-10 #
# 187 for inurl:"/index.php/login/ajax" "Login" "Username" "Password" "Forgot your password"
# 187 for "Powered by Gallery" "First" "Previous" "Next" "Last" "Available RSS feeds"
# 120 for intitle:"Gallery 3 Installer" "Installing Gallery is easy. We just need a place to put your photos and info about your MySQL database."

# Dorks #
dorks [
'187 for inurl:"/index.php/login/ajax" "Login" "Username" "Password" "Forgot your password"'
]



# Matches #
matches [

# ./index.php/login/ajax # Login Page # Forgot password link
{ :text=>'<a href="#" id="g-password-reset" class="g-right g-text-small">Forgot your password?</a>' },

# Powered by link # Version Detection
{ :version=>/<li class="(g-)?first">Powered by <a href="http:\/\/gallery\.menalto\.com">(<bdo dir="ltr">)?Gallery ([^<]+)(<\/bdo>)?<\/a><\/li>/, :offset=>2 },

# ./installer/ # Install Page # Filepath Detection
{ :filepath=>/We've found a place to store your photos:\s+<code class="location">([^<]+)<\/code>/ },

# ./installer/ # Install Page # Title
{ :certainty=>75, :text=>'<title>Gallery 3 Installer</title>' },

]

end

