##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name
# Version 0.3
# Uses :version=>//

Plugin.define "SquirrelMail" do
author "Andrew Horton"
version "0.3"
description "Opensource Webmail written in PHP"
website "http://squirrelmail.org"

# tends to get customised

matches [
{:name=>"default title", :text=>"<title>SquirrelMail - Login</title>"},
{:name=>"js function", :text=>"function squirrelmail_loginpage_onload()"},
{:name=>"css comment", :text=>'/* avoid stupid IE6 bug with frames and scrollbars */'},
{:text=>'<b>SquirrelMail Login</b>'},
{:version=>/<(small|SMALL)>SquirrelMail version ([^<]+)</, :offset=>1,  :name=>"version" } 
]

# <SMALL>SquirrelMail version 1.2.7<BR>
# <small>SquirrelMail version 1.4.4<
# <small>SquirrelMail version 1.4.9a<br />
def passive
	m=[]
	
	# Set-Cookie: SQMSESSID=5055d75dbcac067f72b509effc42cc50; path=/
	m << {:name=>"SQMSESSID cookie" } if @headers["set-cookie"] =~ /SQMSESSID=/i		
	m
end


end

