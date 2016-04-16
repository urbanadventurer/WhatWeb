##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex and version detection
##
Plugin.define "Advanced-Image-Hosting-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.2"
description "AIHS is a highly-flexible advanced image hosting solution for anyone who wants to offer an image hosting services of any kind."
website "http://yabsoft.com/aihs-feature.php"

# 2 results for "Welcome to install Advanced Image Hosting Script" @ 2010-08-30
# 1 result for "Powered by Advanced Image Hosting Script" @ 2010-08-30


matches [

# Admin page # Default CSS
{ :text=>'  .title                          { font-size: 10px; font-weight: bold; line-height: 150%; color: #FFFFFF; height: 26px; background-image: url(./tile_back.gif) }' },

# Admin page # Default title HTML
{ :text=>'    <td colspan=2 align=center><h3>Advanced Image Host Script</h3></td>' },

# Version detection # Powered by text
{ :version=>/Powered by: <B><a href="http:\/\/yabsoft.com">AIH v([\d\.]+)<\/a><\/B>/ },

# Version detection # Install page
{ :version=>/<center><b>Welcome to install AIHS Script ([\d\.]+)<\/b><\/center>/ },
{ :version=>/<tr><td class=info width=100%>Welcome to install Advanced Image Hosting Script Pro ([\d\.]+) on your server<\/td><\/tr>/ },

]

end

