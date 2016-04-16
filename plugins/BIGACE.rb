##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BIGACE" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "BIGACE is not just an easy to use Web Content Management System (CMS), but offers also a scripting API and an extensible architecture for developing, maintaining, and deploying applications."
website "http://www.bigace.de/"

# Google results as at 2011-03-15 #
# 344 for "Powered by BIGACE" -dork

# Dorks #
dorks [
'"Powered by BIGACE" -dork'
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.bigace.de/" target="_blank">BIGACE</a>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.bigace.de\/"[^>]*>BIGACE ([\d\.]+)<\/a>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="BIGACE ([\d\.]+)"( \/)?>/ },

# Version Detection # HTML Comment
{ :version=>/<!--[\r\n][\r\n]   Site is running BIGACE ([\d\.]+) [\r\n]        a PHP based Web CMS for MySQL[\r\n]             \(C\) Kevin Papst \(www.bigace.de\)[\r\n]/ },

]

end


