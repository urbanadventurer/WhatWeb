##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenKM" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-09
version "0.1"
description "OpenKM - Open Source Electronic Document Management System - Homepage: http://www.openkm.com/en/"

# Google results as at 2012-01-09 #
# 17 for "Welcome to OpenKM" intitle:"OpenKM login"

# Dorks #
dorks [
'"Welcome to OpenKM" intitle:"OpenKM login"'
]

# Examples #
examples %w|
demo.openkm.com/OpenKM/frontend/index.jsp
braidproject.eu/OpenKM/
collaborate.oieau.fr/OpenKM/
jswdms.jsw-ci.com
fina.net.ua:8070/OpenKM/
opkm.piechna.com/OpenKM/
donkey.berndtgroup.net
demo.hamerle.cz
docs.mstpartners.sk/OpenKM/
https://openkm.mmt.inf.tu-dresden.de/OpenKM/
|

# Matches #
matches [

# Login Page # Form
{ :text=>'<form name="login" method="post" action="j_security_check" onsubmit="setCookie()">' },

# Login Page # Title
{ :regexp=>/<title>OpenKM Login<\/title>[\s]+<\/head>[\s]+<body onload="document\.forms\[0\]\.elements\[0\]\.focus\(\)">/ },

]

end

