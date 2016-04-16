##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Novell-NetWare" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-08
version "0.1"
description "Novell NetWare server."
website "http://www.novell.com/"

# ShodanHQ results as at 2011-08-08 #
# 1,838 for NetWare
#   351 for NetWare HTTP Stack

# Google results as at 2011-08-08 #
# 70 for intitle:"NetWare Server" "NetWare Management Portal Version"

# Dorks #
dorks [
'intitle:"NetWare Server" "NetWare Management Portal Version"'
]



# Matches #
matches [

# Unauthorized
{ :text=>'</HEAD><BODY><font size=+2><p>Unauthorized!</font><font size=+1><p>Please login using a full NDS name and context (example: .user.engineering.acme_corp.)</font></BODY></HTML>' },

# Frameset # Title
{ :regexp=>/<TITLE>NetWare Server [^<]+<\/TITLE><LINK REL=stylesheet TYPE=text\/css HREF=\/SYS\/LOGIN\/portal\.css>/ },

# Applet
{ :text=>'<APPLET CODE=NWSHealth.class NAME="NWServerHealth" CODEBASE=/SYS/Login width=38 height=99>' },

# / # Version Detection # Old versions without frameset
{ :url=>"/", :version=>/<br>&nbsp;&nbsp;<font color=teal size=-1><B>Novell (NetWare|Small Business Suite) ([^<]+)<\/B><\/font><br>/, :offset=>1 },

# / # Server Version Detection # Old versions without frameset
{ :url=>"/", :module=>/&nbsp;&nbsp;<font color=teal size=-1><b>(Server Version [\d\.]+ revision [A-Z]),[\s]+([A-Z][a-z]+ [\d]{1,2}, [\d]{4}|[\d]{1,4} [A-Z][a-z]+ [\d]{1,4})<\/B><\/font><br>/ },

# / # Management Portal Version Detection # Old versions without frameset
{ :url=>"/", :module=>/&nbsp;&nbsp;<font color=teal size=-1><b>NetWare (Management Portal Version [^,]+),[\s]+([A-Z][a-z]+ [\d]{1,2}, [\d]{4}|[\d]{1,4} [A-Z][a-z]+ [\d]{1,4})<\/B><\/font><br>/ },

# /TOP.HTML # Applet
{ :url=>"/TOP.HTML", :text=>'<TABLE WIDTH="100%"><TR><TD ALIGN=LEFT VALIGN=TOP><APPLET CODE="NWSHealth.class" NAME="NWServerHealth" CODEBASE="/SYS/Login" width=33 height=52>' },

# /TOP.HTML # Version Detection
{ :url=>"/TOP.HTML", :version=>/<TD ALIGN=RIGHT VALIGN=TOP><font color="#524a18" size=-1><B>Novell NetWare ([^<]+)<\/B>/ },

# /TOP.HTML # Server Version Detection
{ :url=>"/TOP.HTML", :module=>/<font color="#524a18" size=-1><b>(Server Version [\d\.]+ revision [A-Z]),[\s]+([A-Z][a-z]+ [\d]{1,2}, [\d]{4}|[\d]{1,4} [A-Z][a-z]+ [\d]{1,4})<\/B><\/font><BR>/ },

# /TOP.HTML # Management Portal Version Detection
{ :url=>"/TOP.HTML", :module=>/<font color="#524a18" size=-1><b>NetWare (Management Portal Version [\d\.]+ revision [A-Z]),[\s]+([A-Z][a-z]+ [\d]{1,2}, [\d]{4}|[\d]{1,4} [A-Z][a-z]+ [\d]{1,4})<\/B><\/font><BR>/ },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^NetWare/

		if @headers["server"] =~ /^NetWare HTTP Stack$/
			m << { :name=>"HTTP Server Header" }
		end

		if @headers["server"] =~ /^NetWare-Enterprise-Web-Server\/([^\s]+)$/
			m << { :version=>"#{$1}" }
		end

	end

	# Return passive matches
	m
end
end

=begin

These may also be Novell Netware:

Server: NetWare-Enterprise-Web-Server/5.1 
Server: EnterpriseWeb/1.1.4 z_VM/5.4.0.0802 CMS/24.802 REXX/4.00 CMS_Pipelines/1.0110 REXX_SOCKETS/2.01 

# ShodanHQ results as at 2011-08-08 #
#  5 for enterpriseweb
# 73 for Novell-HTTP-Server

=end

