##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PhotoStore" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-05
version "0.1"
description "PhotoStore allows you to setup a complete photo selling website on your server or hosting space and in just minutes you can start selling photos on your website."
website "http://www.ktools.net/photostore/sell-photos-online/"

# 339 for "Powered By PhotoStore" "Sell Photos Online by Ktools.net LLC"
#   8 for "PhotoStore Version" inurl:login.php

# Dorks #
dorks [
'"Powered By PhotoStore" "Sell Photos Online by Ktools.net LLC"'
]



# Matches #
matches [

# PhotoStore # Powered by text
{ :text=>'Powered By <a href="http://www.ktools.net/photostore/index.php" title="Sell your photos online with PhotoStore, online proofing and sales." target="_blank"><u>PhotoStore | Sell Photos Online</u></a> by <a href="http://www.ktools.net" title="Ktools LLC" target="_blank"><u>Ktools.net LLC</u></a>' },

# PhotoShow # Powered by text
{ :text=>'Powered By <a href="http://www.ktools.net/photoshow/index.php" title="Show your photos online with PhotoShow, an online photo gallery." target="_blank"><u>PhotoShow | Photo Gallery</u></a> by <a href="http://www.ktools.net" title="Ktools LLC" target="_blank"><u>Ktools.net LLC</u></a>' },

# Search input
{ :text=>'<b>Search:</b> <input type="textbox" name="search" class="search_box">' },

# Version Detection # Login Page
{ :version=>/<td align="center" class="footer">PhotoStore Version[\s]+<b>([^<^\s]+)<\/b> Installed<\/td>/ },

# Login Page # form action="mgr_actions.php?pmode=login"
{ :text=>'<form action="mgr_actions.php?pmode=login" name="login_form" method="post">' },

# Login Page # body
{ :text=>'<body bgcolor="#13387E" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" onLoad="document.login_form.username.focus();">' },

]

end

