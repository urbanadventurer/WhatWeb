##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WSN-Software-Directory" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "WSN Software Directory is a full-featured software respository script. Run your own download.com or hotscripts type of website. Take full advantage of the PAD file format for easy maintenance. Translate to any language and easily customize fields and functionality."
website "http://www.wsnsoftwaredirectory.com/"



# Matches #
matches [

# Admin Page # Title # adminlogin.php
{ :text=>'<title>WSN Software Directory Admin Login</title>' },
{ :text=>'<title>WSN Software Directory Administration Panel</title>' },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)" style="margin-left: 8px;">WSN Software Directory ([\d\.]+) Admin Login<\/span>/, :offset=>1 },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)">WSN Software Directory ([\d\.]+) Admin Panel<\/span>/, :offset=>1 },

# HTML Comment # Shared with other WSN Software products
{ :certainty=>25, :text=>'<!-- place any jquery-dependent script tags that need to be before the /head tag in here -->' },

# boxtitle # Shared with other WSN Software products
{ :certainty=>25, :regexp=>/<div class="boxtitle" on[c|C]lick="minmax\('[a-z]+box'\)"><img src=/ },

# License Agreement # setup.php
{ :text=>'<textarea readonly rows="20" cols="75">WSN Software Directory License Agreement' },

]

end

