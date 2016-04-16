##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RIPS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-25
version "0.1"
description "RIPS - A static source code analyser for vulnerabilities in PHP scripts"
website "http://sourceforge.net/projects/rips-scanner/"

# Google results as at 2012-03-25 #
# 4 for intitle:"RIPS - A static source code analyser for vulnerabilities in PHP scripts" "Quickstart" "Locate your PHP path/file"

# Dorks #
dorks [
'intitle:"RIPS - A static source code analyser for vulnerabilities in PHP scripts" "Quickstart" "Locate your PHP path/file"'
]



# Matches #
matches [

# Version Detection
{ :version=>/<div class="logo"><a id="logo" href="http:\/\/sourceforge\.net\/projects\/rips-scanner\/files\/" target="_blank" title="get latest version">([^<^\s]+)<\/a><\/div>/ },

# input type="checkbox" id="subdirs"
{ :text=>'<td nowrap><input type="checkbox" id="subdirs" value="1" title="check to scan subdirectories" />subdirs</td>' },

]

end

