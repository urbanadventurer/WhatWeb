##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CalendarScript" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "CalendarScript is a fully customizable event-publishing solution. It gives you everything you'll need to begin, then gives you the power to redefine it to fit your specific needs."
website "http://www.calendarscript.com/"

# Google results as at 2011-03-19 #
# 401 for "Powered by CalendarScript"
# 32 for inurl:calendar_admin.pl intitle:"Calendar Administration : Login"
# 10 for "Powered by CalendarScript" inurl:calendar_admin.pl intitle:"Calendar Administration : Login"
# 9 for "CGISession: Session file" "could not be opened for writing!"

# Dorks #
dorks [
'"Powered by CalendarScript"',
'inurl:calendar_admin.pl intitle:"Calendar Administration : Login"',
'"Powered by CalendarScript" inurl:calendar_admin.pl intitle:"Calendar Administration : Login"',
'"CGISession: Session file" "could not be opened for writing!"'
]



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
			m << { :filepath=>body.scan(/^Month '-1' out of range 0\.\.11 at ([^\n^<]+) <a href="#error">line [\d]+<\/a>\.$/).flatten } if body =~ /^Month '-1' out of range 0\.\.11 at ([^\n^<]+) <a href="#error">line [\d]+<\/a>\.$/

		end

	end

	# Return aggressive matches
	m
end

end


