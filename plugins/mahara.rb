##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mahara" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-05
version "0.1"
description "Mahara is an open source e-portfolio system"
website "http://mahara.org/"

# Google results as at 2011-11-05 #
# 116 for "powered by mahara" inurl:"about.php" intitle:"About"

# Dorks #
dorks [
'"powered by mahara" inurl:"about.php" intitle:"About"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- This site is powered by Mahara, an Open Source' },
{ :text=>'<!-- there is a div id="performance-info" wrapping this -->' },

# div id="powered-by" + Logo HTML
{ :text=>'<div id="powered-by"><a href="http://mahara.org/"><img src="' },

# JavaScript
{ :text=>'<script type="text/javascript">var strings = {"namedfieldempty":"The required field \"%s\" is empty","processing":"Processing","requiredfieldempty":"A required field is empty","unknownerror":"An unknown error occurred (0x20f91a0)",' },
# <script type="text/javascript">var strings = {"namedfieldempty":"The required field \"%s\" is empty","processing":"Processing","requiredfieldempty":"A required field is empty","unknownerror":"An unknown error occurred (0x20f91a0)","loading":"Loading ...","showtags":"Show my tags","unreadmessages":"unread messages","unreadmessage":"unread message","pendingfriend":"pending friend","pendingfriends":"pending friends","couldnotgethelp":"An error occurred trying to retrieve the help page","password":"Password","username":"Username","login":"Login","sessiontimedout":"Your session has timed out, please enter your login details to continue","loginfailed":"You have not provided the correct credentials to log in. Please check your username and password are correct.","home":"Home","youhavenottaggedanythingyet":"You have not tagged anything yet"};</script>

]

end

