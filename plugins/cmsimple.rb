##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CMSimple" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.1"
description "CMSimple is a simple content management system for smart maintainance of small commercial or private sites. - homepage:http://www.cmsimple.org/"
examples %w|
www.cmsimple.org/demo/
www.musicmaulindustries.com/
www.startrix.de/en/
www.davaolodgebloodstock.com/
www.zglywx.com/
www.giantpicturedictionary.com/
www.vitaligraf.de/en/
www.magicplans.com/
www.rpad.dk/en/
www.anybody.aau.dk/
www.informationmanagers.dk/
www.upmarketseo.com/
www.alumnae.mtholyoke.edu/~classof1969/
www.biggreenweekend.org.uk/
www.whysp.com/
www.kis-rovinj.com/
www.koningdecor.com/
atomcool.rice.edu/
digined.pe1mew.nl/
www.fa2011.org/
www.eichberger.org/en/
www.koostookogu.ee/et/
www.cawu.org/
www.hugeinternetsuperstars.com/
www.efplighting.com/
www.trjfas.org/
www.cj-web.dk/
www.cidtegypt.com/
|

# <meta name="generator" content="CMSimple 3.2">
# <meta name="generator" content="CMSimple 3.1 - www.cmsimple.org">
# <meta name="generator" content="CMSimple 3.0 - www.cmsimple.dk">
# <meta name="generator" content="CMSimple 2.9 - www.cmsimple.dk">
# <meta name="generator" content="CMSimple 2.7 - www.cmsimple.dk">
# <meta name="generator" content="CMSimple 2.4 - www.cmsimple.dk">

matches [

# About 70,800 results @ 2010-06-04
{:name=>'GHDB: "Powered by CMSimple.dk" +welcome',
:certainty=>75,
:ghdb=>'"Powered by CMSimple.dk" +welcome'
},

{:text=>'<meta name="generator" content="CMSimple' }

]

end

