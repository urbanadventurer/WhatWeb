##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LetoDMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-24
version "0.1"
description "LetoDMS is an open-source document-management-system based on PHP and MySQL published under the GPL. - Homepage: http://www.letodms.com/"

# ShodanHQ results as at 2012-08-24 #
# 30 for out/out.ViewFolder.php

# Google results as at 2012-08-24 #
# 84 for "letoDMS free document management system - www.letodms.com" "This is a classified area. Access is permitted only to authorized personnel"

# Dorks #
dorks [
'"letoDMS free document management system - www.letodms.com" "This is a classified area. Access is permitted only to authorized personnel"'
]

# Examples #
examples %w|
194.140.155.96
88.198.168.46
87.106.251.214
85.10.199.123
91.121.47.58
92.61.39.132
118.143.2.113
61.12.126.67
140.254.233.38
178.63.72.167
demo.letodms.com
webgamm.com/filebox/
www.graphskill.co.uk/LetoDMS/op/op.ViewOnline.php?documentid=49&version=1
www.hollowproject.com/FileStor/
courseping.com/leto/op/op.Login.php?login=guest
demos1.softaculous.com/LetoDMS/
https://www.crerrphc.org.au/dms/
|

# Matches #
matches [

# Login Page # Disclaimer Footer
{ :text=>'<div class="disclaimer">This is a classified area. Access is permitted only to authorized personnel. Any violation will be prosecuted according to the national and international laws.</div>' },

# Footer
{ :text=>'letoDMS free document management system - www.letodms.com</div></body>' },

# Location Header
{ :search=>"headers[location]", :regexp=>/out\/out\.ViewFolder\.php/ },

]

end

