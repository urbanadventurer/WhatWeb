##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-04-12 #
# Updated regex
##
# Version 0.2 #
# Fixed regex and ghdb matches
##
Plugin.define "JAMM-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.2"
description "JAMM CMS"
website "http://www.branchen-plz.de/"

# Google results as at 2010-08-08 #
# 6 for "powered by JAMM CMS"

# Dorks #
dorks [
'"powered by JAMM CMS"'
]



# Matches #
matches [

# GHDB # Powered by text
{ :ghdb=>'"powered by JAMM CMS"', :certainty=>75 },

# Powered by link
{ :regexp=>/<a[^>]+href="http:\/\/jammcms\.jamm-media\.de\?ref=[^>]+>powered by JAMM CMS/i },

# Meta author
{ :text=>"<META NAME='Author' CONTENT='JAMM MEDIA Technologies Team 2005'>" },
{ :text=>"<META NAME=   'author' CONTENT='JAMM MEDIA Team 2001'>" },

# HTML comment
{ :text=>'<!--- Content Management System JAMM CMS OWEN - Visit www.jamm-media.de for more informations -->' },

]

end

