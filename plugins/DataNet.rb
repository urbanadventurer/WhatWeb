##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DataNet" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-23
version "0.1"
description "DataNET is a complete end-to-end system consisting of IP packet data routing server software called DataGate, which links to one or more client programs such as Datalink's DataHost, or third-party software connected over the Internet or Intranet."
website "http://www.datalinksystemsinc.com/software.html"

# Google results as at 2011-09-23 #
# 5 for intitle:"DataNet Tracking System Login" "DataNet Tracking System." "User Name" "Password"

# Dorks #
dorks [
'intitle:"DataNet Tracking System Login" "DataNet Tracking System." "User Name" "Password"'
]



# Matches #
matches [

# Login Page # Version Detection
{ :version=>/<td><input class="txt" onkeypress='return keyPress\(this,event\);' type='password'( maxlength='10')? id='password'><\/td><\/tr>[\s]+<tr><td class="ver">\(Version ([^\s^<]+)\)<\/td>/, :offset=>1 },

# Login Page
{ :text=>'<div class="scada"><a class="scada" href=\'/scada\'>DataNet Scada Interface</a></div></body>' },

]

end

