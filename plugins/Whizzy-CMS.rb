##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-18 #
# Updated version detection
##
Plugin.define "Whizzy-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.2"
description "Whizzy-CMS"
website "http://unverse.net/"

# Google results as at 2010-09-18 #
# 37 for "powered by Whizzy CMS"



# Matches #
matches [

# Version Detection # HTML comment
{ :version=>/Powered by Whizzy CMS <big>&spades;<\/big> <\/a><\/div><!-- \[Whizzy CMS:Whizzy CMS ([^\]]+)/ },

]

end

