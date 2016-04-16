##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WSN-Forum" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "WSN Forum is a complete, free, full-featured and multilingual discussion forum script. More than just a great forum, it includes instant messaging and chat room features out of the box."
website "http://www.wsnforum.com/"



# Matches #
matches [

# Admin Page # Title # adminlogin.php
{ :text=>'<title>WSN Forum Admin Login</title>' },
{ :text=>'<title>WSN Forum Administration Panel</title>' },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)" style="margin-left: 8px;">WSN Forum ([^<]+) Admin Login<\/span>/, :offset=>1 },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)">WSN Forum ([^<]+) Admin Panel<\/span>/, :offset=>1 },

# HTML Comment # Shared with other WSN Software products
{ :certainty=>25, :text=>'<!-- place any jquery-dependent script tags that need to be before the /head tag in here -->' },

# boxtitle # Shared with other WSN Software products
{ :certainty=>25, :regexp=>/<div class="boxtitle" on[c|C]lick="minmax\('[a-z]+box'\)"><img src=/ },

# License Agreement # setup.php
{ :text=>'<textarea readonly rows="20" cols="75">WSN Forum License Agreement' },

]

end

