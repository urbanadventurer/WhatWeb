##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kloxo-Single-Server" do # aka HyperVM aka LxAdmin
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.1"
description "Kloxo (aka HyperVM aka LxAdmin) is a fully scriptable, distributed and a 100% object oriented hosting platform"
website "http://www.lxcenter.org/kloxo.htm"

# 70 results for "Use a valid username and password to gain access to the console" -lxcenter.org @ 2010-05-09

# Dorks #
dorks [
'"Use a valid username and password to gain access to the console" -lxcenter.org'
]



# Matches #
matches [

{ :text=>"<title> HyperVM 2.0 </title>" },

{ :text=>"<title> Kloxo </title>" },

# default lxadmin title",
{ :text=>"<title> Lxadmin </title>" },

# default logo html
{ :text=>'<img id=main_logo width=84 height=23 src="/img/hypervm-logo.gif">'
},

# login text # joomla and mambo use this string but without "</b>" 
{ :certainty=>75, :text=>"Use a valid username and password to gain access to the console</b>" },

# login css # fairly specific directory structure - no false positives on google
{ :text=>'@import url("/htmllib/lib/admin_login.css");' },

# fairly specific directory structure - no false positives on google 
{:name=>"login javascript",
:text=>'<script language=javascript src="/htmllib/js/preop.js"></script>'
},

# fairly specific HTML structure - no false positives on google
{:name=>"login form",
:text=>'<form name=loginform action="/htmllib/phplib/" onsubmit="encode_url(loginform) ; return fieldcheck(this);" method=post>'
}

]

end


