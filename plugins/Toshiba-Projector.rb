##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Toshiba-Projector" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-30
version "0.1"
description "Toshiba mobile and conference room projector"
website "http://us.toshiba.com/projectors/"

# ShodanHQ results as at 2011-10-30 #
# 21 for TOSHIBA-Projector



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^TOSHIBA-Projector$/ },

# /menu.cgi # Homepage Link HTML
#{ :url=>"/menu.cgi", :text=>'<TD class="f12w" width="190"><A href="http://multimedia.projector-toshiba.com/" target="_blank">TOSHIBA Projector Website</A></TD>' },

# /cgi-bin/top2.cgi # Model Detection
{ :url=>"/cgi-bin/top2.cgi", :model=>/<TD class="f16" align="right"><FONT color="#1a6b84"><B>TOSHIBA DATA PROJECTOR&nbsp; ([^\s]+)                <\/B><\/FONT><\/TD>/ },

# /cgi-bin/top2.cgi # MAC Address Detection
{ :url=>"/cgi-bin/top2.cgi", :string=>/<TD class="f12w" nowrap><FONT color="#206e96">([\dA-Z]{12})<\/FONT><\/TD>/ },

# /cgi-bin/status_nw.cgi # MAC Address Detection
{ :url=>"/cgi-bin/status_nw.cgi", :string=>/<TD class="f12w" width="229" height="30"><FONT color="#666666"><B>MAC address<\/B><\/FONT><\/TD>[\s]+<TD class="f12w" valign="middle" width="217" height="30">([\dA-Z]{12})<\/TD>/ },

# /cgi-bin/status_nw.cgi # Version Detection
{ :url=>"/cgi-bin/status_nw.cgi", :version=>/<TD class="f12w" width="229" height="30"><FONT color="#666666"><B>Version<\/B><\/FONT><\/TD>[\s]+<TD class="f12w" valign="middle" width="217" height="30">([^<]+)<\/TD>/ },

]

end

