##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Magento" do
author "Andrew Horton"
version "0.1"
description "Opensource ecommerce platform written in PHP. Homepage: http://www.magentocommerce.com"
examples %w| http://infinitechcomputers.com/ http://yankeessuck.org/ http://www.box-net.de/ http://massage-couches.com/ http://www.malenasflowers.com/ http://sqaengineering.com/ http://repro-ecommerce.ucdavis.edu/ http://urbanhydroponics.com/ http://www.knittingpeace.com/ http://e-zelectronics.com/ http://www.busscrolls.com/ http://thegrandbhagwati.com/ http://www.eggmaternity.com/shop http://www.ozscopes.com.au/ http://www.orabrush.com/ http://bobbyjackbrand.com/ www.inkfactory.com/ www.watchestag.com   www.123pandora.com www.petscorner.co.uk/ www.wigs-direct.com
http://www.amberlaine.com
http://www.woodentoysonline.co.uk
http://www.girlswithattitude.co.uk
http://www.davidnieper.co.uk
http://www.carbonfibergear.com
http://www.truecleantowel.com
http://www.voolume.fr
http://www.smartcabinets.ca
http://www.matchingbedrooms.com
http://www.give2you.nl
http://www.baby-mp3.com
http://www.covemountainhealth.com
http://www.breathalyzeralcoholtester.com
http://www.urbandojo.co.uk
http://www.teaforte.ch
http://www.linenfashion.com
http://www.pretaporterbergere.com
http://www.justin-verre.fr
http://www.thestoragebay.co.uk
http://www.shopsanctuaryt.com
http://www.somerset-distribution.com/shop
http://www.wickercentral.com
http://www.footbagshop.com
http://www.pipe-tobacco-shop.com
http://www.poetrie.com
http://www.zurchers.com
http://www.img-automotive.co.uk
http://www.purplesole.com
http://www.fantasticals.co.uk
http://shop.englandstuff.com
https://www.pureherbalcure.com
http://www.cuband.com/
http://www.seedlessclothing.com/shop/
http://www.Bulkreefsupply.com
http://www.shoesindream.com
http://www.puppetstoyou.com
http://www.blazesunglasses.com
http://www.gogreenray.com
http://www.trueartline.com
http://www.youngloverslabel.com
http://www.dogwoodlondon.co.uk
http://www.ibericous.com
http://www.sendravalencia.com
http://www.sendra.jp
http://www.laboutiquebio.biz
http://www.sofisticada.com.br
http://www.solarfabric.com
http://fitnesszone.gr/shop
http://www.anna-bree.com
http://www.blossomandtwigs.com
http://www.number1smoke.com
http://www.bestvalueink.com
http://www.fashionsilver.eu
http://www.imaginethemes.com
http://www.sweetcandy.com.com
http://www.torrentisfly.com
http://www.completegyms.com
http://www.mhpcomputerservices.com
http://www.wlanmall.com/
http://www.kousvelaris.gr/
http://www.slipper-online.nl/
http://www.hhogarth.co.uk/
http://www.prediger.de
http://www.iq-sport.eu
http://www.bluewillis-onlineshop.de
http://www.i-spotrebice.cz
http://www.bigjigstoys.co.uk

http://www.zapsweets.co.uk/
http://www.gogreenray.com/
http://www.simplifiedbuilding.com/
http://www.shopsanctuaryt.com/
|

#<a href="http://www.magentocommerce.com/bug-tracking" id="bug_tracking_link"><strong>Report All Bugs</strong></a> (ver. 1.4.0.1)

# default logo alt text
# images/logo.gif" alt="Magento Commerce" /></a></h1>

# Matches are enclosed in {} brackets and separated by commas
matches [
{:text=>'images/logo.gif" alt="Magento Commerce" /></a></h1>' ,:name=>'default logo alt-text'},
{:version=>/<a href="http:\/\/www.magentocommerce.com\/bug-tracking" id="bug_tracking_link"><strong>Report All Bugs<\/strong><\/a> \(ver. ([0-9\.]+)\)/, :name=>"Bug tracking link" },
{:regexp=>/<link rel="stylesheet" type="text\/css" href="[^"]+\/skin\/frontend\/[^ "]+\/css\/boxes.css" media="all"/, :name=>"/skin/front/*/css/boxes.xss"},
{:text=>'<meta name="keywords" content="Magento, Varien, E-commerce" />'},
{:text=>"var searchForm = new Varien.searchForm('search_mini_form', 'search', 'Search entire store here...'"},
{:text=>',mage/cookies.js" ></script>'},
{:regexp=>/<p><strong>We detected that your JavaScript seem to be disabled.<\/strong><\/p>\n[ ]+<p>You must have JavaScript enabled in your browser to utilize the functionality of this website.<\/p>/, :name=>'JavaScript warning'},

{:url=>'/admin',:text=>'<title>Log into Magento Admin Page</title>'} 
]

=begin
no obvious pattern:
Set-Cookie: frontend=3d3tts5uumgt3v6klitfr15b05;	ALPHA	1.1.6
Set-Cookie: frontend=c7ec59c75e957b29f1d5e0d6cfcb3a98;	HEX	1.2.0.2
Set-Cookie: frontend=54f0e9aa64fe53d0f076ef0e328841d5;	HEX	1.2.1.2 
Set-Cookie: frontend=873sd3kemps1al4np0c6ndkac4;	ALPHA	1.3.1
Set-Cookie: frontend=dcf246795fa247992d07daa7a7ba147e; 	HEX	1.3.1.1
Set-Cookie: frontend=a9239941fea5df3bb1b75485d56cb817; 	HEX 	1.3.2.1
Set-Cookie: frontend=ec409bd20122a68f9c27fa66c358fc7d; 	HEX	1.4.0.1
Set-Cookie: frontend=s0ucd54lq2js68cp05sp6r2u92; 	ALPHA	1.4.0.1

=end

# Set-Cookie: magento=3s3piyt6bil5carswndryvwak6zqzo3x; expires=Tue, 02-Nov-2010 04:42:28 GMT; path=/; domain=www.malenasflowers.com (ver. 1.2.0.2)

def passive
	m=[]

	m<< {:name=>"cookie called magento" } if @meta["set-cookie"] =~ /^magento=[0-9a-f]+/
	m<< {:name=>"cookie called frontend", :certainty=>75 } if @meta["set-cookie"] =~ /^frontend=[0-9a-z]+/
	m
end


end

