##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "F3Site" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-27
version "0.1"
description "F3Site is a lightweight CMS written in XHTML 1.0 Strict, CSS and PHP 5. It lets you create multilingual websites without necessity of separate installation for each language. - homepage: http://compmaster.prv.pl"
examples %w|
www.gon.ugu.pl
www.smolinscy.pl
www.nowetaniej.pl
pzhgp-krotoszyn.pl
kolarstwo-zachodniopomorskie.org
www.reprotechnika.pl
www.stspl.eu
www.hucisko.pl
zarabianiepieniedzy.net
www.e-edytor.com/pl2/
gimnazjum7kielce.pl
www.pkenha.yoyo.pl
darklife.kilu.de
juveblog.pl
www.rekodzielo.talaska.pl
p98fongo.ugu.pl
www.szczakowianka.jaworzno.pl
erotyka.darmowe-porno.sex.pl
|

matches [

# 52 results @ 2010-06-27
{:name=>'GHDB: "Powered by F3Site" -exploit',
:certainty=>75,
:ghdb=>'"Powered by F3Site" -exploit'
},

{:name=>'powered by text #1',
:certainty=>100,
:text=>'Powered by <a href="http://compmaster.prv.pl">F3Site</a>'
},

{:name=>'powered by text #2',
:certainty=>100,
:text=>'<a href="http://compmaster.prv.pl" target="_blank">powered by F3Site</a></span>'
},

{:name=>'powered by text #3',
:certainty=>100,
:regexp=>/Powered by <a[\ target="_blank"]* href="http:\/\/compmaster.prv.pl[\/]*"[\ target="_blank"]*>F3Site<\/a>/
},

{:name=>'powered by text #4',
:certainty=>100,
:regexp=>/Powered by <a href="http:\/\/dhost.info\/compmaster[\/]*">F3Site[\ \d]*<\/a>/
},

]

# Powered by <a href="http://compmaster.prv.pl">F3Site v.2.1 plus</a>
def passive
        m=[]

        if @body =~ /Powered by <a href="http:\/\/compmaster.prv.pl">F3Site v[\d\.]+ plus<\/a>/
                version=@body.scan(/Powered by <a href="http:\/\/compmaster.prv.pl">F3Site v([\d\.]+) plus<\/a>/)[0][0]
                m << {:certainty=>100,:name=>"powered by version text",:version=>version}
        end

        m

end


end

