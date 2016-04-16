##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tele-Data-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-11
version "0.1"
description "Tele Data's Contact Management Server - Contact Management Server for Windows / Asterisk - a custom designed HTTP server which act as a front end to a SQLite Database designed to provide contact management services, accessible from a Web Browser, to a single or group of users on a LAN or WAN network."
website "http://teledata.qc.ca/td_cms/"

# 53 for "Powered by Teledata"
# 12 for "Powered by Teledata" "Best viewed in IE6"
#  6 for "Powered by Teledata" inurl:"/login/home/login.aspx"

# Dorks #
dorks [
'"Powered by Teledata" "Best viewed in IE6"'
]



# Matches #
matches [

# Powered by text
{ :regexp=>/Powered by Teledata<br>\n<center>Best viewed in IE6\.<\/center>/ },

# input name="txthomepassword"
{ :text=>'<input name="txthomepassword" type="password"  size="22" id="txthomepassword" maxlength="200" />' },

# TD class="tdi-errormessage" + JavaScript
{ :text=>'align=center class="tdi-errormessage" style="height: 25px"><script type="text/javascript">showerror();</script></td>' },

# HTML Comment
{ :text=>'<!--To reduce the gap between banner and content the below if condition is added-->' },

# Redirect Page # iframe
{ :text=>'<iframe onload="postload(0);" scrolling="no" style="position:absolute;top:0;left:0;height:0;width:0;" id="fraLH" name="fraLH" src="default.aspx" frameborder="0" marginheight="0" marginwidth="0"></iframe>' },

]

end

