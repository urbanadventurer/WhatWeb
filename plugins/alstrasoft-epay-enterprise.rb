##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AlstraSoft-EPay-Enterprise" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-07
version "0.1"
description "AlstraSoft EPay Enterprise - peer to peer payment system - Requires PHP and MySQL"
website "http://www.alstrasoft.com/epay_enterprise.htm"

# ShodanHQ results as at 2011-12-07 #
# 3 for ln=English PHPSESSID

# Google results as at 2011-12-07 #
# 39 for "Powered by EPay Enterprise"
# 14 for "Powered by EPay Enterprise" inurl:"shop.htm?cid="

# Dorks #
dorks [
'"Powered by EPay Enterprise" inurl:"shop.htm?cid="'
]



# Matches #
matches [

# Powered by EPay Enterprise
{ :text=>'<a class=copy href="http://www.alstrasoft.com/" target="_blank">Powered by EPay Enterprise.</a>&nbsp;' },

# ln Cookie
{ :search=>"headers[set-cookie]", :regexp=>/ln=English/, :certainty=>25 },

# Submit button
{ :text=>' <tr><td align=center><input class=submit type=submit name=send value="LOGIN NOW!"></td></tr>' },

# ./shop.htm # Top Categories link
{ :text=>"<tr><td class=capl><a href='/shop.htm?action=view'>TOP CATEGORIES</a>&nbsp;&nbsp;&gt;&gt;&nbsp;" },

]

end

