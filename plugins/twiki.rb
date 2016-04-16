##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TWiki" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13
version "0.1"
description "A flexible, powerful, and easy to use enterprise wiki, enterprise collaboration platform, and web application platform."
website "http://www.twiki.org/"


matches [

# About 3,070,000 results @ 2010-06-13
{:name=>'GHDB: "powered by twiki"',
:certainty=>75,
:ghdb=>'"powered by twiki"'
},

{:name=>'default redirect page title',
:text=>'<title>Welcome to TWiki - A Web-based Collaboration Platform</title>'
},

# <span class="twikiRight"> <a href="http://twiki.org/"><img src="/p/pub/TWiki05x00/TWikiLogos/T-badge-88x31.gif" alt="This site is powered by the TWiki collaboration platform" width="88" height="31" title="This site is powered by the TWiki collaboration platform" border="0" /></a></span>
# <span class="twikiRight"> This Wiki powered by TWiki <a href="http://twiki.org/"><img src="/pub/TWiki/TWikiLogos/T-badge-88x31.gif" alt="This Wiki is powered by the TWiki collaboration platform" width="88" height="31" title="This wiki is powered by the TWiki collaboration platform" border="0" /></a></span>
{:name=>'powered by text',
:regexp=>/<span class="twikiRight"> <a href="http:\/\/twiki.org\/"><img src="[a-zA-Z0-9\.\-\\\/\+_]+" alt="This site is powered by the TWiki collaboration platform" width="[0-9]+" height="[0-9]+" title="This site is powered by the TWiki collaboration platform" border="0" \/><\/a><\/span>/i
},

{:name=>'alternate powered by text',
:regexp=>/<span class="twikiRight"> This Wiki powered by TWiki <a href="http:\/\/twiki.org\/"><img src="[a-zA-Z0-9\.\-\\\/\+_]+" alt="This Wiki is powered by the TWiki collaboration platform" width="[0-9]+" height="[0-9]+" title="This wiki is powered by the TWiki collaboration platform" border="0" \/><\/a><\/span>/i
}

]

def passive
        m=[]
        m << {:name=>"TWIKISID Cookie" } if @headers["set-cookie"] =~ /TWIKISID=[0-9a-z]{32}/
        m
end

end

