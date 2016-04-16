##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zikula" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.1"
description "Zikula is a Web Application Toolkit, which allows you to run impressive websites and build powerful online applications."
website "http://zikula.org"

# Dorks #
dorks [
'"Powered by Zikula"'
]



# Matches #
matches [

# <meta name="Generator" content="Zikula - www.zikula.org" />
# <meta name="generator" content="Zikula Application Framework - http://zikula.de" />
# <meta name="Generator" content="Zikula - http://zikula.de" />
{:name=>'meta generator',
:text=>'<meta name="Generator" content="Zikula - www.zikula.org" />'
},

{:name=>'meta generator de',
:text=>'<meta name="Generator" content="Zikula - http://zikula.de" />'
},

{:name=>'meta generator - full',
:text=>'<meta name="generator" content="Zikula Application Framework - http://zikula.de" />'
},

# Powered by <a href="http://www.zikula.org">Zikula</a>
# <a href="http://community.zikula.org/" title="Powered by Zikula">Zikula</a>
{:name=>'powered by community text',
:text=>'<a href="http://community.zikula.org/" title="Powered by Zikula">Zikula</a>'
},

{:name=>'powered by text',
:text=>'Powered by <a href="http://www.zikula.org">Zikula</a>'
}

]

end

