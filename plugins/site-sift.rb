##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches
##
Plugin.define "Site-Sift" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-29
version "0.2"
description "Site Sift Listings is a FREE directory script with many features that webmasters want including creation of static pages. Site Sift Listings can be customized to create the look and feel you want from a directory. Requirements: PHP."
website "http://scripts.site-sift.com/"

# 96 results for "powered by Site Sift" -exploit -"SQL Injection" @ 2010-06-29
# 148 results for inurl: "index php go addpage" @ 2010-06-29
# 68 results for inurl: "index.php?go=detail id=" @ 2010-06-29

# Dorks #
dorks [
'inurl: "index php go addpage"',
'"powered by Site Sift" -exploit -"SQL Injection"'
]



matches [

# URL patterns
{ :certainty=>25, :ghdb=>'inurl: "index.php?go=detail id="' },
{ :certainty=>25, :ghdb=>'inurl: "index php go addpage"' },

# Powered by text
{ :certainty=>25,:ghdb=>'"powered by Site Sift"' },
{ :regexp=>/<div align="center" class="copyright">powered by <A class="bottomlink" href="http:\/\/[scripts|www]+.site-sift.com[\/]*">Site Sift[^<]*<\/A><\/div>/i },

# Default HTML comments
{ :text=>'				<!-- end of header.php -->' },
{ :text=>'				<!-- begin of footer.php -->' },

]

end

