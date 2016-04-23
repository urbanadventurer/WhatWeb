##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Squarespace" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "A fully hosted, completely managed environment for creating and maintaining a website, blog or portfolio."
website "http://www.squarespace.com/"

# Google results as at 2011-03-03 #
# 116 for "This site is completely powered by the Squarespace platform."



# Matches #
matches [

# Powered by text
{ :certainty=>75, :text=>"This site is completely powered by the Squarespace platform." },

# Default JavaScript
{ :text=>'new Squarespace.FixedPositionTip("Logout Successful", "You have been successfully logged out.", { xMargin: 15, yMargin: 15, icon: "/universal/images/helptip-info.png", orientation: "upper-right", viewportFixed: true, autoHide: 1800 }).show();' },

# favicon.ico
{ :url=>"favicon.ico", :md5=>"89cc5689b952ee12d13a68e98119183f" },

]

end


