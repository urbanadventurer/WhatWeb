##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "STRATO-Newsletter-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-02
version "0.1"
description "STRATO Newsletter Manager - Requires PHP"
website "http://www.strato-cgi.de/"

# Google results as at 2012-05-02 #
# 266 for inurl:"newsletter.php.cgi"

# Dorks #
dorks [
'inurl:"newsletter.php.cgi"'
]



# Matches #
matches [

# transparent120x94.gif HTML
{ :text=>'<td><img src="http://strato.de/cgi2004/cgi2.0/images/transparent120x94.gif" alt="CGI 2004" /></td>' },

# Title
{ :certainty=>75, :text=>'<title>STRATO Newsletter Manager</title>' },

]

end

