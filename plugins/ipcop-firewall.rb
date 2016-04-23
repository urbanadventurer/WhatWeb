##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "IPCop-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.2"
description "The IPCop Firewall is a Linux firewall distribution. It is geared towards home and SOHO users. The IPCop web-interface is very user-friendly and makes usage easy."
website "http://sf.net/projects/ipcop/"

# Google results as at 2012-11-04 #
# 6 for intitle:"IPCop - Main page" "IP Address" "Hostname"

# Dorks #
dorks [
'intitle:"IPCop - Main page" "IP Address" "Hostname"'
]



# Matches #
matches [

# Default Title
{ :text=>"    <title>IPCop - Main page</title>" },

# Default CSS
{ :text=>'    <style type="text/css">@import url(/include/ipcop.css);</style>'},

# Sourceforge logo HTML
{ :text=>"	<td valign='bottom'><a href='http://sf.net/projects/ipcop/' target='_blank'><img src='/images/sflogo.png' width='88' height='31' alt='Sourceforge logo' /></a></td>" },

# Default Menu HTML
{ :text=>"<td style='background-color: #EAE9EE;' align='left' width='100%'><b>Home</b> | <a href='/cgi-bin/updates.cgi'>Updates</a> | <a href='/cgi-bin/changepw.cgi'>Passwords</a> | <a href='/cgi-bin/remote.cgi'>SSH Access</a> | <a href='/cgi-bin/gui.cgi'>GUI Settings</a> | <a href='/cgi-bin/backup.cgi'>Backup</a> | <a href='/cgi-bin/shutdown.cgi'>Shutdown</a> | <a href='/cgi-bin/credits.cgi'>Credits</a></td></tr></table>" },

# Version Detection
{ :version=>/	    <img src='\/images\/null.gif' width='1' height='29' alt='' \/>([\d\.]+)<\/td>/ },

# HTML Comment
{ :text=>'<!-- IPCOP FOOTER -->' },

# Footer # Version Detection
{ :version=>/<small>IPCop v([^\s]+) &copy; 2001-20[\d]{2} The IPCop Team<\/small><\/td>/ },

# /include/ipcop.css
{ :url=>"/include/ipcop.css", :text=>'/* used in status.cgi (among others) */' },

]

end

