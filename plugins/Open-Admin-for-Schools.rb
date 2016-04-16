##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Open-Admin-for-Schools" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-31
version "0.1"
description "Open Admin for Schools is a School Administration Program."
website "http://richtech.ca/openadmin/"

# Google results as at 2011-08-31 #
# 8 for intitle:"Open Admin for Schools" "Open Admin for Schools" "Les Richardson" Main Attendance Discipline Fees Report Cards Timetable Export/Xfer Start/End of Year Help

# Dorks #
dorks [
'intitle:"Open Admin for Schools" "Open Admin for Schools" "Les Richardson" Main Attendance Discipline Fees Report Cards Timetable Export/Xfer Start/End of Year Help'
]



# Matches #
matches [

# Version Detection # Title
{ :version=>/<html><head>[\s]+<title>Open Admin for Schools ([^\s]+) - [^<]+<\/title>/ },

# Version Detection # [version] by Les Richardson
{ :version=>/<tr><th style="padding:0.3em;"><span style="font-size: 120%;">[\s]+Open Admin for Schools ([^\s]+)<\/span> [^<]+ Les Richardson<\/th><\/tr>[\s]+<\/table>/ },

# Form HTML
{ :text=>'<form action="/cgi-bin/rptbirthday.pl" method="post" style="display:inline;">' },

# HTML Comments
{ :text=>'</h2><!--  === Report Section ===  -->' },
{ :text=>'<!-- End of Student Reports Section -->' },
{ :string=>/<!--[\s]+#  Copyright 2001-(20[\d]{2}) Leslie Richardson[\s]+#  This file is part of Open Admin for Schools\./ },

]

end

