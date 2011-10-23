##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "InverseFlow-Help-Desk-System" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-24
version "0.1"
description "InverseFlow Help Desk System - Homepage: http://www.inverseflow.com/products/helpdesk/index.php"

# Google results as at 2011-10-24 #
# 76 for inurl:"ticket.php?cmd=lost"
# 37 for inurl:"ticketview.php" "To view a ticket, please enter your email address and ticket ID."
#  9 for "InverseFlow Help Desk User Login" intitle:"Help Desk"
#  7 for "Powered by InverseFlow Help Desk"

# Dorks #
dorks [
'for inurl:"ticket.php?cmd=lost"',
'inurl:"ticketview.php" "To view a ticket, please enter your email address and ticket ID."'
]

# Examples #
examples %w|
www.inverseflow.com/HelpDeskDemo/login.php
www.netblazon.com/support/helpdesk/login.php
www.sunwave.com.br/helpdesk/login.php
support.virtualevolution.co.za/login.php
help.gayadpros.com/ticketview.php
helpdesk.t3g.net/helpdesk/ticketview.php
www.radio2mp3.com/helpdesk/ticketview.php
help.pridestudios.com/ticketview.php
www.pfyc.com/help/login.php
www.c-logix.com/ticket.php?cmd=lost
helpdesk.serverwizards.com/ticket.php?cmd=lost
support.onlinegardener.com/ticket.php?cmd=lost
www.reply2dave.com/ticket.php?cmd=lost
www.spytech-web.com/helpdesk/ticket.php?cmd=lost
support.adcserver.net/ticket.php?cmd=lost
|

# Matches #
matches [

# Footer
{ :certainty=>25, :text=>'<table width="100%" bgcolor="#FFAD4D" border="0"><tr><td><div class="infobar_01">' },

# Version Detection # Footer
{ :version=>/<table width="100%" bgcolor="#FFAD4D" border="0"><tr><td><div class="infobar_01">InverseFlow Help Desk ([^<]+)<\/td><\/tr><\/table>/ },

# ./ticketview.php # English
{ :text=>'<div class="normal">To view a ticket, please enter your email address and ticket ID.  If you forgot your ticket ID, you can use the <a href="ticket.php?cmd=lost">ticket lookup</a>.</div>' },

# ./ticketview.php # All Languages
{ :certainty=>25, :regexp=>/<div class="normal">[^<]+<a href="ticket\.php\?cmd=lost">/ },

# ./ticketview.php # Form
{ :certainty=>25, :text=>'<form action="ticketview.php" method="get">' },

# ./ticket.php # Form
{ :regexp=>/<form action="ticket\.php" method="get">[\s]+<input type="hidden" name="cmd" value="lost" \/>/ },

]

end

