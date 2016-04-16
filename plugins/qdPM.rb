##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "qdPM" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-15
version "0.1"
description "qdPM is a free web-based project management tool suitable for a small team working on multiple projects."
website "http://qdpm.net/"

# ShodanHQ results as at 2012-06-15 #
# 8 for Set-Cookie qdpm

# Google results as at 2012-06-15 #
# 62 for "qdPM" "is redistributable under the GNU General Public License" "Login" "Email" "Password"

# Dorks #
dorks [
'"qdPM" "is redistributable under the GNU General Public License" "Login" "Email" "Password"'
]



# Matches #
matches [

# Login Page # Footer # Version Detection
{ :version=>/qdPM ([^\s]+) &nbsp;is redistributable under the\s+<a class="footer-text"/ },

# Login Page # Footer # Year Detection
{ :string=>/Copyright @ (20[\d]{2}) <a class="footer-text" target="_blank"( title="open source project management software")? href="http:\/\/(www\.qds-team\.com|qdpm\.net\/)">/ },

# Set-Cookie # qdp or qdpm_extended
{ :search=>"headers[set-cookie]", :regexp=>/qdpm(_extended)?=[^;]+;/ },

]

end

