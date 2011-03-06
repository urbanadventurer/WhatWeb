##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "SimpNews" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.2"
description "Simply a News system - homepage: http://www.boesch-it.de/"

# Google results as at 2010-07-11 #
# 79 for "powered by SimpNews"

# Examples #
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

# Matches #
matches [

# Meta Generator
{ :version=>/<meta name="generator" content="SimpNews v([\d\.]+), \(c\)[\d]{4}[\-,]*[\d]{4} by Boesch EDV-Consulting"[^>]*>/ },

# Admin Panel
{ :version=>/ href="http:\/\/www.boesch-it.de[\/]*">SimpNews<\/a> V([\d\.]+) &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/div>/ },

# Powered by text link
{ :version=>/<br>Powered by <a class="copyright" target="_blank" href="http:\/\/www.boesch-it.de">SimpNews<\/a> V([\d\.]+) &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/font><\/td><\/tr><\/table><\/td><\/tr><\/table><\/div>/ },

# Powered by text
{ :version=>/<br>Powered by SimpNews V([\d\.]+) &copy;[\d]{4}[\-,]*[\d]{4} B&ouml;sch EDV-Consulting<\/font><\/td><\/tr><\/table><\/td><\/tr><\/table><\/div>/ },

]

# Passive #
def passive
	m=[]

	# cookie
        m << { :name=>"simpnews[lastvisit] Cookie" } if @meta["set-cookie"] =~ /simpnews\[lastvisit\]=/

	# Return passive matches
        m

end

end


