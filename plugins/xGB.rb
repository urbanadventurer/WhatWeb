##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "xGB" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.2"
description "xGB guestbook"
website "http://www.x-gfx.de/"

# Google results as at 2010-08-14 #
# 126 for allinurl:"xGb.php"

# Dorks #
dorks [
'allinurl:"xGb.php"'
]



# Matches #
matches [

{ :text=>'	<title>xGB</title>' },
{ :text=>'<!-- start xGB dynamic content -->' },
{ :text=>"powered by <a href='http://www.x-gfx.de' target='blank' title='Script by x-gfx.de'>xGB" },

# Version Detection # Powered by footer text
{ :version=>/<p align='center'><span id='copyright'>\[ powered by <a href='http:\/\/www.x-gfx.de' target='blank' title='Script by x-gfx.de'>xGB ([\d\.]+)<\/a>/ },

]

end

