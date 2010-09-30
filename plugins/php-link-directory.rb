##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Link-Directory" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.1"
description "phpLD is the most widely used directory script on the internet, installed on over 100,000 websites. phpLD is a great addition to any site, and is easy to install. - homepage: http://www.phplinkdirectory.com/"
examples %w|
www.inclusio.com
pornocms.com
www.londovor.com
www.travel247365.com
myworlddirectory.com
www.ultradirectory.net
www.link-collections.info
www.summerdirectory.info
www.dawnlink.info
www.knifedirectory.info
shrateralliance.com
www.gardenwebdirectory.com
highriselinks.info
www.webworlddirectory.info
www.drinksdirectory.info
www.hitchfifty.com
www.hitslive.info
indian-links.com
www.addmylinkfree.com
www.vipdirectory.com.ar
www.europelink.info
|

matches [

# About 86,500 results @ 2010-06-13
{:name=>'GHDB: "powered by phpLinkDirectory"',
:certainty=>25,
:ghdb=>'"powered by phpLinkDirectory"'
},

{:name=>"powered by text",
:regexp=>/[powered by]*[\s]*<a href="http:\/\/www.phplinkdirectory.com[\/]*"[\ title="PHP Link Directory"]*>PHP Link Directory<\/a>/i
},

]
=begin
{:name=>"alternate powered by text",
:regexp=>/[site\ ]*[powered by]*[\s]*<a href="http:\/\/www.phplinkdirectory.com[\/]*"[\ target="_blank"]*[\ title="PHP Link Directory"]*[a-zA-Z0-9\;\:\#\.\-\+\=\'\"\\\/_\s\>\<]*>[a-zA-Z0-9\;\:\#\.\-\+\=\'\"\\\/_\s\>\<]*Phplinkdirectory[\.com]*[a-zA-Z0-9\;\:\#\.\-\+\=\'\"\\\/_\s\>\<]*<\/a>/i
}

]
=end

# meta generator version
def passive
        m=[]

        if @body =~ /<meta name="generator"[^>]*content="PHP Link Directory [0-9\.]+"/
		v=@body.scan(/<meta name="generator"[^>]*content="PHP Link Directory ([0-9\.]+)"/)[0].to_s
		m << {:name=>"meta generator version", :version=>v }
        end

	m
end

end

