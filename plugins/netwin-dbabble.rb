##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetWin-DBabble" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "DBabble is a chat, discussion, and instant messaging server and client, which allows users to send encrypted instant messages, have private conversations, and create and participate in private or public chat rooms and discussions."
website "http://netwinsite.com/dbabble/index.html"

# 3 results for "You can use DBabble unsecurely but faster through your web browser at" "Warning - DBabble requires a web browser that Supports JavaScript 1.1 or higher." @ 2010-10-12


matches [

# Version detection
{ :version=>/^DBabble ([^Server]+)Server Version ([^\ ]+) /, :offset=>1 },
# OS detection
{ :version=>/^DBabble ([^Server]+)Server Version ([^\(]+)\(/ },

# Default Title
{ :text=>'<title>DBabble login</title>' },

# Default CSS
{ :text=>'<LINK REL = "stylesheet" TYPE = "text/css" HREF = "/cgi/dbabble.cgi?cmd_get_js2=dbabble.css">' },
{ :text=>'<LINK REL = "stylesheet" TYPE = "text/css" HREF = "/dbabble?cmd_get_js2=dbabble.css">' },

# Default Javascript
{ :text=>'<script language="JavaScript" src="/cgi/dbabble.cgi?cmd_get_js2=dbabble.js"></script>' },
{ :text=>'<script language="JavaScript" src="/dbabble?cmd_get_js2=dbabble.js"></script>' },
{ :text=>'if (window.top!=window && window.location!="/cgi/dbabble.cgi") {' },
{ :text=>'if (window.top!=window && window.location!="/dbabble") {' },
{ :text=>'document.writeln("<b>Warning - DBabble requires a web browser that Supports JavaScript 1.1 or higher.</b><br>");' },

# Default Form HTML
{ :text=>'<form style="margin:0" name="loginform" method="POST" target="_top" action="/cgi/dbabble.cgi"' },
{ :text=>'<form style="margin:0" name="loginform" method="POST" target="_top" action="/dbabble"' },

# Default help link
{ :text=>'<a target=\'helpwin\' href="/help/English/Standard/contents.htm">DBabble Online Help</a><br>' },

# Default text
{ :text=>'You can use DBabble securely but slower through your web browser at <a href="http' },

]

end

