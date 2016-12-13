##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Auto-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "With Auto CMS you can have a website in 1 minute!, upload the package by FTP to your Hosting, and do click on simbol (*) in the footer, and enjoy of your own website, with the minimal requeriments for your presence on Internet."
website "http://ventics.com/autocms/"

# 1 result for "Powered by Auto CMS" @ 2010-10-12

# Dorks #
dorks [
'"Powered by Auto CMS"'
]



matches [

# Powered by text
{ :text=>'<a href="http://www.ventics.com/autocms/" target="_self">Powered by Auto CMS</a>,<a href="http://validator.w3.org/check?uri=referer">Valid XHTML 1.0</a>' },

]

end

