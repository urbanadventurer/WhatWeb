##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tickets-CAD-System" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-05
version "0.1"
description "Tickets CAD System - Open Source Dispatch System"
website "http://www.ticketscad.org/"

# Google results as at 2012-08-05 #
# 16 for intitle:"Tickets" "Welcome to Tickets - an Open Source Dispatch System"

# Dorks #
dorks [
'intitle:"Tickets" "Welcome to Tickets - an Open Source Dispatch System"'
]



# Matches #
matches [

# ./top.php # title
{ :text=>'<HEAD><TITLE>Tickets - Top Frame</TITLE>' },

# ./main.php # title
{ :text=>'<HEAD><TITLE>Tickets - Login Module</TITLE>' },

# Framset # NoScript
{ :regexp=>/<NOFRAMES>\s+<BODY>\s+Tickets requires a frames-capable browser\.\s+<\/BODY>\s+<\/NOFRAMES>/ },

# Frameset # Title # Version Detection
{ :version=>/<TITLE>Tickets ([^<]+)<\/TITLE>\s+<LINK REL=StyleSheet HREF="/ },

# ./main.php # Login Page
{ :text=>"<TR CLASS='even'><TD ROWSPAN=6 VALIGN='middle' ALIGN='left' bgcolor=#EFEFEF><BR /><BR />&nbsp;&nbsp;<IMG BORDER=0 SRC='open_source_button.png'>" },

]

end

