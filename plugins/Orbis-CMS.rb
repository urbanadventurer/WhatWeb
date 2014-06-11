##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Orbis-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Orbis CMS is a simple and stylish management solution for small websites."

# 3 results for "powered by Orbis CMS" intitle:"Orbis CMS > Login" @ 2010-09-18

# Dorks #
dorks [
'"powered by Orbis CMS" intitle:"Orbis CMS > Login"'
]



matches [

# Meta generator
{ :text=>'<meta name="description" content="Orbis CMS is a simple and stylish management solution for small websites." />' },

# Login page # Powered by text
{ :text=>'<div id="login_poweredby">Powered by Orbis CMS</div>' },

# Login page # Default title
{ :text=>'<title>Orbis CMS &gt; Login</title>' },

# Login page # HTML comment
{ :text=>'<!-- Give feedback if user enters incorrect password (GET value "e=2) or logged out (GET value "e=3") -->' },

]

end

