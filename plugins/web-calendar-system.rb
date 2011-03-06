##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Web-Calendar-System" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-15
version "0.2"
description "web calendar system"

# Google results as at 2010-06-15 #
# 18,000,000 for +intitle:"Web Calendar system v" inurl:.asp

# Examples #
examples %w|
www.southforkwatershed.org/Calendar/calendar.asp
www.quispamsis.ca/calendar/sample2.asp
www.puregamesinc.com/cr/calendar/calendar.asp
www.lawndalecity.org/html/Calendar/CALENDAR_PRINT.asp
www.getnewlife.org/calendar/calendar.asp
www.ententefloralecardiff.eu/eventscalendar/CALENDAR_PRINT.asp
www.frazierparkonline.com/calendar/CALENDAR.ASP
onebusiness.com/calendar/main/CALENDAR_PRINT.asp
www.1bc.net/calendar/main/CALENDAR_PRINT.asp
www.boosnet.com/calendario/CALENDAR_PRINT.asp
www.theambiancespa.com/calendar/calendar.asp
www.gopeaches.com/calendar/CALENDAR_PRINT.asp
www.quispamsis.ca/calendar/sample2.asp
www.tayc.com/calendar/calendar.asp
www.sngoc.org/calendar/main/CALENDAR_PRINT.asp
www.puregamesinc.com/cr/calendar/calendar.asp
www.lawndalecity.org/html/calendar/CALENDAR_PRINT.asp
www.slpcommunity.com/calendar/CALENDAR_PRINT.asp
sahomeschool.com/wci/calendar/CALENDAR.ASP
earleofleinster.com/calendar/calendar_print.asp
www.akka.com/calendar/main/CALENDAR_PRINT.asp
www.mossbacks.org/calendar/CALENDAR_PRINT.asp
www.onebusinessconnection.com/calendar/main/CALENDAR_PRINT.asp
www.cardiff.info/eventscalendar/CALENDAR_PRINT.asp
www.boosnet.com/calendario/CALENDAR_PRINT.asp
|

# Matches #
matches [

# GHDB Match
{ :certainty=>25, :ghdb=>'+intitle:"Web Calendar system v" inurl:.asp' },

# Version Detection # Default Title
{ :version=>/<TITLE>Web Calendar system v ([\.\d]+)<\/TITLE>/ },

]

end

