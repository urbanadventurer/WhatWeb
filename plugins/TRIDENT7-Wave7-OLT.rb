##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TRIDENT7-Wave7-OLT" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-11
version "0.1"
description "TRIDENT7 Wave7 optical line terminal (OLT)"
website "http://www.enablence.com/access/product-lines/trident7"

# ShodanHQ results as at 2012-05-11 #
# 5 for Wave7 Optics TRIDENT7



# Matches #
matches [

# Title
{ :text=>'<TITLE>Trident7 System Login</TITLE>' },

# Year Detection # Footer
{ :string=>/<TD VALIGN="bottom" COLSPAN=2><FONT SIZE=2 ALIGN="justify">&copy; (20[\d]{2}) Wave7 Optics, Inc\. All rights reserved\./ },

]

end

