##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IceWarp-Email-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "IceWarp Email Server is at the core of IceWarp Unified Communications Server. Time-tested and robust, it provides unsurpassed power and unparalleled flexibility. For over a decade, companies that demand stability, security, speed, power and ease-of-use have deployed IceWarp Email Server on over 50,000 servers around the globe, supporting 50 million users."
website "http://www.icewarp.com/Products/Merak_Email_Server_Software/"

# Google results as at 2011-03-17 #
# 513 for "Powered by IceWarp Software"



# Matches #
matches [

# Powered by text
{ :regexp=>/<DIV align="center" CLASS="copy">Powered by[\s]+<A HREF="http:\/\/www.icewarp.com\/" target="_blank" CLASS="copylink">IceWarp Software<\/A> <A HREF="http:\/\/(www\.)?icewarp\.com\/Products\/Merak_Email_Server_Software\/" target="_blank" CLASS="copylink">Merak Email Server<\/A><BR>/ },

# NoScript loading page # new versions generate the GUI with JavaScript
{ :text=>'<noscript>Please, enable <strong>JavaScript</strong> for this site and if such option is not available, download the latest <a href="http://www.microsoft.com/windows/downloads/ie/getitnow.mspx">Internet Explorer</a> or <a href="http://www.getfirefox.com">Mozilla FireFox</a>.</noscript>' },

# Version Detection # Powered by text
{ :version=>/<DIV align="center" CLASS="copy">Powered by[\s]+<A HREF="http:\/\/www\.icewarp\.com\/" target="_blank" CLASS="copylink">IceWarp Software<\/A> <A HREF="http:\/\/(www\.)?icewarp\.com\/Products\/Merak_Email_Server_Software\/" target="_blank" CLASS="copylink">Merak Email Server<\/A><BR>IceWarp Web Mail ([\d\.]+) \([^\)]+\)<\/DIV>/, :offset=>1 },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.icewarp.com">IceWarp Software<\/a> <a href="http:\/\/www\.icewarp\.com\/Products\/Merak_Email_Server_Software\/">IceWarp Server<\/a> [^\s]+ 1999-20[\d]{2}<br \/> Version: ([\d\.]+)/ },

# Encrypted Login input
{ :text=>'<span id="cipher"><input type="checkbox" name="xcipher" value="1" >Encrypted login</span>' },

]

end


