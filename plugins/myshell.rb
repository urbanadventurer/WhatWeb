##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MyShell" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-21
version "0.1"
description "MyShell - PHP powered shell"

# 4 for intitle:"MyShell 1.1.0 build 20010923" -intitle

# Dorks #
dorks [
'intitle:"MyShell 1.1.0 build 20010923" -intitle'
]



# Matches #
matches [

# Default copyright footer
{ :text=>'&nbsp;| ::::::::::&nbsp;<a href="http://www.digitart.net" target="_blank" style="text-decoration:none"><b>MyShell</b> &copy;2001 Digitart Producciones</a>' },

# Version Detection # Title
{ :version=>/<title>MyShell ([\d\.]+ build [\d]{8})<\/title>/ },

]

end


