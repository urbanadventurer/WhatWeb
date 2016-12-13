##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "KMSoft-Guestbook" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.1"
description "Guestbook"
website "http://www.kmsoft.org/"

# 2 results for "KMSoft Guestbook" inurl:form.asp

# Dorks #
dorks [
'"KMSoft Guestbook" inurl:form.asp'
]



# Matches #
matches [

# Version detection # Powered by text
{ :version=>/<div id="footer">KMSoft Guestbook v ([\d\.]+) Powered by <a href="http:\/\/www.kmsoft.org[\/]*">KMSoft<\/a><\/div>/ },

# Version detection # Powered by text
{ :version=>/<title>KMSoft Guestbook v([\d\.]+)[^<]+<\/title>/ },

]

end

