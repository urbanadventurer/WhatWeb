##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WSN-Classifieds" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "WSN Classifieds gives you a powerful classified ads site. The vast array of features make it easy to make money from sponsored listings. Translate to any language and easily customize fields and functionality."
website "http://www.wsnclassifieds.com/"

# Google results as at 2011-03-16 #
# 3 for "WSN Classifieds" inurl:"adminlogin.php"



# Matches #
matches [

# Admin Page # Title # adminlogin.php
{ :text=>'<title>WSN Classifieds Admin Login</title>' },
{ :text=>'<title>WSN Classifieds Administration Panel</title>' },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)" style="margin-left: 8px;">WSN Classifieds ([\d\.]+) Admin Login<\/span>/, :offset=>1 },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)">WSN Classifieds ([\d\.]+) Admin Panel<\/span>/, :offset=>1 },

# HTML Comment # Shared with other WSN Software products
{ :certainty=>25, :text=>'<!-- place any jquery-dependent script tags that need to be before the /head tag in here -->' },

# boxtitle # Shared with other WSN Software products
{ :certainty=>25, :regexp=>/<div class="boxtitle" on[c|C]lick="minmax\('[a-z]+box'\)"><img src=/ },

# License Agreement # setup.php
{ :text=>'<textarea readonly rows="20" cols="75">WSN Classifieds License Agreement' },

]

end

