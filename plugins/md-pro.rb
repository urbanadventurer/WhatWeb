##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated version detection
# Renamed from MAXdev to MD-Pro
##
Plugin.define "MD-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.2"
description "MaxDev is proud to introduce MD-Pro, the most complete, flexible and reliable CMS available on the market."
website "http://www.maxdev.com/AboutMD.phtml"

# Google results as at 2010-08-28 #
# 64 for "powered by MAXdev"

# Dorks #
dorks [
'"powered by MAXdev"'
]



# Matches #
matches [

# DB Error page
{ :text=>'<a href="language/eng/dbfail.html" style="text-decoration: none;">MAXdev - Problem in Database Connection: click here to read more...</a>' },

# Powered by text
{ :text=>'<a href="http://www.maxdev.it" target="_blank">Powered by MAXDev</a>' },
{ :regexp=>/<div class="poweredtext"><a href="javascript:opencredits\(\)">Credit(i|s)<\/a> <a href="http:\/\/www.maxdev(.it|italia.com)">Powered by MAXdev<\/a><\/div>/ },

# HTML comments
{ :text=>'************** MAXdev - MAXdev (http://www.maxdev.it) ***********' },
{ :text=>'************** MAXdev - MAXdev (http://www.maxdev.com) ***********' },

# Default logo
{ :md5=>'0caf204c07776c652de251a1eb74447a', :url=>'images/logo.gif' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="MAXdev ([\d\.]+) - http:\/\/www.maxdev.(com|it)">/ },

]

end

