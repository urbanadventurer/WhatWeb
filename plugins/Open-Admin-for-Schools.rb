##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Open-Admin-for-Schools" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-31
version "0.1"
description "Open Admin for Schools is a School Administration Program. - Homepage: http://richtech.ca/openadmin/"

# Google results as at 2011-08-31 #
# 8 for intitle:"Open Admin for Schools" "Open Admin for Schools" "Les Richardson" Main Attendance Discipline Fees Report Cards Timetable Export/Xfer Start/End of Year Help

# Dorks #
dorks [
'intitle:"Open Admin for Schools" "Open Admin for Schools" "Les Richardson" Main Attendance Discipline Fees Report Cards Timetable Export/Xfer Start/End of Year Help'
]

# Examples #
examples %w|
demo-admin.open-admin.net
demo-teacher.open-admin.net
demo-parent.open-admin.net
french.open-admin.net
french-tch.open-admin.net
french-par.open-admin.net
esdemo.open-admin.net
esdemo-tch.open-admin.net
esdemo-par.open-admin.net
serbdemo.open-admin.net
serbdemo-tch.open-admin.net
serbdemo-par.open-admin.net
khmer-admin.openadmin.ca
khmer-teacher.openadmin.ca
https://parishdemo.endofinternet.org:923/openadmin/demo/parish
www.campestreamericano.com/today/openadmin-5.50Jan30/school/admin/
www.schoolslinknigeria.com/openadmin/openadmin-4.75July18R1/school/admin/
www.penflowerinternational.com/opt/openadmin/
www.penflowerinternational.com/opt/openadmin/penflower/admin/
ciess.ca/openadmin/openadmin-3.00a/school/admin/
|

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

