##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ikonboard" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "PHP powered forum - Homepage [offline] : http://www.ikonboard.com"

# Google results as at 2011-03-17 #
# 238 for "Powered by Ikonboard" ext:cgi

# Dorks #
dorks [
'"Powered by Ikonboard" ext:cgi'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- iB Copyright Information -->' },

# Version Detection # Powered by link # 3.x
{ :version=>/Powered by <a href="http:\/\/www.ikonboard.com" class="copyright" target='_blank'>Ikonboard<\/a> ([^\s]+) &copy; 20[\d]{2} <a href='http:\/\/www.ikonboard.com' target='_blank'>Ikonboard<\/a>/ },

# Version Detection # Powered by link # 2.x
{ :version=>/Powered by <a href="http:\/\/www.ikonboard.com">Ikonboard v([^<]+)<\/a><br>&copy; 20[\d]{2} Ikonboard.com/ },

# Powered by text # printpage.cgi
{ :regexp=>/<\/td><\/tr><\/table><center><hr><p>[^<]+ [P|p]owered by Ikonboard<br>http:\/\/www.ikonboard.com<br>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="GENERATOR" content="Ikonboard ([^"]+)">/ },

# Error Page # HTML Tag Pattern
{ :certainty=>75, :tagpattern=>"h1,/h1,pre,/pre,p,a,/a,/p" },

]

end


