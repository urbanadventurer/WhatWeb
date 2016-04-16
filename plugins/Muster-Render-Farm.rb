##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Muster-Render-Farm" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-08
version "0.1"
description "Muster is a render farm management system for film production, game development, and visual effect industry."
website "http://www.vvertex.com/products.php"

# ShodanHQ results as at 2011-12-08 #
# 1 for muster dologin.html

# Google results as at 2011-12-08 #
# 1 for intitle:"Muster 6 Integrated Web server login"
# 1 for intitle:"Muster" intitle:"Integrated Web server login"

# Dorks #
dorks [
'intitle:"Muster" intitle:"Integrated Web server login"'
]



# Matches #
matches [

# body # onLoad="init_page()" name="muster_login"
{ :text=>'<body onLoad="init_page()" name="muster_login" >' },

# /dologin.html # Version Detection # Title
{ :url=>"/dologin.html", :version=>/<title>Muster ([\d]+) Integrated Web server login<\/title>/ },

# /dologin.html # Applet
{ :text=>'<applet code="FileFolderSelector.class" archive="FileFolderSelector.jar" CODEBASE="js" id="FileSelector" name="FileSelector" width="1" height="1">' },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^cias-muster([\d])$/ },

]

end

