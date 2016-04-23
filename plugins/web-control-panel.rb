##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Web-Control-Panel" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-27
version "0.1"
description "Web Control Panel used for CommuniLink hosting"
website "http://communilink.com/"

# Google results as at 2011-09-27 #
# 29 for "New Webmail by CommuniLink. Many new features added and support multi-language."
# 27 for intitle:"Web Control Panel Express" "Email Manager" "Manage the email accounts"

# Dorks #
dorks [
"New Webmail by CommuniLink. Many new features added and support multi-language."
]



# Matches #
matches [

# Version Detection # Title
{ :version=>/<TITLE>Web Control Panel Express v([^\s^<]+)<\/TITLE>/ },

# Version Detection # /images/wcpe.gif
{ :url=>"/images/wcpe.gif", :md5=>"941271289a317097d00bc72f93f8c79d", :version=>"3.0" },

# Servername Detection
{ :string=>/<td width="598" align="CENTER"><font face="Verdana,Arial,Helvetica" size="-2" color="#DFFFDF"><b>Welcome to the <font[\s]+color="yellow">([^<]+)<\/font> Server<\/b><\/font><\/td>/ },

# Mail Software Detection
{ :module=>/<td valign="top" class="menu"><strong><a href="\/horde\/imp\/login\.php">([^<]+)<\/a><\/strong><br>New Webmail by CommuniLink\. Many new features added and support multi-language\.<\/td>/ },

# Logo HTML
{ :text=>'<td><img src="/images/wcpe.gif" width=600 height=57 border=0></td>' },

# cgi-bin links
{ :text=>'<td valign="top"><a href="/cgi-bin/webmail?noframes=1"><img src="images/' },

]

end

