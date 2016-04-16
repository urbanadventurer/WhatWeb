##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MetInfo" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-26
version "0.1"
description "MetInfo"
website "http://www.metinfo.cn/"

# Google results as at 2011-02-26 #
# 409 for "Powered by MetInfo"

# Dorks #
dorks [
'"Powered by MetInfo"'
]



# Matches #
matches [

# Meta Copyright
{ :regexp=>/<meta name="copyright" content="Copyright 2008-20[\d]{2} MetInfo">/ },

# Meta Author
{ :regexp=>/<meta name="author" content="[^"]+--Powered by MetInfo">/ },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.MetInfo.cn" target="_blank" title="MetInfo enterprise website manager system"><b>[^<]+<\/b><\/a> ([\d\.]+)/ },

]

end


