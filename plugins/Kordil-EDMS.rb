##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kordil-EDMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Kordil EDMS - Electronic Document Management System"
website "http://www.kordil.com/"

# ShodanHQ results as at 2012-08-26 #
# 15 for location kordil_edms/documents.php

# Google results as at 2012-08-26 #
# 6 for intitle:"Login settings" "Kordil EDMS Official Website"

# Dorks #
dorks [
'intitle:"Login settings" "Kordil EDMS Official Website"'
]



# Matches #
matches [

# / # JavaScript
{ :text=>'stm_aix("p6i3","p1i0",[0," Kordil EDMS\\\' website","","",-1,-1,0,"http://www.kordil.net"],150,20);' },

# / # Location Header
{ :search=>"headers[location]", :regexp=>/https?:\/\/[^\/]+kordil_edms\/documents\.php$/ },

# /favicon.ico
{ :url=>"/favicon.ico", :md5=>"629ccc774aed95b2c6bec91151f7292d" },

# /kordil_edms/global_group_login.php # Version Detection
{ :version=>/<center><font face="Arial" size="2">Kordil EDMS v([^<]+)<\/font><\/center>/ },

]

end

