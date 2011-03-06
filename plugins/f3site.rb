##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches and version detection
##
Plugin.define "F3Site" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-27
version "0.2"
description "F3Site is a lightweight CMS written in XHTML 1.0 Strict, CSS and PHP 5. It lets you create multilingual websites without necessity of separate installation for each language. - homepage: http://compmaster.prv.pl"

# 64 results for "powered by F3Site" -exploit -dork @ 2010-10-20
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

# Powered by text
{ :text=>'<a href="http://compmaster.prv.pl" target="_blank">powered by F3Site</a></span>' },
{ :regexp=>/Powered by[^>]*<a[^>]*href="http:\/\/compmaster.prv.pl[^>]*>F3Site[^>]*<\/a>/ },
{ :regexp=>/Powered by[^>]*<a[^>]*href="http:\/\/dhost.info\/compmaste[^>]*>F3Site[^<]*<\/a>/ },

# Version detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/compmaster.prv.pl">F3Site v([\d\.]+) plus<\/a>/ },

]

end

