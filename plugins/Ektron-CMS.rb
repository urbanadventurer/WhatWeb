##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ektron-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-09
version "0.1"
description "Ektron provides web content management and social software. Ektron's primary product is CMS400.NET, which is built on the Microsoft .NET Framework. - Homepage: http://www.ektron.com/"

# ShodanHQ results as at 2011-08-09 #
# 1,922 for ecm username site_id isMembershipUser

# Google results as at 2011-08-09 #
# 104 for inurl:/workarea/java/ +ektron

# Dorks #
dorks [
'inurl:/workarea/java/ +ektron'
]

# Examples #
examples %w|
www.ektron.com
66.185.255.217
207.108.129.38
89.234.35.90
74.217.101.199
208.88.128.138
199.79.226.194
207.22.66.77
208.88.128.41
65.221.153.104
38.115.144.4
|

# Matches #
matches [

# EktGUID Cookie
{ :search=>"headers[set-cookie]", :regexp=>/EktGUID=[a-f\d]{8}-[a-f\d]{4}-[a-f\d]{4}-[a-f\d]{4}-[a-f\d]{12}; expires=/ }

# ecm Cookie
{ :search=>"headers[set-cookie]", :regexp=>/ecm=user_id=[\d]+&isMembershipUser=[\d]+&site_id=&username=&new_site=[^&]+&unique_id=[\d]+&site_preview=[\d]+&langvalue=[\d]+&DefaultLanguage=[\d]+/ }

# JavaScript
{ :text=>'<script id="EktronJS" type="text/javascript" src="/WorkArea/java/ektron.js">' },

# JavaScript
{ :text=>'<script id="EktronRegisteredJs" type="text/javascript" src="/workarea/java/ektronJs.ashx?id=' },

# JavaScript
{ :text=>'<script id="EktronModalJS" type="text/javascript" src="/WorkArea/java/plugins/modal/ektron.modal.js">' },

]

end

