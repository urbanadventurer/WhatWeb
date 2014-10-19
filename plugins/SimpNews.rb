##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "SimpNews" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.2"
description "Simply a News system"
website "http://www.boesch-it.de/"

# Google results as at 2010-07-11 #
# 79 for "powered by SimpNews"

# Dorks #
dorks [
'"powered by SimpNews"'
]



# Matches #
matches [

# Meta Generator
{ :version=>/<meta name="generator" content="SimpNews v([\d\.]+), \(c\)[\d]{4}[\-,]*[\d]{4} by Boesch EDV-Consulting"[^>]*>/ },

# Admin Panel
{ :version=>/ href="http:\/\/www.boesch-it.de[\/]*">SimpNews<\/a> V([\d\.]+) &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/div>/ },

# Powered by text link
{ :version=>/<br>Powered by <a class="copyright" target="_blank" href="http:\/\/www.boesch-it.de">SimpNews<\/a> V([\d\.]+) &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/font><\/td><\/tr><\/table><\/td><\/tr><\/table><\/div>/ },

# Powered by text
{ :version=>/<br>Powered by SimpNews V([\d\.]+) &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/font><\/td><\/tr><\/table><\/td><\/tr><\/table><\/div>/ },

]

# Passive #
def passive
	m=[]

	# cookie
        m << { :name=>"simpnews[lastvisit] Cookie" } if @headers["set-cookie"] =~ /simpnews\[lastvisit\]=/

	# Return passive matches
        m

end

end


