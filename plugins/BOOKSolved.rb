##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BOOKSolved" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-16
version "0.1"
description "BOOKSolved - guestbook script"
website "http://www.usolved.net/scripts_9.html"

# Google results as at 2011-10-16 #
# 297 for +BOOKSolved "by USOLVED"
# 172 for +BOOKSolved "by USOLVED" inurl:"booksolved.php"

# Dorks #
dorks [
'"BOOKSolved" "by USOLVED" inurl:"booksolved.php"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- BOOKSolved - Copyright by www.usolved.net -->' },

# Version Detection # HTML Comment
{ :version=>/<!-- BOOKSolved v([^\s]+)- Copyright by www\.usolved\.net -->/ },

# Version Detection # Footer
{ :version=>/<tr><td style="text-align: center;">[\s]*BOOKSolved ([^\s]+) &copy; by <a href="http:\/\/www\.usolved\.net" (target="_blank" )?class="menu">USOLVED<\/a>/ },

]

end

