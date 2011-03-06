##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated version detection
##
Plugin.define "Koobi" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.2"
description "Shop/CMS software [German] - homepage: http://www.Dream4.de/"

# Google results as at 2010-08-28 #
# 262 for "powered by Koobi PRO|SHOP|CMS" -"SQL Injection"

# Examples #
examples %w|
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

# Matches #
matches [

# powered by text
{ :regexp=>/Powered by <a title="Koobi ist ein komfortables und leistungsf&auml;higes Content-Management-System \(CMS\) f&uuml;r Privatpersonen, Vereine, kleine und mittelst&auml;ndische Unternehmen, die einen professionellen Internetauftritt realisieren m&ouml;chten."[^>]+>Koobi[\ :]*/i },

# HTML Comment
{ :text=>'<!-- powered by koobi - do not remove this info! -->' },

# Version Detection # Koobie Pro Powered by text
{ :version=>/powered by <a class="foot" href="http:\/\/www.dream4.de\/[^>]+>Koobi Pro ([\d\.]+)<\/a>/i, :module=>["Pro"] },

# Version Detection # Meta generator
{ :version=>/<meta name="generator" content="\(c\) Koobi ([\d\.]+), http:\/\/www.dream4.de" \/>/ },

# Version Detection # Powered by text
{ :version=>/Powered by <a title="Koobi ist ein komfortables und leistungsf&auml;higes Content-Management-System \(CMS\) f&uuml;r Privatpersonen, Vereine, kleine und mittelst&auml;ndische Unternehmen, die einen professionellen Internetauftritt realisieren m&ouml;chten."[^>]*>Koobi[\ :]*(SHOP|PRO|CMS)<\/a> ([\d\.]+)/i, :offset=>1 },

# Version Detection # Powered by text
{ :version=>/Powered by <a[^>]+href="http:\/\/www.dream4.de\/cms\/content\/6\/koobi\/1\/">Koobi<\/a> (PRO|SHOP|CMS)[\s]*([\d\.\ a-z]+)/i, :offset=>1 },

# Version Detection # Old Koobi CMS powered by text
{ :version=>/powered by <a[^>]+href="http:\/\/www.dream4.de\/[^>]+>koobi-cms<\/a> ([\d\.]+)/i },

# Version Detection # Powered by text
{ :version=>/<div class="copyright">powered by Koobi CMS ([\d\.]+)/ },

# Version Detection # HTML comment
{ :version=>/    Diese Webseite wurde mit Koobi[\ :]*(SHOP|PRO|CMS)[\ \-]*([\d\.\ a-z]+) erstellt./, :offset=>1 },

# Version Detection # Nulled script by antichat.ru # Powered by text
{ :version=>/powered by <a class="foot" href="http:\/\/www.antichat.ru" target="_blank">Koobi Pro ([\d\.]+) \[nulled by censored! from antichat.ru\]<\/a>/, :module=>["Nulled"] },

]

end

