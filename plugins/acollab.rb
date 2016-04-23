##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ACollab" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.1"
description "ACollab is an accessible, open source, multi-group, Web-based collaborative work environment. ACollab is available as a work groups addon for ATutor 1.4+ , and as a standalone collaborative work environment that will run on its own."
website "http://www.atutor.ca/acollab/"

# Google results as at 2010-09-17 #
# 7 for intitle:"ACollab : Accessible Collaboration Environment:"

# Dorks #
dorks [
'intitle:"ACollab : Accessible Collaboration Environment:"'
]



matches [

# Default title
{ :text=>'<title>ACollab : Accessible Collaboration Environment:' },

]


end

