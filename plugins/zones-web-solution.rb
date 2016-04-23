##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zones-Web-Solution" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "This plugin identifies websites designed by Zones Web Solution"
website "http://www.zones.in/"

# Google results as at 2011-07-27 #
# 16 for "Powered By : Zones Web Solution" "inurl:index.php?manufacturers_id="

# Dorks #
dorks [
'"Powered By : Zones Web Solution" "inurl:index.php?manufacturers_id='
]



# Matches #
matches [

# Meta Author
{ :text=>'<meta name="author" content="Vikas Madaan (http://madaan.zones.in) - Zones Web Solution (www.zones.in), Visit http://www.zones.in for more info">' },

# Powered by link
{ :text=>'<br>Powered by : <a href="http://www.zones.in" target="_blank">Zones Web Solution</a> &amp;' },

]

end

