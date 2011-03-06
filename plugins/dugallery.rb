##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches and version detection
##
Plugin.define "DUgallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.2"
description "DUgallery - PHP powered photo gallery - homepage: http://www.duware.com/"

# About 1,490 results for ext:asp inurl:DUgallery intitle:"3.0" @ 2010-06-05
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

matches [

# GHDB Match # http://johnny.ihackstuff.com/ghdb/?function=detail&id=793
{ :ghdb=>'ext:asp inurl:DUgallery intitle:"3.0"', :version=>"3.0", :certainty=>75 },

# Default Title
{ :regexp=>/<title>DUgallery[^<]*<\/title>/ },

# Default Logo HTML
{ :text=>'<img src="assets/title.gif" alt="Powered by DUportal" width="269" height="62" border="0">' },

# Version detection # Default title
{ :version=>/<title>DUgallery ([\d\.]+)<\/title>/ },

]

end

