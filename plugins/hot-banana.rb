##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Hot-Banana" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "Hot Banana is an award-winning, easy-to-use Web Content Management System (Web CMS) that helps marketers build and manage SEO-friendly Web sites that can be automated and optimized for maximum lead generation and conversion performance."
website "http://www.hotbanana.ca/"

# Google results as at 2011-03-03 #
# 42 for "powered by hot banana"

# Dorks #
dorks [
'"powered by hot banana"'
]



# Matches #
matches [

# GHDB Match
{ :certainty=>75, :ghdb=>'"Powered by Hot Banana"' },

# Default JavaScript
{ :text=>'					var hbac_regFileTypes = new RegExp("\s*.(pdf|swf|gif|jpg|jpeg|jpe|xls|ppt|doc|mp3|txt|wav)");' },

# Default Logo HTML
{ :text=>'<div align="right"><img src="Images/hblogo.gif" width="49" height="28" border="0" alt="Powered By Hot Banana" /></div>' },

]

end


