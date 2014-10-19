##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Net2Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-19
version "0.1"
description "Net2Phone CommCenter is software that allows you to make phone calls and send faxes to anywhere in the world."
website "http://www.net2phone.com/"

# Google dorks as at 2011-04-19 #
# 3 for intitle:"Net2Phone Init Page" "Net2Phone, Inc. All Rights Reserved."

# Dorks #
dorks [
'intitle:"Net2Phone Init Page" "Net2Phone, Inc. All Rights Reserved."'
]



# Matches #
matches [

# Default title
{ :text=>'<HTML><HEAD><TITLE>Net2Phone Init Page</TITLE>' },

# Model Detection
{ :model=>/<P align=center><IMG border=0[\s]+src="([a-zA-Z]{2}[\d]+[a-zA-Z]?)\.gif" width="/ },

]

end


