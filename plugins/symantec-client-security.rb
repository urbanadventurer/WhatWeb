##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Symantec-Client-Security" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-19
version "0.1"
description "Symantec Client Security"
website "http://www.symantec.com"

# Google results as at 2011-11-19 #
# 46 for intitle:"Web Deployment Tool" "This browser does not support FRAMESET. Please use Internet Explorer"

# Dorks #
dorks [
'intitle:"Web Deployment Tool" "This browser does not support FRAMESET. Please use Internet Explorer"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- Symantec Client Security Web Based Installation -->' },

# Year Detection # Meta Copyright
{ :certainty=>75, :string=>/<META NAME="Copyright" Content="Copyright (20[\d]{2}) Symantec Corporation">/ },

]

end

