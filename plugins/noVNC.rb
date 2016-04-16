##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "noVNC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "VNC client using HTML5 (Web Sockets, Canvas) with encryption (wss://) support."
website "https://github.com/kanaka/noVNC"

# Google results as at 2011-08-25 #
# 6 for intitle:"noVNC" inurl:vnc_auto.html +Loading "Canvas not supported."

# Dorks #
dorks [
'intitle:"noVNC" inurl:vnc_auto.html "Loading" "Canvas not supported."'
]



# Matches #
matches [

# div id="VNC_status_bar" class="VNC_status_bar" # Automatically connect example
{ :module=>"Auto", :text=>'<div id="VNC_status_bar" class="VNC_status_bar" style="margin-top: 0px;">' },

# Year Detection # Automatically connect example
{ :module=>"Auto", :string=>/<html>[\s]+<!-- [\s]+noVNC Example: Automatically connect on page load\.[\s]+Copyright \(C\) (20[\d]{2}) Joel Martin[\s]+Licensed under LGPL-3 \(see LICENSE\.txt\)[\s]+Connect parameters are provided in query string:[\s]+http:\/\/example\.com\/\?host=HOST&port=PORT&encrypt=1&true_color=1[\s]+-->[\s]+<head>[\s]+<title>noVNC<\/title>/ },

# Year Detection # simple example using default UI
{ :module=>"Simple", :string=>/<html>[\s]+<!-- [\s]+noVNC example: simple example using default UI[\s]+Copyright \(C\) (20[\d]{2}) Joel Martin[\s]+Licensed under LGPL-3 \(see LICENSE\.txt\)[\s]+-->[\s]+<head>[\s]+<title>noVNC<\/title>/ },

]

end

