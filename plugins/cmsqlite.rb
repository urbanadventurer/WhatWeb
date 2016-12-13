##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CMSQLite" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "CMSQLite is a small, fast, flexible and complete Content-Management-System (CMS). "
website "http://cmsqlite.net/"

# Google results as at 2010-07-18 #
# 25 results for "powered by CMSQLite"

# Dorks #
dorks [
'"powered by CMSQLite"'
]



matches [

{ :text=>'<div id="cmsqliteFooter"><span id="anchorFooter"><a href="http://www.cmsqlite.net" target="_blank">powered by CMSQLite</a></span></div></body></html>' },

{ :text=>'<meta name="generator" content="www.CMSQLite.net by www.Netzabdruck.de" />' },

]


end

