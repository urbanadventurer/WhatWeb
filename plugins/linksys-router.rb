##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Linksys-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-28
version "0.1"
description "Linksys router - homepage: http://www.linksys.com/"

matches [

{ :model=>'WRT54GL', :ghdb=>'inurl:"/WRT56GL.gif"', :url=>'/WRT56GL.gif', :certainty=>75 },
{ :model=>'WRT54GC', :md5=>"0b749361e0c9ab37b9f8875b0667d713", :url=>'/UI_Linksys.gif' },
{ :model=>'WRT54G', :ghdb=>'inurl:"/WRT54G.gif"', :url=>'/WRT54G.gif', :certainty=>75 },
{ :model=>'WRT54GS', :ghdb=>'inurl:"/UILinksys.gif"', :url=>'/UILinksys.gif', :certainty=>75 },

]

end

