##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ATutor" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.1"
description "ATutor is a free Open Source Web-based elearning environment designed with accessibility and adaptability in mind. - homepage: http://www.atutor.ca/"

# Google results as at 2010-09-17 #
# 34 for intitle:"ATutor: Learning Management System:"

# Dorks #
dorks [
'intitle:"ATutor: Learning Management System:"'
]



matches [

# Default title
{ :text=>'<title>ATutor: Learning Management System:' },

# Default meta generator
{ :text=>'<meta name="Generator" content="ATutor - Copyright 2010 by http://atutor.ca" />' },

# Default logo HTML
{ :text=>'<a href="http://www.atutor.ca/"><img src="/atutor/images/AT_Logo_1_sm.png"  alt="ATutor Logo" style="border:none;" /></a>' },

# Default Favicon
{ :md5=>"5b816961f19da96ed5a2bf15e79093cb", :url=>"/favicon.ico" },


]


end

