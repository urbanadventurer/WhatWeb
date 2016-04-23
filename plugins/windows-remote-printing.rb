##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Windows-Remote-Printing" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-19
version "0.1"
description "The Windows remote printing interface displays networked printers, print job owner usernames and internal IP addresses."

# 4 results for inurl:Printers/ipp_0001.asp intitle:"All Printers on"

# Dorks #
dorks [
'inurl:Printers/ipp_0001.asp intitle:"All Printers on"'
]



# Matches #
matches [

# GHDB
{ :ghdb=>'inurl:"Printers/ipp_0001.asp" intitle:"All Printers on"' },

# Frame src # /printers/ipp_0004.asp
{ :regexp=>/<frame src="ipp_000[\d]\.asp\?eprinter=/ },

]

end


