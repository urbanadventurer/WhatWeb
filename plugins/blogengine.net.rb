##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BlogEngine_NET" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.1"
description "BlogEngine.NET is an open source .NET blogging project that was born out of desire for a better blog platform. A blog platform with less complexity, easy customization, and one that takes advantage of the latest .NET features."
website "http://www.dotnetblogengine.net/"

# Google results as at 2011-03-04 #
# 483 for "Powered by BlogEngine.NET"

# Dorks #
dorks [
'"Powered by BlogEngine.NET"'
]



# Matches #
matches [

# Default Favicon HTML
{ :text=>'<link rel="shortcut icon" href="pics/blogengine.ico" type="image/x-icon" />' },

# Powered by text
{ :regexp=>/Powered by[\r\n\s]*<a href="http:\/\/www.dotnetblogengine.net[\/]?"[^>]*>BlogEngine.NET<\/a>/ },

# Version Detection # Powered by text
{ :version=>/Powered by[\r\n\s]*<a href="http:\/\/www.dotnetblogengine.net[\/]?"[^>]*>BlogEngine.NET<\/a>[\r\n\s]*([\d\.]+)/ },

]

end


