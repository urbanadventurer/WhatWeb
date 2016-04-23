##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NoticeBoardPro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-19
version "0.1"
description "NoticeBoardPro is an online, web-based, notice board system"
website "http://www.noticeboardpro.com/"

# Google results as at 2011-05-19 #
# 5 for inurl:viewAll.php?startnum
# 7 for +noticeboard "View All Items" "View Items by Category"
# 4 for inurl:viewAllOutline.php

# Dorks #
dorks [
'"noticeboard" "View All Items" "View Items by Category"'
]



# Matches #
matches [

# Version Detection # copyright footer
{ :version=>/<td align="center" colspan="4" height="38" width="572" bgcolor="#f5f5dc"><p class="copy">Version ([\d\.]+) -/ },

# Register link
{ :text=>'<A HREF="registerOutline.php" CLASS="Xref" style="margin-right:10">[Register]</A>' },

# Log in link
{ :text=>'<A HREF="loginOutline.php" CLASS="Xref" style="margin-left:165; margin-right:10">[Sign In]</A>' },

]

end

