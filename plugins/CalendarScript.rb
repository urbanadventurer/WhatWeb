##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CalendarScript" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "CalendarScript is a fully customizable event-publishing solution. It gives you everything you'll need to begin, then gives you the power to redefine it to fit your specific needs. - Homepage: http://www.calendarscript.com/"

# Google results as at 2011-03-19 #
# 401 for "Powered by CalendarScript"
# 32 for inurl:calendar_admin.pl intitle:"Calendar Administration : Login"
# 10 for "Powered by CalendarScript" inurl:calendar_admin.pl intitle:"Calendar Administration : Login"
# 9 for "CGISession: Session file" "could not be opened for writing!"

# Examples #
examples %w|
www.calendarscript.com/demo/calendar_admin.pl
weakleycountytn.gov/cgi-bin/calendar.pl?calendar=countycalendar
www.rcmforjesus.org/cgi-bin/calendar_admin.pl
www.liwomen.com/cgi-bin/LIWcalendar/calendar_admin.pl
www.chapelhilljaycees.org/cgi-bin/calendar_admin.pl
vamason.org/cgi-bin/cs/calendar_admin.pl
www.rochestergerman.com/cgi-bin/calendar_admin.pl
www.observingstars.com/cgi-bin/calendar/calendar_admin.pl
www.mediasourcewichita.com/cgi-bin/calendar_admin.pl
archive.enigmata.org/calendar/calendar_admin.pl
www.q-m.se/cgi-bin/calendar_admin.pl
www.rcmforjesus.org/cgi-bin/calendar_admin.pl
www.powellbuttecommunitycenter.com/cgi-bin/calendar_admin.pl
www.lucpgh.com/calendar/calendar_admin.pl
www.harrispavilion.com/cgi-bin/calendar_admin.pl
www.whitney-fan.com/nr/cldr/new/calendar_admin.pl
www.unit5.org/cgi-bin/Lunch-Sub/calendar_admin.pl
www.cincycalendar.com/cgi-bin/calendar/calendar_admin.pl
www.lafayette-online.com/cgi-bin/calendar_admin.pl
www.federalhouserestaurant.com/cgi-bin/party/calendar_admin.pl
www.liwomen.com/cgi-bin/LIWcalendar/calendar_admin.pl
www.usdfregion4.org/Calendar/calendar_admin.pl
www.op2vbc.com/calendar_admin.pl
www.whisperingpinesretirementvillage.com/cal/calendar_admin.pl
www.tahomaclub.com/cgi-bin/calendar_admin.pl
learn2skate.ca/cgi-bin/calendar_admin.pl
www.chapelhilljaycees.org/cgi-bin/calendar_admin.pl
www.angelicministries.com/cgi-bin/calendar321/calendar_admin.pl
www.mendocinocoast.com/cgi-bin/mendocinocoast/calendar/calendar_admin.pl
vamason.org/cgi-bin/cs/calendar_admin.pl
www.myoan.net/cgi-bin/calendar_admin.pl
beniciasoccer.org/calendar/calendar_admin.pl
www.rochestergerman.com/cgi-bin/calendar_admin.pl
lakemichiganhomeswi.com/cgi-bin/calendar_admin.pl
www.observingstars.com/cgi-bin/calendar/calendar_admin.pl
www.castroonline.com/cgi-bin/calendar/calendar_admin.pl
www.wachapreague.com/cgi-bin/events/calendar_admin.pl
thoseladylions.org/cgi-bin/calendar_admin.pl
www.mediasourcewichita.com/cgi-bin/calendar_admin.pl
www.dumbaaldum.org/cgi-bin/calendar/calendar_admin.pl
archive.enigmata.org/calendar/calendar_admin.pl
www.q-m.se/cgi-bin/calendar_admin.pl
seattlecentral.edu/library/cgi-bin/calendar.pl
www.unit5.org/cgi-bin/Lunch-Sub/calendar_admin.pl
www.ocean.edu/cgi-bin/calendarscript/calendar.pl
www.chem.umn.edu/events/
www.midland.edu/cgi-bin/calendar.pl
www.washcoll.edu/cgi-bin/calendar.pl
www.irp.wisc.edu/cgi-bin/irp/calendar.pl
research.mmb.usyd.edu.au/calp
www.clean.cise.columbia.edu/cgi-bin/calendar.pl
|

# Matches #
matches [

# GHDB # Admin Page # filename and title
{ :certainty=>75, :ghdb=>'inurl:calendar_admin.pl intitle:Calendar Administration : Login' },

# GHDB # filename and powered by
{ :certainty=>75, :ghdb=>'powered by CalendarScript inurl:calendar.pl filetype:pl' },

# Admin Page # Title
{ :text=>'<HEAD><TITLE>Calendar Administration : Login</TITLE>' },

# Admin Page # Local File Path Detection # Error String
{ :filepath=>/<FONT COLOR="red">CGISession: Session file \[([^\]]+)\] could not be opened for writing!<BR><\/FONT>/ },

# Admin Page # Powered by link
{ :text=>'<FONT color="#FFFFFF" SIZE="-1">Powered by <A HREF="http://www.CalendarScript.com/" STYLE="color:#FFFFFF;">CalendarScript</A></FONT>' },

# Powered by link
{ :text=>'Powered by <A HREF="http://www.CalendarScript.com/" CLASS="footertext" STYLE="text-decoration:underline;">CalendarScript</A>' },

]

# Aggressive #
def aggressive
	m=[]

	# Local File Path Detection # Find application base path
	if @base_uri.path =~ /^[^\n]*\/(calendar_admin\.pl|calendar\.pl)/i

		# Generate Random String
                random_string=rand(36**6).to_s(36)

		# Detect /calendar.pl or /calendar_admin.pl
		target_url = @base_uri.path.scan(/^([^\n]*\/)(calendar_admin\.pl|calendar\.pl)/i)[0][0].to_s+"calendar.pl?year="+random_string

		# Open application base url + "?year=" + random string
		unless target_url.nil?

			target = URI.join(@base_uri.to_s,target_url).to_s
			status,url,ip,body,headers=open_target(target)

			# Extract local file path
			m << { :filepath=>body.scan(/^Month '-1' out of range 0\.\.11 at ([^\n^<]+) <a href="#error">line [\d]+<\/a>\.$/) } if body =~ /^Month '-1' out of range 0\.\.11 at ([^\n^<]+) <a href="#error">line [\d]+<\/a>\.$/

		end

	end

	# Return aggressive matches
	m
end

end


