##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LiveZilla" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "LiveZilla, the Next Generation Live Help and Live Support System connects you to your website visitors. Use LiveZilla to provide Live Chats and monitor your website visitors in real-time."
website "http://www.livezilla.net/"

# Google results as at 2011-03-24 #
# 14 for "LiveZilla - Freeware Live Support" intitle:"LiveZilla - Freeware Live Support - http://www.livezilla.net"
# 12 for filetype:php inurl:server.php "Thank you for using LiveZilla!"

# Dorks #
dorks [
'"LiveZilla - Freeware Live Support" intitle:"LiveZilla - Freeware Live Support - http://www.livezilla.net"'
]



# Matches #
matches [

# Version Detection # registered trademark link
{ :version=>/<td colspan="2" width="400" align="center" (class|id)="lz_index_light_text">LiveZilla is a registered trademark<br>of LiveZilla GmbH<br><br>Version ([\d\.]+)<\/td>/, :offset=>1 },

# server.php # Thank you text
{ :text=>'<td><br><br><br><strong>Thank you for using LiveZilla!</strong></td>' },

# HTML Comment and div id
{ :text=>'<!-- http://www.LiveZilla.net Tracking Code --><div id="livezilla_tracking" style="display:none"></div>' },

# Error Page # address
{ :text=>'<address><a href="http://www.livezilla.net" target="_blank">LiveZilla - Freeware Live Support</a></address>' },

# Meta Author
{ :certainty=>25, :text=>'<meta name="author" content="LiveZilla GmbH">' },

# Error Page # Title
{ :text=>'<title>LiveZilla - Freeware Live Support - http://www.livezilla.net</title>' },

]

end


