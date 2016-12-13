##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FileVista" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-07
version "0.1"
description "FileVista is a web file manager for storing, managing and sharing files online through your web browser."
website "http://www.gleamtech.com/products/filevista/web-file-manager"

# Google results as at 2011-05-07 #
# 23 for "Welcome to FileVista" "Please enter your credentials:" "User name"

# Dorks #
dorks [
'"Welcome to FileVista" "Please enter your credentials:" "User name"'
]



# Matches #
matches [

# Version Detection # HTML comment
{ :version=>/<!--\r?\n\tFileVista v([\d\.]+)\r?\n\tCopyright / },

# Welcome to FileVista text
{ :text=>"<td>Welcome to FileVista<br />Please enter your credentials:</td>" },

]

end


