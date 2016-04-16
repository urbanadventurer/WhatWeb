##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Rumba-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "Rumba is a Content Management System (CMS). It is the engine behind your website that simplifies the creation, management, and sharing of content. Use Rumba as CMS, blog, site of news or personal page."
website "http://rumbacms.com/"

# 72 results for "powered by Rumba CMS" @ 2010-09-04

# Dorks #
dorks [
'"powered by Rumba CMS"'
]

# Exampels #


matches [

# Powered by text
{ :text=>' <center><small><a href=http://rumba.net.ru>Powered by Rumba CMS</a></small></center></body>' },
{ :text=>' <center><small><a href=http://rumbacms.com>Powered by Rumba CMS</a></small></center></body>' },
{ :text=>' Powered by <a rel="nofollow" target="_blank" href="http://rumba.net.ru/">Rumba CMS</a></p>' },

# Meta generator
{ :text=>' <meta name="generator" content="Rumba Easy http://rumba.net.ru" />' },
{ :text=>' <meta name="generator" content="Rumba Easy http://rumbacms.com" />' },
{ :text=>' <meta name="generator" content="http://rumba.net.ru" />' },
{ :text=>' <meta name="generator" content="Rumba Wiki http://rumba.net.ru/" />' },
{ :text=>'<meta name="Generator" content="http://rumba.net.ru" />' },

]

end

