##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Koobi" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "German Shop/CMS software - homepage: http://www.Dream4.de/"

# 262 results for "powered by Koobi PRO|SHOP|CMS" -"SQL Injection" @ 2010-08-28
examples %w|
aluminiumlot.com
archiwum.wrzesnia.info.pl
baumkuchen-cottbus.de
communitypower.info/online/linkverzeichnis/
instant-gold.com
mgamez.awardspace.com
www.fototools.de
www.kamerahalter.com
www.logistik-shop.com
www.myfashionbuy.com
www.taramar.de
www.sepp-tattoo.de
www.vw-community.de
www.natural-horse-care.com
www.crossgolf-portal.de/shop/
www.tmp-products.com/shop/
www.3gservice.at/shop/
www.original-socap.de
www.fahrerkarten-auswerten.de/shop/
www.slatka-tajna.de
www.radiowoche.de
www.entsperren.org
www.lifestyle1001.com/shop/produkt/
www.gsm-style.de/shop/
www.b2bshop.innocept.de/shop/
www.kraeuterspatz.at/shop/
www.proton-shop.ch/shop/
www.union-sandersdorf.de
www.keeper-shop.de/meldungen/
www.dantespforten.com/content/
www.eylul.de
www.sauna-hut.de
www.starfiretattoo.com/content/
www.phaenomen-verlag.de
www.markvice.de
www.dauercamperweb.de
www.cohimi.de
www.rechtsreferendare-duesseldorf.de
www.scripte-shop.com
www.echinocereus.de/index/
www.visionexecutive.ch
www.shop.hw-4u.de/shop/shop/
www.spieletester.com
www.dive-star.de
www.tuxonmedia.de
www.semaf.at
www.swtor-station.com
www.argentinos.info
www.kupivednaga.com
maximum-network.com/atelier/shop/produkte/
www.auroraworld.de/shop/shop/produkte/
|

matches [

# powered by text
{ :regexp=>/Powered by <a title="Koobi ist ein komfortables und leistungsf&auml;higes Content-Management-System \(CMS\) f&uuml;r Privatpersonen, Vereine, kleine und mittelst&auml;ndische Unternehmen, die einen professionellen Internetauftritt realisieren m&ouml;chten."[^>]+>Koobi[\ :]*[PRO|CMS|SHOP]*/i },

# HTML comemnt
{ :text=>'<!-- powered by koobi - do not remove this info! -->' },

]

# Version detection
def passive
        m=[]

	# Koobie Pro Powered by text
	if @body =~ /powered by <a class="foot" href="http:\/\/www.dream4.de\/[^>]+>Koobi Pro ([\d\.]+)<\/a>/i
		version=@body.scan(/powered by <a class="foot" href="http:\/\/www.dream4.de\/[^>]+>Koobi Pro ([\d\.]+)<\/a>/i)[0][0]
		 m << {:version=>version}
	end

	# Meta generator
	if @body =~ /<meta name="generator" content="\(c\) Koobi ([\d\.]+), http:\/\/www.dream4.de" \/>/
		version=@body.scan(/<meta name="generator" content="\(c\) Koobi ([\d\.]+), http:\/\/www.dream4.de" \/>/)[0][0]
		m << {:version=>version}
	end

	# Powered by text
	if @body =~ /Powered by <a title="Koobi ist ein komfortables und leistungsf&auml;higes Content-Management-System \(CMS\) f&uuml;r Privatpersonen, Vereine, kleine und mittelst&auml;ndische Unternehmen, die einen professionellen Internetauftritt realisieren m&ouml;chten.[\ target="_blank"]*[\ href="http:\/\/www.dream4.de\/cms\/content\/6\/koobi\/1\/"]*>Koobi[\ :]*[SHOP|PRO|CMS]+<\/a> ([\d\.]+)/i
		version=@body.scan(/Powered by <a title="Koobi ist ein komfortables und leistungsf&auml;higes Content-Management-System \(CMS\) f&uuml;r Privatpersonen, Vereine, kleine und mittelst&auml;ndische Unternehmen, die einen professionellen Internetauftritt realisieren m&ouml;chten."[\ target="_blank"]*[\ href="http:\/\/www.dream4.de\/cms\/content\/6\/koobi\/1\/"]*>Koobi[\ :]*[SHOP|PRO|CMS]+<\/a> ([\d\.]+)/i)[0][0]
		m << {:version=>version}
	end

	if @body =~ /Powered by <a[\ target="_blank"]* href="http:\/\/www.dream4.de\/cms\/content\/6\/koobi\/1\/">Koobi<\/a> [PRO|SHOP|CMS]*[\s]*([\d\.\ a-z]+)/i
		version=@body.scan(/Powered by <a[\ target="_blank"]* href="http:\/\/www.dream4.de\/cms\/content\/6\/koobi\/1\/">Koobi<\/a> [PRO|SHOP|CMS]*[\s]*([\d\.\ a-z]+)/i)[0][0]
		m << {:version=>version}
	end

	# Old Koobi CMS powered by text
	if @body =~ /powered by <a[^href]+href="http:\/\/www.dream4.de\/[^>]+>koobi-cms<\/a> ([\d\.]+)/i
		version=@body.scan(/powered by <a[^href]+href="http:\/\/www.dream4.de\/[^>]+>koobi-cms<\/a> ([\d\.]+)/i)[0][0]
		m << {:version=>version}
	end

	if @body =~ /<div class="copyright">powered by Koobi CMS ([\d\.]+)/
		version=@body.scan(/<div class="copyright">powered by Koobi CMS ([\d\.]+)/)[0][0]
		 m << {:version=>version}
	end

	# HTML comment
	if @body =~ /    Diese Webseite wurde mit Koobi[\ :]*[SHOP|PRO|CMS]+[\ \-\ ]*([\d\.\ a-z]+) erstellt./
		version=@body.scan(/    Diese Webseite wurde mit Koobi[\ :]*[SHOP|PRO|CMS]+[\ \-\ ]*([\d\.\ a-z]+) erstellt./)[0][0]
		 m << {:version=>version}
	end

	# Nulled script by antichat.ru powered by text
	if @body =~ /powered by <a class="foot" href="http:\/\/www.antichat.ru" target="_blank">Koobi Pro ([\d\.]+) \[nulled by censored! from antichat.ru\]<\/a>/
		version=@body.scan(/powered by <a class="foot" href="http:\/\/www.antichat.ru" target="_blank">Koobi Pro ([\d\.]+) \[nulled by censored! from antichat.ru\]<\/a>/)[0][0]
		m << {:version=>version+" - nulled by antichat.ru"}
	end

        m

end


end

