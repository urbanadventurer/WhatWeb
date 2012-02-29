##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-BladeCenter" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-15
version "0.1"
description "IBM BladeCenter blade server management console - Homepage: http://www-03.ibm.com/systems/bladecenter/index.html"

# User Guide #
# http://publib.boulder.ibm.com/infocenter/bladectr/documentation/topic/com.ibm.bladecenter.mgtmod.doc/44R5370.pdf

# Google results as at 2012-02-15 #
# 13 for intitle:"Log In" "Welcome to the Advanced Management Module"
#  1 for inurl:"/shared/userlogin.php" intitle:"Log In"

# Dorks #
dorks [
'intitle:"Log In" "Welcome to the Advanced Management Module"'
]

# Examples #
examples %w|
https://141.57.9.217/shared/userlogin.php
https://bladecenter003.vietlink.ca/
ibmblade.muvs.cvut.cz
119.147.115.144
218.6.16.62
218.6.16.63
58.223.251.157
www.renwick.co.za
www.office008.com
201.30.143.8
|

# Matches #
matches [

# /shared/ibmbch.png
{ :url=>"/shared/ibmbch.png", :md5=>"c24b87d43f33783193e98ac25fd016ee" },

# /shared/ibmbcs.png
{ :url=>"/shared/ibmbcs.png", :md5=>"f4f76aeba5ba885fac1d4e5bbe535f0f" },

# /shared/userlogin.php # Login Page # Logo HTML # Name
{ :string=>/<h1><img src="\/shared\/ibmbc[^\s^\.]+\.png" alt="IBM BladeCenter ([^\s^"]+) Advanced Management Module" border="0" \/><\/h1>/ },

# /shared/userlogin.php # Login Page # Logo HTML
{ :text=>'<h1><img src="/shared/ibmbc.png" alt="IBM BladeCenter Advanced Management Module" border="0" /></h1>' },

# /shared/userlogin.php # Login Page # Logo HTML
{ :text=>'<img id="logo" src="/shared/banner_logo.png" alt="IBM" width="41" height="15" />' },

# /shared/userlogin.php # Login Page # Form
{ :text=>'<form method="post" name="login" action="/shared/userlogin.php"><input type="hidden" name="SESSID"' },

# /shared/userlogin.php # Login Page # Rare (Old version?)
{ :text=>'<img src="/shared/banner_left.jpg" width=110 height=53 alt="banner" />' },

]

end

