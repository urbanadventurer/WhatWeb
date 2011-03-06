##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Frog-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "Frog CMS - Content Management Simplified - Homepage: http://www.madebyfrog.com/"

# Google results as at 2011-03-03 #
# 387 for "powered by Frog CMS"

# Examples #
examples %w|
mydemo.opensourcecms.com/frog3871/
www.larock.org
www.pulido.biz
www.lokal54.com
www.sharkpp.net
emilis.org
www.teamaov.com
frogmenu.up.dn.ua
itconsulting-bg.com
www.fca-va.org
www.porterface.com
www.fsreplay.com
zastera.eu
eddiana.com
silent-studio.com.au
mentat.camelcoding.com
www.micahscatering.com.au
www.walkerscreativeart.com
webink.me
www.birgirthor.net
cherrybrothers.com
wikifuites.com
www.mitalia.net
|

# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.madebyfrog.com/" alt="Frog">Frog CMS</a>.' },
{ :text=>'Powered by <a href="http://www.madebyfrog.com/" title="Frog CMS">Frog CMS</a>.' },

]

end


