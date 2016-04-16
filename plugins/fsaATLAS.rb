##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "fsaATLAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-29
version "0.1"
description "fsaAtlas is an international student and scholar management system."
website "http://www.sungardhe.com/Solutions/fsaATLAS/"

# Google results as at 2012-01-29 #
# 7 for intitle:"fsaATLAS Enterprise"

# Dorks #
dorks [
'intitle:"fsaATLAS Enterprise"'
]



# Matches #
matches [

# Login Page # Title # Version Detection
{ :version=>/<title>fsaATLAS Enterprise v\.([^\s^<]+)<\/title>/ },

# Login Page # Logo HTML # Version Detection
{ :version=>/<div style="position:absolute; width:100px; top:0px; right:0px"><img src="images\/fsaatlastext\.png" alt="fsaATLAS Enterprise v\.([^\s^"]+)"\/><\/div>/ },

# Login Page # Form
{ :text=>'<form action="LoginFinish.asp" method="post" name="MainForm">' },

# Login Page # HTML Comment
{ :text=>'<!-- AP - 06/02/2009 - Defect 1533 - Campus DataLink Link not appearing at the top navigation bar-->' },

]

end

