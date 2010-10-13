##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name

Plugin.define "TypoLight" do
author "Andrew Horton"
version "0.2"
description "TypoLight is an OpenSource CMS written in PHP. Homepage: www.typolight.org"

examples %w|
www.dobiecki.com
www.whitakeroil.com
www.shiatsu-aroma.at
www.degas-atd.com
www.hydroenergie.de
www.soleil-royal.ch
www.psdab.com
www.rivieratimes.com
www.elt-online.co.uk
www.aquazulplaya.com
www.dm-toys.de
www.docklandsrecycling.co.uk
www.mohawktrail.com
www.stg-brandenburg.de
www.zoaroutdoor.com
www.hydroenergie.de
www.schroetgens-architekten.de
www.beilharz-strasse.de
www.netzwerk-ladenbau.de
www.risktransfer.net/
www.ostseefibel.de
www.75marketing.net
www.ecopage.at
|

matches [
{:name=>"typolight.css", :text=>'<link rel="stylesheet" href="system/typolight.css" type="text/css" media="screen" />'},
{:text=>'This website is powered by TYPOlight Open Source CMS :: Licensed under GNU/LGPL'},
{:text=>'<!-- indexer::continue -->'}
]

# /typolight page
# <title>Hydro Energie Roth :: TYPOlight Open Source CMS 2.8</title>
# TYPOlight webCMS :: TYPOlight webCMS 2.7

def aggressive
	m=[]
	
	target = URI.join(@base_uri.to_s,"/typolight/").to_s
	status,url,ip,body,headers=open_target(target)
	
	if body =~ /<title>[^<]+TYPOlight[^<]+CMS ([^<]+)<\/title>/
		version=body.scan(/<title>[^<]+TYPOlight[^<]+CMS ([^<]+)<\/title>/)[0][0]
		m << {:name=>"login page version", :version=>version}
	end	
	m
end


end

