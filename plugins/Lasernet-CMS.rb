##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lasernet-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-10
version "0.1"
description "Lasernet CMS"
website "http://lasernet.gr/cms.php"

# Google results as at 2011-08-10 #
# 53 for intext:"Powered by Lasernet" -intext

# Dorks #
dorks [
'intext:"Powered by Lasernet" -intext'
]



# Matches #
matches [

# table
{ :regexp=>/<table width="100%" height="1[\d]{2}" border="0" cellpadding="0" cellspacing="0" background="images\/headers\/[^"^\/^>]* ">/ },

# Powered by text
{ :regexp=>/<font size="1" face="Verdana, Arial, Helvetica, sans-serif">Powered by<\/font><\/font>[\s]+<a href="http:\/\/lasernet\.gr"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Lasernet<\/font><\/a>[\s]+<\/td>/ },

]

end

