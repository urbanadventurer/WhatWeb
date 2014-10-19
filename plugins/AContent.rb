##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AContent" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.1"
description "AContent  is an open source learning content authoring system and respository used to create interoperable, accessible, adaptive Web-based learning content."
website "http://www.atutor.ca/acontent/"

# Google results as at 2010-09-17 #
# 1 for intitle:"AContent: Learning Content Repository:"

# Dorks #
dorks [
'intitle:"AContent: Learning Content Repository:"'
]



matches [

# Default title
{ :text=>'<title>AContent: Learning Content Repository:' },

# Login page
{ :text=>'<dt><span class="required" title="Required Field">*</span><label for="login">Login Name or Email</label></dt>' },

# Default Favicon
{ :md5=>"28c34462a074c5311492759435549468", :url=>"/favicon.ico" },

]


end

