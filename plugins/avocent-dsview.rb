##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Avocent-DSView" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-24
version "0.1"
description "Avocent DSView 3 management software provides data centers with secure, out-of-band, centralized management for all connected IT and network devices."
website "http://www.avocent.com/Products/Category/Data_Center_Management_Software/DSV3_Software.aspx"
# Data Sheet: http://www.avocent.com/WorkArea/linkit.aspx?LinkIdentifier=id&ItemID=13669

# ShodanHQ results as at 2011-11-24 #
# 1 for Avocent DSView

# Google results as at 2011-11-24 #
# 11 for inurl:"dsview/nmmhelp-index.do"
# 11 for intitle:"Avocent DSView 3" intext:"Avocent DSView 3" "Point and Click Access and Control"
#  1 for intitle:"DSWebview" "Password" "Domain"

# Dorks #
dorks [
'inurl:"dsview/nmmhelp-index.do"'
]



# Matches #
matches [

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/^Avocent DSView [\d]\/([^\s]+)$/ },

# StyleSheet
{ :text=>'<link rel="stylesheet" type="text/css" href="/dsview/scheme-1.css" title="Default" />' },

# /dsview/images/favicon.ico
{ :url=>"/dsview/images/favicon.ico", :md5=>"9de6b6b67f27e264ff7d82ae071cec3f" },

# /dsview/protected/login.do # form
{ :text=>'<form name="loginForm" method="post" action="/dsview/protected/login.do" class="form-block"><span id=\'propertiesForm\'></span>' },

# /dsview/protected/login.do # Version Detection
{ :url=>"/dsview/protected/login.do", :version=>/<div class="standard-footer">[\s]+This software is protected by all U\.S\. and international copyright law and is subject to the terms and conditions of the <a class="standard-footer highlight" href="\/dsview\/[^"]+" target="dsvieweula">Avocent DSView [\d\.]+ (Software )?End User License Agreement<\/a>\.[\s]+<\/div>[\s]+Version: ([^\s]+)/, :offset=>1 },

# Module # DSWebview # Version Detection
{ :module=>/<!-- TITLE -->[\s]+<title>[\s]+(DSWebview [\d\.]+)[\s]+<\/title>[\s]+<!-- AVOCENT ICON -->/ },

]

end

