##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "eMeeting-Online-Dating-Software" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.2"
description "Dating Software by eMeeting Ltd"
website "http://www.datingscripts.org/"

# Google results as at 2010-08-30 #
# 53 for "eMeeting Dating Software Version"

# Dorks #
dorks [
'"eMeeting Dating Software Version"'
]



# Matches #
matches [

# Admin Page # Default Title
{ :text=>'<html xmlns="http://www.w3.org/1999/xhtml"><head><title>Admin Area Login</title>' },

# Admin Page # Default h2 Heading
{ :text=>'				<td valign="bottom"><h2>Admin Area Login</h2></td>' },

# Powered by text
{ :text=>'<a href="http://www.datingscripts.org" alt="Dating Software by eMeeting Ltd" target="_blank">Dating Software Powered by eMeeting Ltd</a>' },

# Version Detection # Powered by text
{ :version=>/<p>eMeeting Dating Software <strong>Version ([\d\.]+)<\/strong>/ },

]

end

