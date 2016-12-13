##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LISTSERV" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-02
version "0.1"
description "LISTSERV launched the email list management industry in 1986 and remains the industry standard. It provides the power, reliability and enterprise-level performance you need to manage all your opt-in email lists, including email newsletters, announcement lists, discussion groups and email communities."
website "http://www.lsoft.com/products/listserv.asp"

# Google results as at 2011-04-02 #
# 68 for "Server Administration" "List Management" "List Moderation" "Subscriber's Corner" "Email Lists"

# Dorks #
dorks [
'"Server Administration" "List Management" "List Moderation" "Subscriber\'s Corner" "Email Lists"'
]



# Matches #
matches [

# CSS
{ :text=>'div.catalist h2 { font-family:times;  font-size:18pt; font-weight: bold; margin-bottom: }' },
{ :text=>'_white-space:pre;   /* IE only hack to re-specify in addition to word-wrap  */' },

# Powered by logo HTML
{ :text=>'alt="Powered by the LISTSERV Email List Manager" title="Powered by the LISTSERV Email List Manager" border="0"></a>' },

# Redirect Page # Title
{ :text=>'<TITLE>LISTSERV - Redirecting ...</TITLE>' },

# Version Detection # Title
{ :version=>/<title>Welcome to LISTSERV ([\d\.]+)<\/title>/ },

# Version Detection # Logo
{ :version=>/<a href="\/scripts\/wa.exe\?[^"]+"><img src="\/archives\/images\/b-[a-z]{0,2}version\.jpg" alt="LISTSERV ([\d\.]+)" title="LISTSERV [\d\.]+" border="0"><\/a><\/td>/ },

]

end


