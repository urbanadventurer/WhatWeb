##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SimpNews" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "Simply a Newssystem - homepage: http://www.boesch-it.de/"
# 79 results for "powered by SimpNews" @ 2010-07-11
examples %w|
www.boesch-it.de/simpnews/admin/
www.esquirecaucasians.com/simpnews/news.php
www.southamericanminerals.com/simpnews/news4.php
www.zeoxpm.com/simpnews/newsmail.php
www.wmdnews.org/simpnews/newsframe.php
www.cockatiel.za.net/ournews/news.php
www.speedrome.com/newsletter/news.php
www.mohawknationnews.com/news/news.php
informatii.cs.ro/newsmail.php
www.premega.de/simpnews/news.php
www.korenschaker.nl/simpnews/news.php
www.st-knud-husum.de/Kolping/simpnews/news.php
schwimmen-tv-voerde.de/simpnews/news.php
www.tsv-wennigsen.de/appl/news/simpnews/news.php
www.blaues-band.de/news2/news.php
www.aulamagnamagna.it/simpnews/news.php
www.djkeller.de/news/news.php
www.bogucka.pl/news/news.php
www.lifepersonaltraining.de/aktuelles.php
www.vtz-saarpfalz.de/simpnews/news.php
nachwuchs.ice-hogs.de/simpnews/news.php
www.fv-freibad-voerde.de/simpnews/news.php
stjosef.at/stjosefnews/news.php
www.stjosef.net/stjosefnews/news.php
www.portugal-links.de/nachrichten/news.php
www.caterina.at/stjosefnews/news.php
exelbonsai.de/Newsticker/news.php
www.ap-engineer-construction.com/simpnews/news.php
www.rieden.com/relange/news/news.php
www.matzemantzke.de/news/news.php
asff-badminton.com/news/news.php
|

def passive
        m=[]

	# meta generator
        if @body =~ /<meta name="generator" content="SimpNews v[\d\.]+, \(c\)[\d]{4}[\-,]*[\d]{4} by Boesch EDV-Consulting"[\ \/]*>/
                version=@body.scan(/<meta name="generator" content="SimpNews v([\d\.]+), \(c\)[\d]{4}[\-,]*[\d]{4} by Boesch EDV-Consulting"[\ \/]*>/)[0][0]
                m << {:version=>version}
        end

	# admin panel
        if @body =~ / href="http:\/\/www.boesch-it.de[\/]*">SimpNews<\/a> V[\d\.]+ &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/div>/
                version=@body.scan(/ href="http:\/\/www.boesch-it.de[\/]*">SimpNews<\/a> V([\d\.]+) &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/div>/)[0][0]
                m << {:version=>version}
        end

	# powered by text
        if @body =~ /<br>Powered by [<a class="copyright" target="_blank" href="http:\/\/www.boesch-it.de">]*SimpNews[<\/a>]* V[\d\.]+ &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/font><\/td><\/tr><\/table><\/td><\/tr><\/table><\/div>/
                version=@body.scan(/<br>Powered by [<a class="copyright" target="_blank" href="http:\/\/www.boesch-it.de">]*SimpNews[<\/a>]* V([\d\.]+) &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/font><\/td><\/tr><\/table><\/td><\/tr><\/table><\/div>/)[0][0]
                m << {:version=>version}
        end

	# cookie
        m << { :name=>"simpnews[lastvisit] Cookie" } if @meta["set-cookie"] =~ /simpnews\[lastvisit\]=/

        m

end


end

