##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AppServ" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-23
version "0.1"
description "AppServ is an Apache, MySQL, PHP, phpMyAdmin installer package for Windows and Linux. - Homepage: http://www.appservnetwork.com/"

# Google results as at 2011-09-23 #
# 55 for intitle:"AppServ Open Project" "About AppServ Version"

# Dorks #
dorks [
'intitle:"AppServ Open Project" "About AppServ Version"'
]

# Examples #
examples %w|
www2.mis.kyu.edu.tw
www2.kyes.tn.edu.tw
tisecweb.nccu.edu.tw
chat.sg.thailandtorrent.com
202.143.173.178
www.imune-online.com.br
htys.sgk.gov.tr
140.130.211.6
szserv.socio.u-szeged.hu
163.19.171.220
147.83.159.151
140.109.29.147
163.24.90.120
|

# Matches #
matches [

{ :version=>/<span class="headd"><strong><big>&nbsp; The AppServ Open Project - ([^\s]+) for (Windows|Linux) <\/big><\/strong><\/span><\/font><\/td>/ },

{ :text=>'<font color="#000080" class="headd">&nbsp;&nbsp;&nbsp;<img src="appserv/softicon.gif"' },

]

end

