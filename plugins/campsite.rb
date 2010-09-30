##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Campsite" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-15
version "0.1"
description "Campsite is a multilingual content management system (CMS) for news websites. - homepage: http://www.sourcefabric.org/"

# 28 results for "powered by campsite" @ 2010-08-15
examples %w|
campsite-demo.sourcefabric.org
www.mdlf.org
euroradio.fm
post.oursammie.net
birn.eu.com
www.bim.ba
blint.org
jeromehomenews.com
collegian.lasalle.edu
www.studio88.ba
www.patak.co.rs
|

matches [

{ :ghdb=>'"powered by campsite"', :certainty=>75 },
{ :text=>'<a href="http://www.campware.org" target="_blank"><img src="/templates/img/powered.gif" alt="powered by campsite" border="0"/></a>' },
{ :text=>'powered by <a href="http://www.campware.org" target="_blank">CAMPSite</a></p>' },
{ :text=>'powered by <a href="http://campsite.campware.org" target="_blank">Campsite</a>' },

]

# Version detection using meta generator
def passive
        m=[]

        if @body =~ /<meta name="generator" content="Campsite [\d\.a-z]+" \/>/
                version=@body.scan(/<meta name="generator" content="Campsite ([\d\.a-z]+)" \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

