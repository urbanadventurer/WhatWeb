##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Motorito" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-25
version "0.1"
description "Motorito"
website "http://www.motorito.com/"

# 77 results for inurl:mmod=staticContent @ 2010-09-25

# Dorks #
dorks [
'inurl:mmod=staticContent'
]



matches [

# HTML comments
{ :text=>'<!-- end META_TAGS subst -->' },
{ :text=>'<!-- CAL POSAR UN DISCRIMINADOR DE NAVEGADORS PER CARREGAR ELS ESTILS ADEQUATS -->' },

]

end

