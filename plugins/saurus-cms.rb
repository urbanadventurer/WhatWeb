##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Saurus-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.1"
description "Web publishing system combining daily content management features with site administration and development tools."
website "http://www.saurus.info/"

# Dorks #
dorks [
'"powered by saurus cms"'
]



matches [

# About 39,500 results @ 2010-06-12
{:name=>'GHDB: "powered by saurus cms"',
:certainty=>75,
:ghdb=>'"powered by saurus cms"'
},

# <meta name="generator" content="Saurus CMS">
# <meta name="Generator" content="Saurus CMS" />
{:name=>'meta generator',
:regexp=>/<meta name="Generator" content="Saurus CMS"[\ \/]*>/i
},

# <link rel="shortcut icon" type="image/x-icon" href="/extensions/saurus4/images/favicon.ico">
{:name=>'default favicon html',
:text=>'<link rel="shortcut icon" type="image/x-icon" href="/extensions/saurus4/images/favicon.ico">'
},

# <meta name="Powered_by" content="Saurus CMS">
{:name=>'meta powered by',
:text=>'<meta name="Powered_by" content="Saurus CMS">'
},

{:name=>'powered by default',
:text=>'<p>Saiti jooksutab <a title="Sisuhaldustarkvara" target="_blank" href="http://www.saurus.ee">Saurus CMS</a> | <a title="Sisukaart" href="?op=sitemap">Sisukaart</a></p>'
},

{:name=>'powered by english',
:text=>'<p>Powered by <a href="http://www.saurus.info" target="_blank" title="Sisuhaldustarkvara">Saurus CMS</a> | <a href="?op=sitemap" title="Sisukaart">Sitemap</a></p>'
}

]

end

