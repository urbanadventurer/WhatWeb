# coding: ascii-8bit
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BM-Classifieds" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "A complete classifieds site ready to run in 15 minutes."
website "http://www.bmscripts.com/"

# Dorks #
dorks [
'"powered by BM Classifieds"'
]

# 97 results for "powered by BM Classifieds" @ 2010-08-08


matches [

{ :text=>'<!-- // All source code on this site © 2007 BM Scripts unless otherwise stated - All Rights Reserved // -->' },
{ :text=>'<!-- // All source code on this site © 2007 BM Scripts unless otherwise noted - All Rights Reserved // -->' },
{ :text=>'		<!-- START HEADER TABLE - HOLDS GRAPHIC AND SITE NAME -->' },
{ :text=>'		<!-- START MAIN TABLE - HOLDS CATEGORIES, MENU, ETC. -->' },
{ :text=>"	<p class='credits'><a href='http://www.bmscripts.com'>Powered by BM Classifieds</a><br /></p>" },
{ :text=>"	<p class='credits'>Powered by BM Classifieds<br /></p>" },

]

end

