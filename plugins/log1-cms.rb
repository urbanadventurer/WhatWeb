##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Log1-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "The Idea of this CMS is simplicity and fast web development with no data base. Using log1CMS you can create one leveled-menu web page in 5 simple steps. Create menu using drag and drop feature and then edit files with TinyMCE WYSWIG editor."
website "http://log1cms.sourceforge.net/"

# Google results as at 2011-03-14 #
# 18 for "POWERED BY LOG1 CMS" -dork

# Dorks #
dorks [
'"POWERED BY LOG1 CMS" -dork'
]



# Matches #
matches [

# meta http-equiv Generator
{ :text=>'<meta http-equiv="Generator" content="log1_cms" />' },

# HTML Comment # Please don't "deleate" powered by link
{ :text=>'<!-- please do not deleate info below, thank you -->' },

# Powered by link
{ :text=>'<p>Powered by <a href="http://log1cms.sourceforge.net" target="_blank"> Log1 CMS</a></p>' },

# Admin Page # Title
{ :text=>'<title>log1 cms: Login as Admin to</title>' },

# Admin Page # CSS
{ :text=>'<link href="engine/styles/login.css.php" rel="stylesheet" type="text/css" />' },

# Admin Page # Logo HTML
{ :text=>'<img src="engine/images/logo.gif" alt="log1 CMS logo"/>' },

]

end


