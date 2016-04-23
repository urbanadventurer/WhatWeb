##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "cApexWEB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-19
version "0.1"
description "cApexWEB - web based Backoffice client"
website "http://www.capitalsoft.com/"

# Google results as at 2011-12-19 #
# 147 for "User Id" "Password" intitle:"cApexWEB"
#  87 for inurl:capexweb intitle:"cApexWEB"

# Dorks #
dorks [
'"User Id" "Password" intitle:"cApexWEB"'
]



# Matches #
matches [

# Frameset
{ :text=>'<frame name="main" src="capexmain_middle.htm" scrolling="no" target="_top">' },

# Title # Version Detection
{ :version=>/<title>cApexWEB ([^\s^<]+)<\/title>/ },

# ./capexmain_middle.htm # Login Page # HTML Comment
{ :text=>'<!-- Change Company & Address Line , Enter First Line for Company Name and 2nd Line of Address --->' },

# ./capexmain_middle.htm # Login Page # dfcode
{ :string=>/<input type="hidden" value="([^\s^"^>]+)"  name="dfcode">/ },

# ./capexmain_middle.htm # Login Page # database
{ :string=>/<input type="hidden" name="dfparentdb" value="([^\s^"^>]+)">/ },

# ./capexmain_middle.htm # Login Page # datbase ip
{ :string=>/<input type="hidden" name="dfparentip" value="([^\s^"^>]+)">/ },

# ./capexmain_middle.htm # Login Page # Form
{ :text=>'<td><form method="post" name="parentpage" action="../servlet/capexweb.parentvalidatepassword">' },
{ :text=>'<form method="post" action="../servlet/capexweb.parentvalidatepassword">' },

# ./capexmain_middle.htm # Login Page # JavaScript
{ :text=>'var winPop = window.open("../servlet/capexweb.parentvalidatepassword?dfuserid="+dfuserid.value+"&dfpassword="+dfpassword.value+"&dfparentip="+dfparentip.value+"&dfparentdb="+dfparentdb.value+"&dfcode="+dfcode.value+"","mywin","width=550,height=550,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,fullscreen=yes");' },

]

end

