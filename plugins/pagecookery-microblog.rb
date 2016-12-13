##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PageCookery-Microblog" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "Blog [Chinese]"
website "http://www.pagecookery.com/"

# Google results as at 2011-03-06 #
# 384 for "Powered by PageCookery Microblog"

# Dorks #
dorks [
'"Powered by PageCookery Microblog"'
]



# Matches #
matches [

# Version detection # Powered by footer
{ :version=>/Powered by <a href="http:\/\/pagecookery.com\/" target="_blank">PageCookery<\/a> Microblog ([\d\.]{1,5})/ },

]

end


