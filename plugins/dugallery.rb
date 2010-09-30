##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "DUgallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.1"
description "photo gallery - homepage:http://www.duware.com/"
examples %w|
www.unitybham.org/dugallery/
www.jermerica.net/dugallery/
jtommorow.com/DUgallery/
unityofbirmingham.org/dugallery/
www.kausphoto.com/dugallery/
www.grampy.com/dugallery/
www.toninbala.com.br/dados/DUgallery/
www.escadinha.esp.br/dados/DUgallery/
www.pakitos.esp.br/portal/DUgallery/
www.atego.esp.br/portal/DUgallery/
|

# <td width="271" align="left" valign="middle" background="assets/bg_banner.gif"><img src="assets/title.gif" alt="Powered by DUportal" width="269" height="62" border="0"></td>

# <td width="271" align="left" valign="middle" background="assets/bg_banner.gif"><a href="http://www.duware.com" target="_blank"><img src="assets/title.gif" alt="Powered by DUportal" width="269" height="62" border="0"></a></td>

matches [

# http://johnny.ihackstuff.com/ghdb/?function=detail&id=793
# About 1,490 results @ 2010-06-05
{:name=>'GHDB: ext:asp inurl:DUgallery intitle:"3.0"',
:certainty=>75,
:ghdb=>'ext:asp inurl:DUgallery intitle:"3.0"'
},

{:name=>"default title", :regexp=>/<title>DUgallery[0-9a-zA-Z\ \.-]+<\/title>/},
{:name=>"default logo", :text=>'<img src="assets/title.gif" alt="Powered by DUportal" width="269" height="62" border="0">' 
}

]

end

