##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WSN-Directory" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "WSN Directory is a powerful, translatable business directory script. Show google maps of business locations or search businesses by distance from your location. Make money with sponsored listings."
website "http://www.wsndirectory.com/"

# Google results as at 2011-03-16 #
# 1 for "WSN Directory" inurl:"adminlogin.php"



# Matches #
matches [

# Admin Page # Title # adminlogin.php
{ :text=>'<title>WSN Directory Admin Login</title>' },
{ :text=>'<title>WSN Directory Administration Panel</title>' },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(group|topbar)" style="margin-left: 8px;">WSN Directory ([\d\.]+) Admin Login<\/span>/, :offset=>1 },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(group|topbar)">WSN Directory ([\d\.]+) Admin Panel<\/span>/, :offset=>1 },

# HTML Comment # Shared with other WSN Software products
{ :certainty=>25, :text=>'<!-- place any jquery-dependent script tags that need to be before the /head tag in here -->' },

# boxtitle # Shared with other WSN Software products
{ :certainty=>25, :regexp=>/<div class="boxtitle" on[c|C]lick="minmax\('[a-z]+box'\)"><img src=/ },

# License Agreement # setup.php
{ :text=>'<textarea readonly rows="20" cols="75">WSN Directory License Agreement' },

]

end

