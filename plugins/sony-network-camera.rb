##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated model detection
##
Plugin.define "Sony-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "SONY network video camera web interface"
website "http://www.sony.com/"

# Google results as at 2010-06-29 #
# 29 for intitle:"SONY Network Camera SNC-P1"
#  7 for inurl:home/homej.html intitle:"SNC-RZ30 home"

# ShodanHQ results as at 2010-07-22 #
# 543 for Server:NetEVI



# Matches #
matches [

# SNC-M
{ :text=>'	setWindowVar = window.open("/adm/file.cgi?next_file=setting.htm", "adminWin", setWinoptions);', :model=>["SNC-M"] },

# SNC-RZ / SNC-Z
{ :text=>'<TITLE>Server Push Viewer</TITLE>' },
{ :regexp=>/<FRAME SRC="bar.html" SCROLLING="NO" NAME="sonyhome[0-9]*" NORESIZE[\ MARGINHEIGHT="0-9"]* MARGINWIDTH="0">/i },

# Model Detection # SNC-P / SNC-M
{ :model=>/<TITLE>Sony Network Camera ([0-9A-Z\-]+)<\/TITLE>/i },

# Model Detection # SNC-RZ / SNC-Z
{ :model=>/<TITLE>(SNC\-[R]?Z[0-9]+)<\/TITLE>/ },
{ :model=>/<TITLE>(SNC\-[R]?Z[0-9]+) HOME<\/TITLE>/ },

]

end

