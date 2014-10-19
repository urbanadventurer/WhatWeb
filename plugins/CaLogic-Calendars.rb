##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-09 #
# Updated version detection
##
Plugin.define "CaLogic-Calendars" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-27
version "0.2"
description "Web calendar"
website "http://calogic.de/"

# Gogle results as at 2010-08-27 #
# 11 for "This is your Timezone Offset from GMT and is shown in hours."

# Dorks #
dorks [
'"This is your Timezone Offset from GMT and is shown in hours."'
]



# Matches #
matches [

	# Default H1 title
	{ :text=>'    <h1><b>CaLogic Calendars Demo - Login</b></h1>' },

	# 1.2.2 # Default changelog message
	{ :text=>'Change for 1.2.2 : the logon form MUST use the post method for security reasons!!!', :version=>"1.2.2" },

	# Default Timezone message
	{ :text=>'This is your Timezone Offset from GMT and is shown in hours. It is based on your computers time and country settings. The Timezone Offset is needed in order to show the correct date and time and to ensure that your reminders get sent on time.<br>If the Timezone Offset is not correct, then your computers time settings are wrong. You should not adjust the Timezone Offset, but rather correct your computers time settings.' },

	# Version Detection # Powered by footer
	{ :version=>/<font size="-1">CaLogic Calendars V([\d\.]+)<\/font>/ },

]

end

