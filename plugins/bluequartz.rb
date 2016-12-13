##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BlueQuartz" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-25
version "0.1"
description "Server Appliances and Software - BlueOnyx is a Linux distribution (based on CentOS v5.5) which aims at delivering a turnkey server appliance for webhosting. It comes with a web based GUI interface which allows you to manage most aspects of the server, its sites and accounts. BlueOnyx is a modernized fork of BlueQuartz. A lot of improvements and enhancements went into BlueOnyx, including support for Java Servlet Pages, built in web based email, phpMyAdmin and provisions to automatically create MySQL databases and users for each virtual site - Homepages: http://www.solarspeed.net/ & http://www.blueonyx.it/ & http://bluequartz.org/"

# Google results as at 2011-03-25 #
# 518 for "Welcome to the Web Site of" "Use your favorite FTP application to move your website to the web server."
# 561 for (intitle:Login BlueOnyx|intitle:Login BlueQuartz)

# Dorks #
dorks [
'"Welcome to the Web Site of" "Use your favorite FTP application to move your website to the web server."',
'(intitle:Login BlueOnyx|intitle:Login BlueQuartz)'
]



# Matches #
matches [

# Version Detection # Title
{ :version=>/<TITLE>Login - BlueQuartz ([^\s]+) Series - [^<^\s]+<\/TITLE>/ },

# Version Detection # JavaScript
{ :version=>'document.write\("\\nThank you for using the BlueQuartz ([^\s]+) Series.\\n"\);' },

# body html # Shared by BlueOnyx and BlueQuartz
{ :certainty=>75, :text=>'<BODY BGCOLOR="#FFFFFF" onLoad="focuslogin()" onResize="if(navigator.appName == \'Netscape\') location.reload()" LINK="#FFFFFF" VLINK="#FFFFFF">' },

# HTML Comment # Shared by BlueOnyx and BlueQuartz
{ :certainty=>75, :regexp=>/EVEN IF SUN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES\.[\n][\n]You acknowledge that  this software is not designed or intended for use in the design, construction, operation or maintenance of any nuclear facility.[\n]-->/ },

# Meta Copyright # 404 Error
# Shared by BlueOnyx and BlueQuartz and Sun Cobalt servers
{ :certainty=>25, :text=>'<META NAME="Copyright" VALUE="Copyright (C) 2000, Cobalt Networks, Inc.  All rights reserved.">' },

# Redirect Page # Shared by BlueOnyx and BlueQuartz and Sun Cobalt servers
{ :certainty=>25, :text=>'var url = "/login.php?expired=true&target="+escape(pathname+top.location.search+top.location.hash);' },

# Welcome to text # Shared by BlueOnyx and BlueQuartz and Sun Cobalt servers
{ :certainty=>25, :regexp=>/<P ALIGN="CENTER"><FONT SIZE="5" COLOR="#000099" FACE="HELVETICA, ARIAL"><B>Welcome to the Web Site of [^\s^<]+<\/B><\/FONT>/ },

# web root redirector # Shared by BlueOnyx and BlueQuartz
{ :certainty=>75, :text=>"<BODY onLoad=\"location='http://'+location.host+'/login/'\">" },

]

end

