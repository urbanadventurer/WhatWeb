##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ezBOO-WebStats" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.1"
description "ezBOO WebStats is a high level statistical tool for web sites monitoring. - homepage:http://www.ezboo.com/softs/"
examples %w|
jcoder.com/sitetraff/
www.paddi.net/index.php3
www.ava.es/WebStats/
www.otakuex.com/admin/ezWebStats303/
pgsql.navicat.com/sitetraff/
lesjardinsdubarri.fr/stat/
pin88.hostoi.com/stat/
gilda.it/dsx/old/counter2.php3
www.numericshop.be/administration_temp/stats/
|

matches [

# http://johnny.ihackstuff.com/ghdb/?function=detail&id=625
# About 624 results @ 2010-06-05
{:name=>'GHDB: +"Administrator Panel" +intitle:"ezBOO WebStats"',
:certainty=>75,
:ghdb=>'+"Administrator Panel" +intitle:"ezBOO WebStats"'
},

{:name=>"default title",
:certainty=>100,
:text=>'<title>ezBOO WebStats</title>'
},

{:name=>"default text", 
:text=>'<div align="center" class="titre"><font color="#FFFFFF">&gt;&gt; Administrator Panel        &lt;&lt; </font></div>'
},

{:name=>"default logo",
:text=>'<td height="60" valign="top" align="center"><img src="image/logo_ez1.gif" border="0"></td>'
}

]

end

