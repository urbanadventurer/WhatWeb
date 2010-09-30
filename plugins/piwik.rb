##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Piwik" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.1"
description "Piwik is a downloadable, open source (GPL licensed) real time web analytics software program. - homepage: http://piwik.org/"
examples %w|
piwik.org/demo/
web.grc.nasa.gov/piwik/
stats.mobileadsolution.com/owa/
secure.moatampa.com/moaadmin/stats/
missnancyscandystore.com/piwik/
www.ecovelo17.com/piwik/
61.135.112.26:6667/piwik/
analytics.idim.com
customers.corecodec.com/stats/
wncoc.org/stats/
mckerracher.net/piwik/
www.tchpc.tcd.ie/piwik/
aindice.com/piwik/
iphonethemegallery.com/piwik/
tascrafts.com/mystats/
sprousebrosfans.net/status/index.php
bittelbrunner.org/piwik/
araponics.com/piwik/
|

matches [

# About 250,000 results @ 2010-06-06
{:name=>'GHDB: +intitle:Piwik "JavaScript must be enabled in order for you to use Piwik in standard view"',
:certainty=>75,
:ghdb=>'+intitle:Piwik "JavaScript must be enabled in order for you to use Piwik in standard view"'
},

{:name=>"default title", 
:text=>'<title>Piwik &rsaquo; Web Analytics Reports</title>'
},

{:name=>"default loading image",
:text=>'<img src="themes/default/images/loading-blue.gif" alt="" /> Loading data'
}

]

# <meta name="generator" content="Piwik 0.6.2" />
# <meta name="generator" content="Piwik 0.5.5" />
# <meta name="generator" content="Piwik 0.6.1" />
# <meta name="generator" content="Piwik 0.5.4" />
# <meta name="generator" content="Piwik 0.5" />
# <meta name="generator" content="Piwik 0.4.3" />
def passive
        m=[]

        if @meta["set-cookie"] =~ /PIWIK_SESSID/
		m << {:name=>"PIWIK_SESSID Cookie", :certainty=>100 }
	end 
        
	if @body =~ /<meta name=\"generator\"[^>]*content=\"Piwik [0-9\.]+/
		v=@body.scan(/<meta name=\"generator\"[^>]*content=\"Piwik ([0-9\.]+)/)[0].to_s
		m << {:name=>"meta generator version", :version=>v }
        end

        m

end

end

