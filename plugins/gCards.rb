##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "gCards" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "gCards is a free PHP-based eCard system that is easy to setup and use. gCards simple Administration Console allows the administrator to upload images (JPEGs of GIFs), add eCard categories, and modify existing settings - Note: This project is dormant - no further updates will be done - Homepage: http://www.gregphoto.net/gcards/index.php"

# Google results as at 2011-03-15 #
# 359 for "powered by gcards"
# 11 for intitle:"eCards Administration Console Login" inurl:login.php

# Examples #
examples %w|
demo.centipaid.com/gcards/
www.buddhistchannel.tv/gcards/
www.luckenbooth.com/gcards/
packardgoose.ploeg.ws/gcards/
www.fun-system.com/_fun_system/gallery/login.php
www.teesarchaeology.com/ecard/login.php
www.vozao.com.br/gcards/
www.nvak.no/misc/postcard/
www.valqueireonline.com.br/webcards/
200.215.63.48/cartoes/
www.webcards.francisconi.com.br/login.php
www.thaigarden.com/database/english/gcards/
www.floridacards.com/gcards/
www.militaryecard.com
www.cccturtle.org/gcards/
www.digischool.nl/gcards/
www.christmasgreetingsonline.com/gcards/index.php
dns.calnek.com/gcards/
haikeralam.com/gcards/
www.cholangiocarcinoma.org/gcards/
www.komputerkraft.com/gcards/
www.drive-infilm.com/cards/
www.garlynzoo.com/gcards/
www.tina-turner.nl/gcards/
www.tauferberg.com/gcards/
www.schnattertante.de/qcard/
www.route66university.com/gcards/
conserveturtles.com/gcards/
www.seaturtletracking.com/gcards/
helmutkuhn.com/gcards/
www.vastu-vidya.org/ecards/
www.twoweekwait.com/ecards/
www.kooikerforum.nl/gcards/
www.goojf.com/gcards/
www.webbocah.org/gcards/
www.karlheinz-ulmer.com/gcards/
barefootlabradors.com/gcards/
blackorwhite.nl/ecards/gcards/
www.revolucion13.com/gcards/
ecards.kalaiyalive.com
ecards.mayastepien.nl
learn-energy.net/kidscorner/postcards/
www.mailcards.org
postcards.heathernova.info
www.barbiexmas.com/cards/
mymerrychristmas.com/greetings/
www.merrygreetings.com
helpingseaturtles.com/gcards/
www.vastu-vidya.eu/ecards/
www.cambridgeart.com/cgi-bin/gcards/
www.blackadderhall.com/ecards/
www.stephens.edu/alumnae/extras/cards/
www.xsitecreator.com/hotecards/
www.bulguide.com/ecards/
www.archdiocese.la/ecards/
www.landsbyporten.no/gcards/
|

# Matches #
matches [

# Compose Link
{ :certainty=>75, :text=>'<a href="compose.php?imageid=' },

# Admin Page # Default Title
{ :text=>"<title>eCards Administration Console Login</title>" },

# Version Detection
{ :version=>/<td>(Driftet av|Powered by|Un script de ) <a href="http:\/\/www.gregphoto.net\/gcards\/index.php"[^>]*>gCards<\/a> v([\d\.]+)<\/td>/, :offset=>1 },

]

end


