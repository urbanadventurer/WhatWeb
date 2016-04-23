##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WSN-Knowledge-Base" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "WSN Knowledge Base is an article directory script. It can autopost whole feeds of prepared content, be employed as a CMS, or be used as a simple knowledge base. The rich text editor allows easy composition. WSN KB offers a vast array of features and the option to translate to any language."
website "http://www.wsnkb.com/"

# Google results as at 2011-03-16 #
# 1 for "WSN Knowledge Base" inurl:adminlogin.php



# Matches #
matches [

# Admin Page # Title # adminlogin.php
{ :text=>'<title>WSN Knowledge Base Admin Login</title>' },
{ :text=>'<title>WSN Knowledge Base Administration Panel</title>' },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)" style="margin-left: 8px;">WSN Knowledge Base ([^<]+) Admin Login<\/span>/, :offset=>1 },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)">WSN Knowledge Base ([^<]+) Admin Panel<\/span>/, :offset=>1 },

# HTML Comment # Shared with other WSN Software products
{ :certainty=>25, :text=>'<!-- place any jquery-dependent script tags that need to be before the /head tag in here -->' },

# boxtitle # Shared with other WSN Software products
{ :certainty=>25, :regexp=>/<div class="boxtitle" on[c|C]lick="minmax\('[a-z]+box'\)"><img src=/ },

# License Agreement # setup.php
{ :text=>'<textarea readonly rows="20" cols="75">WSN Knowledge Base License Agreement' },

]

end

