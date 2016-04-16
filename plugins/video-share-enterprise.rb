##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VideoShareEnterprise" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-20
version "0.1"
description "online video sharing community web application"
website "http://www.alstrasoft.com"


matches [

# 34 results @ 2010-06-19
{:name=>'GHDB: "Powered By AlstraSoft Video Share Enterprise"',
:certainty=>75,
:ghdb=>'"Powered By AlstraSoft Video Share Enterprise"'
},

{:name=>'default html comment',
:certainty=>100,
:text=>'<!--!!!!!!!!!!!!!!!!!!!!!!!!! Processing SCRIPT !!!!!!!!!!!!!!!!!!!-->'
}

]


end

