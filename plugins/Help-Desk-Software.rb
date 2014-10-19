##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Help-Desk-Software" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-24
version "0.1"
description "Help Desk Software - a simple yet powerful helpdesk solution - Requires: PHP and MySQL"
website "http://freehelpdesk.org/"

# 5 for "powered by freehelpdesk.org" intitle:"Help Request System"

# Dorks #
dorks [
'"powered by freehelpdesk.org" intitle:"Help Request System"'
]



# Matches #
matches [

# Version Detection # Admin Page # Powered by footer
{ :version=>/<div class="AdminTDSmall">[\s]+powered by <a href="http:\/\/freehelpdesk\.org\/\?ver=([^"^>^\s]+)" target="_blank">freehelpdesk\.org<\/a>[\s]+<\/div>/ },

# Version Detection # Admin Page # </html> + <font>
{ :version=>/<\/html>[\s]+<font style='font-size:0px'>([^<^\s]+)<\/font>/ },

]

end

