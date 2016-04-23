##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Avaya-Aura-Utility-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Avaya Aura Utility Server"
website "http://www.avaya.com/"



# Matches #
matches [

# / # span class="vmsTitle"
{ :text=>'<span class="vmsTitle">Avaya Aura&#8482;&nbsp;Utility Server</span>' },

# / # help link
{ :text=>'<div id="topBar"><div id="topBarLeft"><a href="#" class="helpAndExit" onclick="window.open(\'/webhelp/Base/Utility_toc.htm' },

]

end

