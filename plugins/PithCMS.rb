##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PithCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "PithCMS - requirements: Linux, PHP 4.4.4-8"
website "http://pithcms.altervista.org/index.php?pagina=data/info.php"

# 23 results for "powered by pithcms" @ 2010-10-14

# Dorks #
dorks [
'"powered by pithcms"'
]



# Matches #
matches [

# Powered by text
{ :text=>'<p class="admin">Powered by <a href="http://pithcms.altervista.org/index.php?pagina=data/info.php">PithCMS</a>' },

# Admin page # Default logo and welcome text
{ :text=>'/icons/admin48.png"><br />Welcome Admin.<br /><br />', :path=>'login.asp' },

]

end

