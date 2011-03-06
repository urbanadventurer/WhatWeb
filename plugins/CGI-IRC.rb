##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CGI:IRC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-08
version "0.1"
description "CGI:IRC is a Perl/CGI program to use IRC from a web browser. This plugin extracts the version and the default server, channel and nickname - homepage: http://cgiirc.org/"

# Google results as at 2011-02-08 #
# 224 for intitle:"CGI:IRC Login" Nickname Server Channel

# Examples #
examples %w|
cgiirc.org/demo/
irc.fr.uninet.edu
webchat.uninet.edu
irc.fr.uninet.edu/irc.cgi
webchat.uninet.edu/login
irc.upm.edu.ph/cgi-bin/irc.cgi
gluc.unicauca.edu.co/cgi-bin/irc/irc.cgi
www.plwebs.de/cgi-bin/irc.cgi
www.scoutlink.ch/cgi-bin/irc.cgi
virtualtruth.net/cgi-bin/cgiirc/irc.cgi
awmirc.com/webgate/irc.cgi
www.dark-angels.co.za/cgiirc/irc.cgi
rand-pdx.solidnet.net/cgi-bin/cgiirc/irc.cgi
www.frankspage.net/cgi-bin/irc.cgi
open.neurostechnology.com/cgiirc/
irc.datatower.net/cgi-bin/irc/irc.cgi
www.frozyn.info/cgi-bin/cgiirc-0.5.9/cgiirc-0.5.9/irc.cgi
mandrich.com/irc/irc.cgi
irc.uberguilds.com/irc.cgi
www.thelinuxlink.net/cgi-bin/cgiirc/irc.cgi
koha.org/cgi-bin/irc.cgi
www.anxiety-support.org/cgi-bin/cgiirc/irc.cgi
www.agorat.org/cgiirc/irc.cgi
irc.free.net.ph/cgi-bin/irc.cgi
217.67.200.130/cgi-bin/cgiirc/irc.cgi
webchat.starlink-irc.org/cgi-bin/irc.cgi
cgi.irc.ragingfist.net/cgi-bin/irc.cgi
cs-mapping.com.ua/cgi-bin/irc.cgi
www.flooble.net/cgi-bin/cgiirc/irc.cgi
|

# Matches #
matches [

# Default Title
{ :text=>"<title>CGI:IRC Login</title>" },

# Default Body HTML
{ :text=>'<body bgcolor="#ffffff" text="#000000" onload="setcharset();">' },

# Default Form HTML
{ :text=>'<form method="post" action="irc.cgi" name="loginform" onsubmit="setjs()">' },

# Default Advanced Link
{ :text=>'<small><a href="irc.cgi?adv=1">Advanced..</a></small>' },

# Version Detection # Default HTML Comment
{ :version=>/^<!-- This is part of CGI:IRC ([\d\.]+)/ },

# Version Detection # cgiirc.org build # Powered by text
{ :version=>/^<small id="ietest"><a href="http:\/\/cgiirc.org\/">CGI:IRC<\/a> ([^<]{3,25})<br \/>/ },

# Version Detection # Sourceforge build # Powered by text
{ :version=>/^<small id="ietest"><a href="http:\/\/cgiirc.sourceforge.net\/">CGI:IRC<\/a> ([^<]{3,25})<br \/>/ },

# Nickname Detection
{ :string=>/^bgcolor="#f1f1f1"><input type="text" name="Nickname" value="([^"]+)"><\/td><\/tr>/ },

# Channel Detection # Input HTML
{ :string=>/^bgcolor="#f1f1f1"><input type="text" name="Channel" value="([^"]+)"[^>]*><\/td><\/tr>/ },

# Channel Detection # Select HTML
{ :string=>/^bgcolor="#f1f1f1"><select name="Channel" style="width: 100%"[^>]*><option[^>]*>([^<]*)<\/option>/ },

# Server Detection # Input HTML
{ :string=>/^bgcolor="#f1f1f1"><input type="text" name="Server" value="([^"]+)"[^>]*><\/td><\/tr>/ },

# Server Detection # Select HTML
{ :string=>/^bgcolor="#f1f1f1"><select name="Server" style="width: 100%"[^>]*><option[^>]*>([^<]*)<\/option>/ },

]

end


