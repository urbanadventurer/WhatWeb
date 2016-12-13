##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eTicket" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-15
version "0.1"
description "eTicket is a PHP-based electronic support ticket system that can receive tickets via email (pop3/pipe) or a web form."
website "http://www.eticketsupport.com/"

# Google results as at 2012-09-15 #
# 523 for "Powered by eTicket" "Support Ticket System"

# Dorks #
dorks [
'"Powered by eTicket" "Support Ticket System"'
]



# Matches #
matches [

# Powered by footer
{ :regexp=>/<td><a href="(http:\/\/)?www\.eticketsupport\.com" target="_blank">Powered by eTicket<\/a><\/td>/ },

# Footer
{ :text=>'<div class="pre-footer">Support Ticket System</div>' },

# Stylesheet
{ :text=>'<link rel="stylesheet" href="themes/eticket/style.css" type="text/css">' },

# ./readme.html
{ :text=>'<p><strong>Note:</strong> &quot;/path/to/automail.pl&quot; should be the <a href="http://en.wikipedia.org/wiki/Full_path">full path</a>' },

]

end

