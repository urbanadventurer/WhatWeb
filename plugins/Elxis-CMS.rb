##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Elxis-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.1"
description "Elxis is powerful open source content management system (CMS) released for free under the GNU/GPL license."
website "http://www.elxis.org/"

# Google results as at 2010-10-11 #
# 200 for "powered by Elxis CMS"

# Dorks #
dorks [
'"powered by Elxis CMS"'
]



matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.elxis.org" title="Elxis CMS">Elxis</a>' },
{ :regexp=>/Powered by <a href="http:\/\/www.elxis.org[\/]*" title="Elxis open source content management system"[\ target="_blank"]*>Elxis[\ CMS]*<\/a>/ },

# Meta generator
{ :regexp=>/<meta name="Generator" content="Elxis - Copyright \(C\) 2006-[0-9]{4} Elxis.org. All rights reserved." \/>/ },

# Favicon
{ :md5=>'36d8efa82de41f53c23eece784405c9e', :url=>'images/favicon.ico' },

]

end

