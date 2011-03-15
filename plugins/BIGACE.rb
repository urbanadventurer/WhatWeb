##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BIGACE" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "BIGACE is not just an easy to use Web Content Management System (CMS), but offers also a scripting API and an extensible architecture for developing, maintaining, and deploying applications. - Homepage: http://www.bigace.de/"

# Google results as at 2011-03-15 #
# 344 for "Powered by BIGACE" -dork

# Examples #
examples %w|
www.bigace.de
dev.bigace.org/nightly_v2/
dev.bigace-cms.com
demo.opensourcecms.com/bigace/
www.geoinformatik2010.de
www.roth-electronic.eu
www.the-blue-witch.de
www.lip.pt/outreach/radao/
digitware.biz
www.coonaras.de
www.11aa.de
www.gabi.eisenpixel.de
www.forest.ro
www.stefanhofer.info
www.chaltuu-vom-lahberg.de
einseitighoeren.de
www.hotelvantis.lv/cms/
www.trifug.org
www.sf-gefahrgut.de
www.ernesti.es
hvrm.de
www.kosternet.nl
ijestem.pl
www.euroland20-21.de
www.diemonsterwg.de
www.r-me.de
www.roth-electronic.info
www.pcschmiede.org
www.tvmovil.com.pa
aceinvestor.eu/bigace/
www.juette-kassel.de
www.die-stars-nackt.com
www.olivertraxel.ch
n6roq.us
www.aguasoltec.com
www.lalea.fr
sar-hosting.net
80.68.45.141/hrn/
80.108.75.27/bigace/
www.trifug.org
iloveyoueatthis.com
www.natinna.com
www.ivao.ch/ba_cms/
pacific-wings-consulting.com
www.hotelvantis.lv
behringgifts.com
www.populationhealthsciences.org
newgate-consulting.de
edmc.mobi
www.kimai.org
www.leelong.net/prudent/
www.googleadsend.com
|

# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.bigace.de/" target="_blank">BIGACE</a>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.bigace.de\/"[^>]*>BIGACE ([\d\.]+)<\/a>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="BIGACE ([\d\.]+)"( \/)?>/ },

# Version Detection # HTML Comment
{ :version=>/<!--[\r\n][\r\n]   Site is running BIGACE ([\d\.]+) [\r\n]        a PHP based Web CMS for MySQL[\r\n]             \(C\) Kevin Papst \(www.bigace.de\)[\r\n]/ },

]

end


