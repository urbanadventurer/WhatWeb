##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Removed passive function and replaced with :search=>"headers[location]"
# Added the Powered by the match
# Added another version match
##
Plugin.define "Zest-Web-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.2"
description "Zest Web Engine"
website "http://www.zest-leisure.com/"

# Google results as at 2011-04-08 #
# 83 for inurl:/cgi-bin/web.asp

# ShodanHQ results as at 2011-04-08 #
# 13 for /cgi-bin/web.asp

# Dorks #
dorks [
'inurl:/cgi-bin/web.asp'
]

# Matches #
matches [
# Version Detection # Powered by logo+url+text
{ :version=>/Powered by the <br \/><img src='http:\/\/www.[^\/]+\/images\/zestlogo\.gif' style='border:0 ; ' alt='Zest Web Engine' \/><br \/>Zest web engine<br \/>V([\d\.]+)<br \/>/ },
{ :search=>"headers[location]", :text=>"/cgi-bin/web.asp?title"},
{ :text=>"Powered by the <a href='http://www.zest-leisure.com/'>Zest Web Engine</a>"},
{ :version=>/Powered by the <a href='http:\/\/www.zest-leisure.com\/'>Zest Web Engine<\/a>[ ]+V ([0-9\.]+)</}

]

end
