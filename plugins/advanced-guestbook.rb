##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

#Version 0.3 
# using :version=>// instead of a passive plugin for version detection
Plugin.define "Advanced-Guestbook" do
author "Andrew Horton"
version "0.3"
description "Web guestbook script. http://johnny.ihackstuff.com/ghdb/?function=detail&id=228 Version 2.2 is vulnerable http://www.securityfocus.com/bid/10209/info."
website "http://proxy2.de/scripts.php"

# Dorks #
dorks [
'inurl:guestbook.php "Advanced GuestBook" "powered by phpbb"'
]



# Matches #
matches [
{:certainty=>75, :ghdb=>'intitle:guestbook "advanced guestbook 2.2" powered'},
{:certainty=>75, :text=>"Thank you for stopping by my site. Here you can leave your mark."},
{:name=>"powered by", :version=>2.2, :regexp=>/<b>Advanced Guestbook 2.2<br>\s+Powered by PHP/},

{:name=>"powered by - regexp", :version=>/<a href="http:\/\/www.proxy2.de" target="_blank"><font color="#CCCCCC" size="1">(Advanced Guestbook) ([^<]+)/,
:offset=>1}
]

# Vuln version 2.2
# <center><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="1"><b>Advanced Guestbook 2.2<br>
#  Powered by PHP &amp; MySQL - <a href="http://www.proxy2.de" target="_blank"><font color="#CCCCCC">http://http://www.proxy2.de</font></a></b></font></center>

# Version 2.3.1
#<center><b><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="1">Powered by <a href="http://www.proxy2.de" target="_blank"><font color="#CCCCCC" size="1">Advanced Guestbook 2.3.1</font></a></font></b></center>

# Version 2.3.3
#<center><b><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="1"><a href="http://www.proxy2.de" target="_blank"><font color="#CCCCCC" size="1">Advanced Guestbook 2.3.3</font></a></font></b></center>

# Version 2.4.1
#<center><b><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="1"><a href="http://www.proxy2.de" target="_blank"><font color="#CCCCCC" size="1">Advanced Guestbook 2.4.1</font></a></font></b></center>

# Version 2.4.3
#<center><b><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="1"><a href="http://www.proxy2.de" target="_blank"><font color="#CCCCCC" size="1">Advanced Guestbook 2.4.3</font></a></font></b></center>



end

