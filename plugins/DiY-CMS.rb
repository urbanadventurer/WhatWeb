##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "DiY-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.2"
description "Do It Yourself Content Management System is a feature-rich, php-built, mysql-based, opensource and free CMS."
website "http://www.diy-cms.com/"

# Google results as at 2010-09-17 #
# 41 results for "powered by DiY-CMS"
# 6  results for intitle:"DIY-CMS Database Error"

# Dorks #
dorks [
'"powered by DiY-CMS"',
'intitle:"DIY-CMS Database Error"'
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by: <a href="http://www.diy-cms.com" target="_blank">DIY-CMS</a>' },
{ :text=>'<a href="http://www.pghost.eu/14/18/diy_cms-25.html">Powered by DIY-CMS</a>' },

# Error Page # Default Title
{ :text=>'<title>DIY-CMS Database Error</title>' },

# Error Page # Powered by text
{ :text=>'<p><b><a href="http://www.diy-cms.com/" target="_blank">Powered by: DIY-CMS</a></b></p></body></html>' },

# Admin Page # Default logo HTML
{ :text=>"<td valign='middle'><img border='0' src=\"admin_skin/default/images//admin_login.png\"></a></td>" },

# Version Detection # Meta generator
{ :version=>/<META content="Powered by DiY-CMS ([\d\.]+) [0-9]{4} " name="description">/ },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.pghost.eu[^>]+>DIY-CMS v ([\d\.]+)<\/a>/ },

]

end

