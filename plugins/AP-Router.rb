##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AP-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-14
version "0.1"
description "AP Router [Brazilian]"
website "http://aprouter.com.br/"

# Google results as at 2011-08-14 #
# 66 for intitle:"AP Router New Generation" +Sistema

# Dorks #
dorks [
'intitle:"AP Router New Generation" "Sistema"'
]



# Matches #
matches [

# Frameset
{ :text=>'<frame marginwidth="5" marginheight="5" src="menu_empty.html" name="menu" noresize scrolling="auto" frameborder="0">' },

# Firmware Version Detection # /status.asp
{ :url=>"/status.asp", :firmware=>/<td width=49% bgcolor="#EEEEEE"><strong>Vers&atilde;o do Firmware<\/strong><\/td>[\s]+<td width=51% bgcolor="#EEEEEE">[\s]+v([^\s]+)[\s]+<\/td>[\s]+<\/tr>/ },

# MAC Address Detection # /status.asp
{ :url=>"/status.asp", :string=>/<td width=49% bgcolor="#EEEEEE"><strong>MAC da Wireless<\/strong><\/td>[\s]+<td width=51% bgcolor="#EEEEEE">[\s]+([a-f\d:]{17})[\s]+<\/td>[\s]+<\/tr>/ },
{ :url=>"/status.asp", :string=>/<td width=49% bgcolor="#EEEEEE"><strong>Endere&ccedil;o[\s]+MAC<\/strong><\/td>[\s]+<td width=51% bgcolor="#EEEEEE">[\s]+([a-f\d:]{17})[\s]+<\/td>[\s]+<\/tr>/ },

]

end

