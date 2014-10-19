##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Xataface" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-10
version "0.1"
description "Xataface is a full-featured Web application framework. It automatically generates the appropriate forms, lists, and menus for a user to interact with a MySQL database without having to know any SQL."
website "http://xataface.com/"

# Google results as at 2011-09-10 #
# 50 for "Powered by Xataface" inurl:"-table"

# Dorks #
dorks [
'"Powered by Xataface" inurl:"-table"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- custom javascripts can go in slot "custom_javascripts" -->' },
{ :text=>'<!-- Place any other items in the head of the document by filling the "head_slot" slot -->' },

# Year Detection # div class="fineprint"
{ :string=>/<div class="fineprint">[\s]+Powered by Xataface<br\/>[\s]+\(c\) 2005-(20[\d]{2}) All rights reserved<\/div>/ },

]

end

