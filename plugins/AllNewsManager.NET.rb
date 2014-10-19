##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AllNewsManager_NET" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.1"
description "AllNewsManager.NET is a free news/article management system for ASP.NET sites."
website "http://www.allnewsmanager.net/allnewsmanager/homepage.aspx"

# Google results as at 2011-03-04 #
# 80 for "Powered by AllNewsManager.NET"

# Dorks #
dorks [
'"Powered by AllNewsManager.NET"'
]



# Matches #
matches [

# Powered by text
{ :regexp=>/(kujeme|Powered by) <a id="[^"]+" href="http:\/\/www.allnewsmanager.net">AllNewsManager.NET<\/a>/ },

]

end


