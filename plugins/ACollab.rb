##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ACollab" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.1"
description "ACollab is an accessible, open source, multi-group, Web-based collaborative work environment. ACollab is available as a work groups addon for ATutor 1.4+ , and as a standalone collaborative work environment that will run on its own. - homepage: http://www.atutor.ca/acollab/"

# 7 results for intitle:"ACollab : Accessible Collaboration Environment:" @ 2010-09-17
examples %w|
www.atutor.ca/acollab/demo.php
dev.atutor.ca/acollab/demo.php
|

matches [

# Default title
{ :text=>'<title>ACollab : Accessible Collaboration Environment:' },

]


end

