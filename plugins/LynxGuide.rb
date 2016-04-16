##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LynxGuide" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-07
version "0.1"
description "The Lynx System is a Facility-wide, Network based, Duress and Emergency Notification System. "
website "http://www.lynxguide.com/"

# Google results as at 2012-05-07 #
# 1 for inurl:"cgi/logon.plx"

# Dorks #
dorks [
'inurl:"cgi/logon.plx"'
]



# Matches #
matches [

# Title
{ :text=>'<title>Login to LynxGuide Server</title>' },

# Footer
{ :text=>'Use subject to <a href="/cgi/help/license.htm">license agreement</a></span>' },

# Set-Cookie # Access_Num
{ :search=>"headers[set-cookie]", :regexp=>/Access_Num=[^;]+;/ },

]

end

