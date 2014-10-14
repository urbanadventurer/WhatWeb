##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches and version detection
##
Plugin.define "DUgallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.2"
description "DUgallery - PHP powered photo gallery."
website "http://www.duware.com/"

# Google results as at 2010-06-05 #
# 1,490 results for ext:asp inurl:DUgallery intitle:"3.0"

# Dorks #
dorks [
'ext:asp inurl:DUgallery intitle:"3.0"'
]



matches [

# GHDB Match # http://johnny.ihackstuff.com/ghdb/?function=detail&id=793
{ :ghdb=>'ext:asp inurl:DUgallery intitle:"3.0"', :version=>"3.0", :certainty=>75 },

# Default Title
{ :regexp=>/<title>DUgallery[^<]*<\/title>/ },

# Default Logo HTML
{ :text=>'<img src="assets/title.gif" alt="Powered by DUportal" width="269" height="62" border="0">' },

# Version detection # Default title
{ :version=>/<title>DUgallery ([\d\.]+)<\/title>/ },

]

end

