##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "openEngine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-02
version "0.1"
description "openEngine - Content Management System (CMS)"
website "http://www.openengine.de/"

# ShodanHQ results as at 2011-10-02 #
# 71 for "CMS by openEngine"
# 47 for inurl:"cms/openengine" intitle:"openEngine"
# 26 for inurl:"admin=login" "Open Source Web Content Management System"
# 16 for inurl:"cms/website.php?id=" inurl:"admin=login"

# Dorks #
dorks [
'inurl:"cms/openengine" intitle:"openEngine"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- openEngine Comment START -->' },

# lt/lte IE7 confitional HTML Comment
{ :regexp=>/<!--\[if lte? IE 7\]>[\s]+<script src="system\/([^\/^>]+\/)*script\/IE7\/ie7-standard-p\.js" type="text\/javascript"><\/script>/ },

# Version Detection # Admin Page
{ :version=>/<p class="adminText" style="font-size:9px;">[\s]+openEngine ([^\s]+)( - [\d]+)? - Open Source Web Content Management System<br>/ },

# Logo HTML
{ :regexp=>/<a href="http:\/\/www\.openengine\.de" target="_blank"><img src="system\/([^\/^>]+\/)*\/img\/oes_logo\.png" alt="openEngine Homepage"><\/a><\/p>/ },

]

end

