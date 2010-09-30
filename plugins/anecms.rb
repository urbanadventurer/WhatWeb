##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ANECMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-15
version "0.1"
description "cms - homepage: http://anecms.com/"
examples %w|
anecms.com
demo.anecms.com
devalien.com
87.252.187.245/ane/
girolaghiamo.delta-support.ch
|

matches [

# 11 results @ 2010-06-15
{:name=>'GHDB: "powered by anecms"',
:certainty=>75,
:ghdb=>'"powered by anecms"'
},

{:name=>'default meta author',
:text=>'<meta name="Author" content="Erwin Aligam - ealigam@gmail.com" />'
},

{:name=>'powered by text',
:regexp=>/&copy; [\d]{4} <strong><a href="http:\/\/anecms.com">anecms.com<\/a><\/strong> /
},

{:name=>'default title',
:regexp=>/<title>[a-zA-Z0-9_\s\.\-\+\=\\\/\'\:\"\;]* - Powered By ANECMS<\/title>/
}

]

end

