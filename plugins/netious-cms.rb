##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netious-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.1"
description "Netious CMS - http://www.netious.com/"

# 32 results for "Powered by netious.com" @ 2010-08-08

# Dorks #
dorks [
'"Powered by netious.com"'
]



matches [

{ :text=>'&nbsp; &nbsp; Powered by <a href="http://www.netious.com" title="Netious.com - free scripts, CMS-based internet services, RSS editors">netious.com</a>' },

{ :text=>'&nbsp; &nbsp; Powered by <a href="http://www.netious.com" title="Netious.com - free scripts, CMS-based services, RSS editors">netious.com</a>' },

{ :text=>'<center><a href="../" title="Home page"><b class=visible>Go back to the home page of the service</b></a></center>' },

{ :text=>'<title>CMS - powered by netious.com</title>' },

{ :text=>'&nbsp; &nbsp; Powered by <a href="http://pl.netious.com" title="Netious.com - Polska. Darmowe strony internetowe z CMS.">netious.com</a>' },

]

end

