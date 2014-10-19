##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Truition" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-30
version "0.1"
description "CDC eCommerce - On Demand eCommerce and Online Auction Software - formerly Truition"
website "http://www.truition.com/"

# Google results as at 2011-01-30 #
# 28 for "powered by Truition" inurl:ExecMacro inurl:cgi-bin

# Dorks #
dorks [
'"powered by Truition" inurl:ExecMacro inurl:cgi-bin'
]



# Matches #
matches [

# Default Menu HTML
{ :text=>'<A HREF="/cgi-bin/ncommerce3/ExecMacro/search.d2w/report?wl=151">Search</A>&nbsp;|&nbsp;' },

# FAQ # HTML Comment
{ :text=>"<!--Logon Information-faq answers below-->" },

# URL pattern and extention
{ :ghdb=>'inurl:"/cgi-bin/ncommerce3/ExecMacro/static/" filetype:d2w' },

# Missing file message
{ :text=>'<li>DTWF050E: Net.Data is unable to locate the HTML block specification in the URL.' },

# Missing macro message
{ :text=>'<li>DTWP001E: Net.Data is unable to locate the macro file' },

# Redirect Page # Default JavaScript
{ :text=>'location.href = "/cgi-bin/ncommerce3/ExecMacro/static/' },

]

end


