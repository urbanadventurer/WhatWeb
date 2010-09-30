##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AContent" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.1"
description "AContent  is an open source learning content authoring system and respository used to create interoperable, accessible, adaptive Web-based learning content. - homepage: http://www.atutor.ca/acontent/"

# 1 result for intitle:"AContent: Learning Content Repository:" @ 2010-09-17
examples %w|
www.atutor.ca/acontent/demo.php
|

matches [

# Default title
{ :text=>'<title>AContent: Learning Content Repository:' },

# Login page
{ :text=>'<dt><span class="required" title="Required Field">*</span><label for="login">Login Name or Email</label></dt>' },

]


end

