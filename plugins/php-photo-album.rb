##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Photo-Album" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "PHP Photo Album"
website "http://www.phpalbum.net/dw"

# Google results as at 2011-11-22 #
# 456 for "Powered by PHP Photo Album"
#  49 for inurl:main.php?cmd=imageview&var1=

# Dorks #
dorks [
'"Powered by PHP Photo Album"'
]



# Matches #
matches [

# HTML Comment # Version Detection
{ :certainty=>75, :version=>/<!--phpalbum ([^\s]+) -->/ },

# StyleSheet
{ :text=>'<LINK REL="stylesheet" HREF="main.php?cmd=theme&var1=style_css" TYPE="text/css">' },

# Powered by link
{ :text=>'<font size="2">Powered by </font><a class="me" href="http://www.phpalbum.net"><font size="2">PHP Photo Album</font></a>' },

# Powered by HTML Comment
{ :text=>'<!-- <font size="2">Powered by <a class="me"href="http://www.phpalbum.net">PHP Photo Album</font></a> -->' },

]

end

