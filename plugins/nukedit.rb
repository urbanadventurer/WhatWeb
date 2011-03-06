##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Nukedit" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.2"
description "Nukedit CMS - homepage: http://www.nukedit.com/"

# Google results as at 2010-07-25 #
# 122 for "powered by Nukedit"

# Examples #
examples %w|
catalystinfotech.com/cms/
crutial.erse-web.it
ermine.erse-web.it
forsandtrial.org
realisegrid.erse-web.it
seesgen-ict.erse-web.it
www.bedfordbulls.co.uk
www.cyberlets.co.uk/basketball/
www.doula.org.uk
www.editdudes.com
www.hdpost.se
www.huntingdonbasketball.co.uk
www.indianaviators.com
www.instantuknumbers.co.uk
www.maliinvest.dk
www.mediabuild.co.uk
www.mobilefonecentral.com
www.multiinformatica.com
www.musiclife.com.au
www.ntmf.no
www.nukedit.com
www.plattlmania.com
www.postproduction.se
www.rosenkranz-scheifling.at
www.schenkenschanz.com
www.stadsboerderijdemars.nl
www.ubl.com.au
www.ukhk.se
www.vcss.com.au
www.vejlemodelflyveklub.dk
www.viborgmodelflyveklub.dk
www.weddingcompare.com
www.xn--ellebksmalerservice-pxb.dk
|

# Matches #
matches [

{ :regexp=>/Powered by Nukedit - <a href="(http:\/\/www.|http:\/\/)nukedit.com" target=_blank title="[^"]*"><span class=footer><u>(Web Content Management|Open Source CMS)<\/u><\/a><br>/ },

# Powered by text
{ :text=>'<a href="http://www.nukedit.com" target=_blank title="Fast web portal, friendly with search engines">Powered by Nukedit</a>' },

# HTML Comment
{ :text=>'							You can move it anywhere you want. -->' },

# Powered by text
{ :text=>'<a href="http://www.nukedit.com" target=_blank title="Fast web portal, friendly with search engines"><span class="footer">Powered by Nukedit</span></a><span class="footer"> |' },

# Version Detection # Powered by text
{ :version=>/				Powered by <a href="http:\/\/www.nukedit.com" target="_blank" title="Fast web portal, friendly with search engines">Nukedit<\/a> ([\d\.]+) / },

# Version Detection # Powered by footer
{ :version=>/					<span class=footer><center>Powered by Nukedit ([\d\.]+)<\/a> -/ },

]

end

