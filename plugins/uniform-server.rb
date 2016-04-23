##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Uniform-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-15
version "0.1"
description "Uniform Server is a lightweight server solution for running a web server under the WindowsOS. Includes the latest versions of Apache2, Perl5, PHP5, MySQL5, phpMyAdmin."
website "http://www.uniformserver.com/"

# Google results as at 2012-04-15 #
# 19 for intitle:"The Uniform Server" "Served Subdirectories" "Developed By The Uniform Server Development Team"

# Dorks #
dorks [
'intitle:"The Uniform Server" "Served Subdirectories" "Developed By The Uniform Server Development Team"'
]



# Matches #
matches [

# Developed by footer
{ :text=>'<div id="divider">Developed By <a href="http://www.uniformserver.com/">The Uniform Server Development Team</a></div>' },

# Meta Description # The version number is a lie
{ :text=>'<meta name="Description" content="The Uniform Server 8.1.0-Coral." />' },

# Version Detection # Heading
{ :version=>/<p style=" font-size:24px; margin: 0px; padding-top:10px">\s+The Uniform Server <br \/>\s+([^\s]+)\s+<\/p>/ },

# Logo HTML
{ :text=>'<div id="header"><a href="http://www.uniformserver.com"><img src="images/logo.jpg" align="left" alt="The Uniform Server" /></a>' },

]

end

