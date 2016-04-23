##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SillySmart" do
author "Guillaume Delacour <gui@iroqwa.org>" # 2015-07-09
version "0.1"
description "SillySmart is a lightweight and flexible MVC Framework written in PHP5 based on XML/XSL's parsing."

# Dorks #
dorks [
'intext:"var slsBuild ="',
]

# Matches #
matches [
{ :certainty=>85, :text=>'var slsBuild' },
]

end
