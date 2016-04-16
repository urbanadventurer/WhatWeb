##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PROLiNK-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-21
version "0.1"
description "PROLiNK Router"
website "http://www.prolink.co.id/"

# ShodanHQ results as at 2011-06-21 #
# 299 for virtual web

# Google results as at 2011-06-21 #
# 37 for "ADSL Router Status" intitle:"PROLiNK ADSL Router" "This page shows the current status and some basic settings of the device"

# Dorks #
dorks [
'"ADSL Router Status" intitle:"PROLiNK ADSL Router" "This page shows the current status and some basic settings of the device"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<! Copyright (c) Realtek Semiconductor Corp., 2003. All Rights Reserved. ->' },

# Title
{ :text=>'<title>PROLiNK ADSL Router</title>' },
{ :text=>'<title>RFwell ADSL Router Status</title>' },

# Frameset # FRAME SRC="attention.htm"
{ :text=>'<FRAME SRC="attention.htm" NAME="attention" FRAMEBORDER="NO" SCROLLING="NO" MARGINWIDTH="0" MARGINHEIGHT="0">' },

# /images/logo.gif
{ :md5=>"8be83109b0aaabae7737b28e666ba116", :url=>"/images/logo.gif" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Virtual Web/

		m << { :certainty=>25, :name=>"HTTP Server Header" }

		# status.asp or /admin/status.asp # Model Detection
		m << { :model=>@body.scan(/<tr bgcolor="#EEEEEE">\s+<td width=40%><font size=2><b>Alias Name<\/b><\/td>\s+<td width=60%><font size=2>PROLiNK ([^<]+)<\/td>\s+<\/tr>/).flatten } if @body =~ /<tr bgcolor="#EEEEEE">\s+<td width=40%><font size=2><b>Alias Name<\/b><\/td>\s+<td width=60%><font size=2>PROLiNK ([^<]+)<\/td>\s+<\/tr>/

		# status.asp or /admin/status.asp # Firmware Detection
		m << { :firmware=>@body.scan(/<tr bgcolor="#EEEEEE">\s+<td width=40%><font size=2><b>Firmware Version<\/b><\/td>\s+<td width=60%><font size=2>([^<]+)<\/td>\s+<\/tr>/).flatten } if @body =~ /<tr bgcolor="#EEEEEE">\s+<td width=40%><font size=2><b>Firmware Version<\/b><\/td>\s+<td width=60%><font size=2>([^<]+)<\/td>\s+<\/tr>/

		# status.asp or /admin/status.asp # DSP Version Detection
		m << { :version=>@body.scan(/<tr bgcolor="#DDDDDD">\s+<td width=40%><font size=2><b>DSP Version<\/b><\/td>\s+<td width=60%><font size=2>([^<]+)<\/td>\s+<\/tr>/).flatten } if @body =~ /<tr bgcolor="#DDDDDD">\s+<td width=40%><font size=2><b>DSP Version<\/b><\/td>\s+<td width=60%><font size=2>([^<]+)<\/td>\s+<\/tr>/

		# status.asp or /admin/status.asp # MAC Address Detection
		m << { :string=>"MAC:"+@body.scan(/<tr bgcolor="#DDDDDD">\s+<td width=40%><font size=2><b>MAC Address<\/b><\/td>\s+<td width=60%><font size=2>([^<]+)<\/td>\s+<\/tr>/).flatten } if @body =~ /<tr bgcolor="#DDDDDD">\s+<td width=40%><font size=2><b>MAC Address<\/b><\/td>\s+<td width=60%><font size=2>([^<]+)<\/td>\s+<\/tr>/

	end

	# Return passive matches
	m
end

end

