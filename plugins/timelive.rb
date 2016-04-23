##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TimeLive" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-29
version "0.1"
description "TimeLive Time and Expense Tracking - TimeLive Web timesheet suite is an integrated suite for time record, time tracking and time billing software."
website "http://www.livetecs.com/"

# Google results as at 2011-09-29 #
# 19 for intitle:"TimeLive" "TimeLive LogIn" +Username +Password

# Dorks #
dorks [
'intitle:"TimeLive" "TimeLive LogIn" "Username" "Password"'
]



# Matches #
matches [

# Logo HTML
{ :text=>'<img id="CtlLogin1_Login1_imgCompanyOwnLogo" src="Images/TopHeader.jpg" alt="CompanyLogo" style="height:50px;border-width:0px;" /></td>' },

# Year Detection
{ :string=>/<span id="CtlLogin1_Login1_Label1">Copyright .{1,2} 2007 - (20[\d]{2}) Livetecs LLC\. All rights reserved\.<\/span>/ },

# Version Detection
{ :version=>/<td style="width: 15%" align=right>[\s]+<span id="CtlLogin1_Login1_VersionLabel">v ([^<^\s]+)<\/span><\/td>/ },

]

end

