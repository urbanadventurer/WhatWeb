##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WikiWebHelp" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "wikiWebHelp - Client side is pure Javascript using mostly original code. Backend is PHP. Database is mySQL. Wiki conversion by Wiky.  Diff processing by simpleDiff."
website "http://richardbondi.net/projects.html"

# 8 results for "powered by WikiWebHelp" @ 2010-10-14

# Dorks #
dorks [
'"powered by WikiWebHelp"'
]



matches [

# Default logo HTML
{ :text=>'style="float:left;"><img src="theme/default/images/wh32.png"' },

# Default JavaScript
{ :text=>'<script type="text/javascript" language="javascript" src="script/wicky/wiky.js" ></script>' },

# Favicon
{ :md5=>'18fe76b96d4eae173bf439a9712fa5c1', :url=>'favicon.ico' }

]

end

