##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "Kayako-SupportSuite" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-24
version "0.2"
description "We offer all of our helpdesk solutions as licensed products (install and host it yourself) or as help desk hosting services."
website "http://www.kayako.com/"

# Google results as at 2010-09-24 #
# 314 for "powered by Kayako eSupport"

# Dorks #
dorks [
'"powered by Kayako eSupport"'
]



# Matches #
matches [

# Default title
{ :text=>' - Powered By Kayako eSupport</title>' },

# Login page # Powered by text
{ :regexp=>/<span class="smalltext"><font color="#333333">Powered by e(Support|SupportSuite)<br\/>Copyright &copy; 2001-[0-9]{4} Kayako Infotech Ltd.<\/font><\/span><br \/>/ },

# Version Detection
{ :version=>/<a href="http:\/\/www.kayako.com" target="_blank">Help Desk Software By Kayako eSupport v([\d\.]+)<\/a>/ },

{ :version=>/<a href="http:\/\/www.kayako.com" target="_blank" title="Help Desk Software">Help Desk Software<\/a>&nbsp;by Kayako SupportSuite v([\d\.]+)/ },

{ :version=>/<td width="144" align="left" valign="top"><span class="smalltext"><font color="#333333">([\d\.]+)<\/font><\/span><\/td>/ },

]

end

