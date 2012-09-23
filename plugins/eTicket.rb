##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eTicket" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-15
version "0.1"
description "eTicket is a PHP-based electronic support ticket system that can receive tickets via email (pop3/pipe) or a web form. - Homepage: http://www.eticketsupport.com/"

# Google results as at 2012-09-15 #
# 523 for "Powered by eTicket" "Support Ticket System"

# Dorks #
dorks [
'"Powered by eTicket" "Support Ticket System"'
]

# Examples #
examples %w|
www.transitlink.com.sg/eservice/efeedback/view.php
support.cepstral.com
www.pandoraonline.net/support/newticket.php
www.communityservicepartners.org/eTicket/
www2.wowmx.net/tickets/eTicket/view.php
www.sabaiko.com/esupport/readme.html
helpdesk.vcon.bg
www.aitcs.com.au/eticket/view.php
www.bitnetpros.com/help/
rt.6deploy.eu
www.rdithelp.co.uk/view.php
ticket.dvdworldusainfo.com
rtp-web-01.lmit-rtp.com/BMDS_helpdesk/
https://www.digistarsolutions.com/esupport/open.php
support.geenet.co.za/index.php
www.keystolearningsuccess.com/helpdesk/
www.spectrum-edge.com/eticket/view.php
support.maverickcoaching.com/helpdesk/open.php
www.womenadvance.com/support/
www.axiooworld.com/eticket/view.php
www.networksystech.com/helpdesk/index.php
it-helpdesk.ipb.ac.id
support.digitalhousing.net
help.mackcity.k12.mi.us
ticket.ihno.de
www.improductivitysecrets.com/support/
www.elearningyuc.edu.sa/helpdesk/
|

# Matches #
matches [

# Powered by footer
{ :regexp=>/<td><a href="(http:\/\/)?www\.eticketsupport\.com" target="_blank">Powered by eTicket<\/a><\/td>/ },

# Footer
{ :text=>'<div class="pre-footer">Support Ticket System</div>' },

# Stylesheet
{ :text=>'<link rel="stylesheet" href="themes/eticket/style.css" type="text/css">' },

# ./readme.html
{ :text=>'<p><strong>Note:</strong> &quot;/path/to/automail.pl&quot; should be the <a href="http://en.wikipedia.org/wiki/Full_path">full path</a>' },

]

end

