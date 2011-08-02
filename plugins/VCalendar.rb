##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VCalendar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-03
version "0.1"
description "VCalendar is an open source Web calendar application for posting and maintaining events and schedules online. A free solution for use by online Web communities and any commercial and non-commercial organizations, available in PHP, ASP, C# and VB.NET. - Homepage: http://sourceforge.net/projects/virtualcalendar/"

# Google results as at 2011-08-03 #
# 44 for "powered by VCalendar" inurl:event_view.php?event_id=

# Dorks #
dorks [
'"powered by VCalendar" inurl:event_view.php?event_id='
]

# Examples #
examples %w|
www.glastonburyabbey.org/eventcalendar/event_view.php
www.gema-hoyas.org/vcalendar/event_view.php
www.clevelandhabitat.org/vcalendar/event_view.php
www.meredithnh.org/vcalendar/event_view.php
www.spokanesporthorse.com/vcalendar/event_view.php
www.usd116.org/vcalendar/event_view.php
citrussewandvac.com/calendar/event_view.php
www.kingdomchurch.net/calendar/event_view.php
www.jacquesandtheshakeyboys.com/vcalendar/event_view.php
www.junglefortress.co.uk/vcalendar/event_view.php
www.antwerpskiteam.be/vcalendar/event_view.php
bsa-troop279.org/vcalendar/event_view.php
www.waterberg.biz/events/event_view.php
cal.wingtsjun.com/event_view.php
getmichaeltaggert.com/eventCal/event_view.php
www.godt7.dk/vcalendar/event_view.php
koberjam.cz/vcalendar/event_view.php
www.ganzheitliches-zentrum.de/kalender/event_view.php
halmstadbibliotek.nu/kalender/event_view.php
|

# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.vcalendar.org">VCalendar</a>' },

# link href="Styles/Basic/Style.css"
{ :certainty=>75, :text=>'<link href="Styles/Basic/Style.css" type="text/css" rel="stylesheet"></head>' },

]

end

