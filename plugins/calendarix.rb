##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-10 #
# Updated version detection
##
Plugin.define "Calendarix" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.2"
description "Calendarix is a powerful and easy to use web-based calendar that runs on PHP and MySQL."
website "http://www.calendarix.com/"

# 14 results for "powered by Calendarix" @ 2010-09-18
# 45 results for intitle:"Calendarix User Login" intext:"Calendarix User Login" +Username +Password @ 2010-09-18

# Dorks #
dorks [
'intitle:"Calendarix User Login" intext:"Calendarix User Login" "Username" "Password"',
'"powered by Calendarix"'
]



# Matches #
matches [

	# Powered by text
	{ :regexp=>/powered by <a[^>]*http:\/\/www.calendarix.com[^>]+>Calendarix<\/a>/i },

	# Default javascript
	{ :text=>"  default : { window.location.href='calendar.php?op=cal&month=9&year=2010&catview=0' ; break;}" },
	{ :text=>"var url = 'cal_popup.php?op=view&id='+event+'&uname=' ;" },

	# Default logo
	{ :md5=>"24dde98839b19e595532bb92d99f356a", :path=>"images/calendarix.gif" },

	# Default title
	{ :text=>"<title>Calendarix User Login</title>" },

	# Version Detection # Logo alt text
	{ :version=>/<img src="images\/calendarix.gif" Alt="About Calendarix ([\d\.a-z]+)" border=0 width=88 height=31  \/>/ },

]

end


