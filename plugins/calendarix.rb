##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Calendarix" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Calendarix is a powerful and easy to use web-based calendar that runs on PHP and MySQL. - homepage: http://www.calendarix.com/"

# 14 results for "powered by Calendarix" @ 2010-09-18
# 45 results for intitle:"Calendarix User Login" intext:"Calendarix User Login" +Username +Password @ 2010-09-18
examples %w|
www.calendarix.com/advanced/calendar.php
203.71.255.32/calendarix/
calendar.afghanhounds.biz/
calendar.euromedrights.org
dalzellumc.org/calendar/
depch.chna.edu.tw/calendarix/
stjohnpg.myftp.org/riscalendar/
wiki.schwaar.com/budokan/
www.artemis-cynthia.com/calendar/
www.cmuakpsi.org
www.corvallis.or.us/calendarix/
www.dailyxpress.net/specials/calendar/
www.iecsd.com/calendar/
www.mfhcc.org/calendarix/
www.milamcountycc.com/calendar/calendar.php
www.prep-hockey.com/Cal/
www.robertsdale.org/calendar/
|

matches [

# Powered by text
{ :regexp=>/powered by <a [^http]+http:\/\/www.calendarix.com[^>]+>Calendarix<\/a>/i },

# Default javascript
{ :text=>"  default : { window.location.href='calendar.php?op=cal&month=9&year=2010&catview=0' ; break;}" },
{ :text=>"var url = 'cal_popup.php?op=view&id='+event+'&uname=' ;" },

# Default logo
{ :md5=>"24dde98839b19e595532bb92d99f356a", :path=>"images/calendarix.gif" },

# Default title
{ :text=>"<title>Calendarix User Login</title>" },

]

# Version detection
def passive
        m=[]

	# Logo alt text
        if @body =~ /<img src="images\/calendarix.gif" Alt="About Calendarix ([\d\.a-z]+)" border=0 width=88 height=31  \/>/
                version=@body.scan(/<img src="images\/calendarix.gif" Alt="About Calendarix ([\d\.a-z]+)" border=0 width=88 height=31  \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

