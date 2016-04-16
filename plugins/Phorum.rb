##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Phorum" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-25
version "0.1"
description "Phorum - Forum - Requires PHP and MySQL"
website "http://www.phorum.org/"

# Google results as at 2011-10-25 #
# 364 for "This forum is powered by Phorum."

# Dorks #
dorks [
'"This forum is powered by Phorum."'
]



# Matches #
matches [

# Powered by link
{ :regexp=>/powered by <a href="http:\/\/www\.phorum\.org\/"( target="_blank")?>Phorum<\/a>\./ },

# HTML Comment
{ :certainty=>75, :text=>'<!-- end of div id=user-info -->' },

]

end

