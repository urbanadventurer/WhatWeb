##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Parature" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-29
version "0.1"
description "Parature - web-based customer service software combine"
website "http://www.parature.com/"

# Google results as at 2012-07-29 #
# 379 for "Help Desk and Customer Support Software by Parature" inurl:"ics/support/default.asp"

# Dorks #
dorks [
'"Help Desk and Customer Support Software by Parature" inurl:"ics/support/default.asp"'
]



# Matches #
matches [

# NoScipt
{ :text=>'This Website requires your browser to be JavaScript enabled. Please enable JavaScript  and click <a href="/ics/default.asp">here</a> to continue.' },

# HTML Comment
{ :string=>/<\!\-\- \*\*\*\*\*\* (PRODAPP[^\s]+) *\*\*\*\*\* \-\->/ },

# JavaScript
{ :version=>/<!--<script src="\.\.\/ic1Browser\.js\?ver=([^"]+)"><\/script>-->/ },

# JavaScript # RedirectPortalURL
{ :certainty=>75, :text=>"RedirectPortalURL('/ics/support/custhandler.asp?task=signOut&redirectURL=' + encodeURI('" },

# Frame title="Left Navigation"
{ :text=>'<frame title="Left Navigation" name="cypLeft" src="KBFolder.asp?deptID=' },

# Invalid deptID in URL. Please make sure you have the entire, correct URL.
{ :md5=>"5b5120dc4f0bb058180da4361ac8fd70" },

]

end

