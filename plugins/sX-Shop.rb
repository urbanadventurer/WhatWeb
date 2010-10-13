##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "sX-Shop" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "PHP powered Shopping cart - homepage: http://www.source-worx.de/"

# 24 results for "powered by sX-Shop" -inurl -Vulnerabilities -Vulnerability @ 2010-10-14
examples %w|
top-brille.com
www.arte-natura.ch/shop/
www.artenatura.ch
www.autoteilebedarf.de/shop/
www.cycletec.de/shop/
www.demo-shopsystem.de/shop/
www.eisen-kiessling.de
www.foto-lippka.de/shop/
www.masaadvertising.de/shop/
www.photo-lippka.de/shop/shop/
www.stickprint.de
www.topbrille.com/shop/
|

matches [

# Powered by text
{ :regexp=>/<a href="http:\/\/www.source-worx.de[^>]+>powered[\s]+by sX-Shop<\/a>/ },

# Meta generator
{ :text=>'<meta name="author" content="Source WorX - Software Development">' },

# Default JavaScript
{ :text=>'alert("Ihr Suchbegriff muss mind. aus 3 Zeichen bestehen.");' },

]

end

