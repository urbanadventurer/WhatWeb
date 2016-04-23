##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Epiware" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-16
version "0.1"
description "Epiware - Enterprise Document Management"
website "http://www.epiware.com/"

# Google results as at 2012-09-16 #
# 31 for intitle:"Epiware" "This web-site requires javascript. Please enable javascript to access this web-site."

# Dorks #
dorks [
'intitle:"Epiware" "This web-site requires javascript. Please enable javascript to access this web-site."'
]



# Matches #
matches [

# Login Page # Version Detection
{ :version=>/<div id="masthead"><a href="http:\/\/www\.epiware\.com">Epiware<\/a><\/div>\s+<span class="version">version ([^<^\s]+)<\/span>/ },

# Title
{ :text=>'<title>Epiware - Project and Document Management  </title>' },

# NoScript
{ :regexp=>/<div id="jsWarning" class="javascript_warning">\s+This web-site requires javascript\.\s+Please enable javascript to access this web-site\.\s+<\/div>/ },

]

end

