##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ezBOO-WebStats" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.1"
description "ezBOO WebStats is a high level statistical tool for web sites monitoring."
website "http://www.ezboo.com/softs/"

# 624 results for +"Administrator Panel" +intitle:"ezBOO WebStats" @ 2010-06-05

# Dorks #
dorks [
'"Administrator Panel" intitle:"ezBOO WebStats"'
]



# Matches #
matches [

# GHDB # Administrator Panel title
{ :certainty=>75, :ghdb=>'+"Administrator Panel" +intitle:"ezBOO WebStats"' },

# default title
{ :text=>'<title>ezBOO WebStats</title>' },

# Administrator Panel html
{ :text=>'<div align="center" class="titre"><font color="#FFFFFF">&gt;&gt; Administrator Panel        &lt;&lt; </font></div>' },

# default logo
{ :text=>'<td height="60" valign="top" align="center"><img src="image/logo_ez1.gif" border="0"></td>' },

]

end

