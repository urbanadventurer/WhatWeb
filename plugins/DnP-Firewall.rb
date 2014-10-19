##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DnP-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-25
version "0.2"
description "DnP Firewall Gateway Modification"
website "http://www.silveryhat.com/delynie/f142"

# Google results as at 2011-02-25 #
# 12 for "Protected by DnP Firewall" intitle:"Forum Gateway - Powered by DnP Firewall"

# Dorks #
dorks [
'"Protected by DnP Firewall" intitle:"Forum Gateway - Powered by DnP Firewall"'
]



# Matches #
matches [

# Default Title
{ :text=>'<title>Forum Gateway - Powered by DnP Firewall</title>' },

# Default form tag
{ :text=>'	<form name=dnp_firewall method=get action=dnp_fw.php' },

# Default submit input tag
{ :text=>'<input type=submit value=" " alt="Click to continue to your destination" style="background-image:url(default.jpg); height:444px; width:635px; cursor:pointer; border-width:0px;"> '},

# Version Detection # Protected by text
{ :version=>/<\/html><center><div style='border-top:1px solid #666666; height:20px;  padding:1px; background: #333333 none repeat scroll 0% 0%; position: fixed; bottom: 0pt; right: 0pt; left: 0pt; width: 100%; z-index: 100; text-align: center; font-size:12pt;'><font size=1 style='color:gray;font-weight:bold;'><center>Protected by <a href='http:\/\/www.silveryhat.com\/delynie\/f142' title='Firewall Gateway by DnP Network&trade;' style='color:gray'>DnP Firewall<\/a> v([\d\.]{1,5}) &copy; 2005-[\d]{4}<\/font><\/div><\/center>/ },

]

end


