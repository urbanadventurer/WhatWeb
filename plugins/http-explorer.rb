##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Http-Explorer" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-10
version "0.1"
description "Http explorer is a free easy-to-use web server with which you can share your musics, videos and images for several web displays"
website "http://http-explorer.sourceforge.net/"



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Http explorer ([^\s]+)$/ },

# Footer # Version Detection
{ :version=>/<p id="pgfooter_p_main">\s+<a href="http:\/\/http\-explorer\.sourceforge\.net\/\?lang=[^"]+">Http explorer\s+([^\s^<]+)<\/a>/ },

]

end

