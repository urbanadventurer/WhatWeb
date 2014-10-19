##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VCalendar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-03
version "0.1"
description "VCalendar is an open source Web calendar application for posting and maintaining events and schedules online. A free solution for use by online Web communities and any commercial and non-commercial organizations, available in PHP, ASP, C# and VB.NET."
website "http://sourceforge.net/projects/virtualcalendar/"

# Google results as at 2011-08-03 #
# 44 for "powered by VCalendar" inurl:event_view.php?event_id=

# Dorks #
dorks [
'"powered by VCalendar" inurl:event_view.php?event_id='
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.vcalendar.org">VCalendar</a>' },

# link href="Styles/Basic/Style.css"
{ :certainty=>75, :text=>'<link href="Styles/Basic/Style.css" type="text/css" rel="stylesheet"></head>' },

]

end

