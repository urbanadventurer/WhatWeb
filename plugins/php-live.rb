##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "PHP-Live" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.2"
description "PHP Live! enables live help and live customer support communication directly from your website."
website "http://www.phplivesupport.com/"

# Google results as at 2010-08-31 #
# 158 for "powered by PHP Live!" -Vulnerability
# 7   for "powered by PHP Live!" intitle:"Knowledge BASE (FAQ)" inurl:knowledge_search.php
# 14  for "powered by PHP Live!" (intitle:"Request Live! Support"|"Please leave a message") inurl:request_email.php

# Dorks #
dorks [
'"powered by PHP Live!" -Vulnerability'
]



# Matches #
matches [

# Javascript
{ :text=>'// image is NOT CACHED (Netscape problem).  keep this or bad things could happen' },

# HTML Comments
{ :text=>'<!-- copyright OSI Codes Inc. http://www.osicodes.com [DO NOT DELETE] -->' },
{ :text=>'<!-- copyright OSI Codes, http://www.osicodes.com [DO NOT DELETE] -->' },
{ :text=>'<!-- BEGIN PHP Live! Code, copyright 2001 OSI Codes -->' },
{ :text=>'<!-- END PHP Live! Code, copyright 2001 OSI Codes -->' },

# FAQ # Default Title
{ :text=>'<title> Knowledge BASE (FAQ) </title>' },

# Error page
{ :text=>'<font color="#FF0000">[Configuration Error: config files not found!] Exiting' },

# Version Detection # Powered by text
{ :version=>/	<div id="copyright">Powered by <a href='http:\/\/www.phplivesupport.com\/\?link' target='newwin'>PHP Live\!<\/a>  v([\d\.]+) &copy; OSI Codes Inc.<\/div>/ },

]

end

