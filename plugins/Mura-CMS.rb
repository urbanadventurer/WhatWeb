##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mura-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Mura CMS (previously known as Sava CMS) is an open source CMS for ColdFusion."
website "http://www.getmura.com/"



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="(Mura|Sava) CMS ([\d\.]+)" \/>/, :offset=>1 },

# Powered by link
{ :text=>'Powered by <a href="http://www.getmura.com/">Mura CMS</a>' },

# Admin Page
{ :text=>'<form novalidate="novalidate" id="sendLogin" name="sendLogin" method="post" action="index.cfm?fuseaction=cLogin.main" onsubmit="javascript:if(document.sendLogin.email.value !=\'\'){return true;}else{return false;}">' },

]

end

