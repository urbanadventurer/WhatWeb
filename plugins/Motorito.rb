##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Motorito" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-25
version "0.1"
description "Motorito - homepage: http://www.motorito.com/"

# 77 results for inurl:mmod=staticContent @ 2010-09-25
examples %w|
www.motorito.com
www.starmyname.com
www.nlmt.com
www.bike-tech.net
www.startwin.tv
www.verticalrunning.com
www.emprendedorxxi.es
www.idtweb.org
www.e-excellence.es
www.gremirestauracio.com
www.biciclowneldocumental.com
www.l2bconsultores.com
www.cocimer.com
www.sono.es
www.caixacapitalrisc.es
www.biciclown.com
www.asodame.com
www.revistatrail.com
www.caixacapitalrisc.com
|

matches [

# HTML comments
{ :text=>'<!-- end META_TAGS subst -->' },
{ :text=>'<!-- CAL POSAR UN DISCRIMINADOR DE NAVEGADORS PER CARREGAR ELS ESTILS ADEQUATS -->' },

]

end

