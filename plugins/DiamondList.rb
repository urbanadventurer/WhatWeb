##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DiamondList" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "DiamondList is a free open source ruby on rails wishlist management program. It allows you to track one or more wishlists for one or more people, for any kind of event!"
website "http://www.hulihanapplications.com/projects/diamondlist"

# 11 results for "powered by DiamondList" @ 2010-09-18

# Dorks #
dorks [
'"powered by DiamondList"'
]



matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.hulihanapplications.com/projects/diamondlist"><b>DiamondList</b>' },

]

end

