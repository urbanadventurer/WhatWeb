##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Seditio" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Seditio"
website "http://www.neocrome.net"



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="Seditio by Neocrome http://www.neocrome.net" />' },

# Powered by text
# A Seditio Licence is required if you running a commercial or profitable website, and/or to remove the link "Powered by Seditio" in the footer

{ :text=>'<a href="http://www.neocrome.net">Powered by Seditio</a><br />' },
{ :text=>'<br />Powered by <a href="http://www.neocrome.net" target="_blank">Seditio</a>' },

]

end


