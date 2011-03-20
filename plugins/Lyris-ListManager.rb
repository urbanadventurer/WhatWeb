##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lyris-ListManager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-21
version "0.1"
description "Lyris ListManager email marketing software is a secure, installed solution with email deliverability and reporting - Homepage: http://www.lyris.com/solutions/listmanager/"

# Google results as at 2011-03-21 #
# 233 for inurl:lyris.pl filetype:pl

# Examples #
examples %w|
lists.lyris.net/cgi-bin/lyris.pl
earth.lyris.net/cgi-bin/lyris.pl
durbanwatch.com/cgi-bin/lyris.pl
deluxe.talklist.com/cgi-bin/lyris.pl
lists.bmma.net/cgi-bin/lyris.pl
summit.talklist.net/cgi-bin/lyris.pl
list.peoplesclubworldwide.org/cgi-bin/lyris.pl
lists.asaenet.org/scripts/lyris.pl
lm.hvsinternational.com/cgi-bin/lyris.pl
www.policy.hu/cgi-bin/lyris.pl
krsna.srvmail.com/cgi-bin/lyris.pl
lists.corrections.com/scripts/lyris.pl
mail.ezone.co.za/cgi-bin/lyris.pl
maillist.ussoccer.org/cgi-bin/lyris.pl
www.kbx.de/cgi/lyris.pl
belleairegroups.com/cgi-bin/lyris.pl
saferoutes.listserve.us/cgi-bin/lyris.pl
listserver.indire.it/cgi-bin/lyris.pl
infobrev.dk/cgi-bin/lyris.pl
hyperion.math.upatras.gr/cgi-bin/lyris.pl
ml.kanazawa-u.ac.jp/cgi-bin/lyris.pl
luna.is-koeln.de/cgi-bin/lyris.pl
burst.sparklist.com/scripts/lyris.pl
gracetalk.worthyofpraise.org/cgi-bin/lyris.pl
impala.iqonline.net/cgi-bin/lyris.pl
list.aore.org/lyris.pl
list.courthousesquare.net/cgi-bin/lyris.pl
list.cpath.org/cgi-bin/lyris.pl
list.equalhealth.info/cgi-bin/lyris.pl
list.filenet.com/cgi-bin/lyris.pl
list.lemuria.net/cgi-bin/lyris.pl
list.ncmgm.org/cgi-bin/lyris.pl
lists.bmma.net/cgi-bin/lyris.pl
lists.carpe.net/cgi-bin/lyris.pl
lists.dowling.edu/cgi-bin/lyris.pl
listserv.nena.org/cgi-bin/lyris.pl
listserv.salemstate.edu/cgi-bin/lyris.pl
lists.iowabirds.org/cgi-bin/lyris.pl
lists.nalp.org/cgi-bin/lyris.pl
lists.nema.org/scripts/lyris.pl
lists.ozhosting.com/cgi-bin/lyris.pl
list.unclutter.com/cgi-bin/lyris.pl
lyris.bestnet.net/cgi-bin/lyris.pl
lyris.idrc.ca/cgi-bin/lyris.pl
lyris.planetpatchwork.com/scripts/lyris.pl
lyris.quiltropolis.com/scripts/lyris.pl
lyris.sunbelt-software.com/scripts/lyris.pl
marvin.smumn.edu/cgi-bin/lyris.pl
ml.capcorphq.com/lyris.pl
morganhandmill.talklist.com/cgi-bin/lyris.pl
https://listserver.itd.umich.edu/cgi-bin/lyris.pl
tca.listserve.us/cgi-bin/lyris.pl
vx.worldbank.org/cgi-bin/lyris.pl
www.errantyears.com/cgi-bin/lyris.pl
www.grida.no/cgi-bin/lyris.pl
www.idrc.ca/cgi-shell/lyris.pl
www.informatics.jax.org/lyris-cgi/lyris.pl
www.listport.com/cgi-bin/lyris.pl
www.lyrishosting.com/cgi-bin/lyris.pl
www.policy.hu/cgi-bin/lyris.pl
www.webelists.com/cgi/lyris.pl
|

# Matches #
matches [

# Version Detection # HTML Comment
{ :version=>/<!-- page: [^,]+, version: (Lyris )?ListManager(SQL)? (LINUX|WIN32) [^>]*version ([^-]+) - [A-Z][a-z]{2} [\d]{1,2} [\d]{4}( [\d]{2}:[\d]{2}:[\d]{2})?, interface:/, :offset=>3 },

# OS Detection # HTML Comment
{ :os=>/<!-- page: [^,]+, version: (Lyris )?ListManager(SQL)? (LINUX|WIN32) [^>]*version ([^-]+) - [A-Z][a-z]{2} [\d]{1,2} [\d]{4}( [\d]{2}:[\d]{2}:[\d]{2})?, interface:/, :offset=>2 },

# Local File Path Detection # HTML Comment
{ :filepath=>/<!-- this page created by: '([^'^\(]+)', line: [\d]+, package: 'lweb' -->/ },

# Version Detection # HTML Comment
{ :version=>/<!-- (Lyris )?List[\s]*Manager (WIN32|LINUX) version ([^\/]+) (- [A-Z][a-z]{2} [\d]{1,2} [\d]{4})?( [\d]{2}:[\d]{2}:[\d]{2})?\/ lyrispg.pl version [^>]+ -->/, :offset=>2 },

# OS Detection # HTML Comment
{ :os=>/<!-- (Lyris )?List[\s]*Manager (WIN32|LINUX) version ([^\/]+) (- [A-Z][a-z]{2} [\d]{1,2} [\d]{4})?( [\d]{2}:[\d]{2}:[\d]{2})?\/ lyrispg.pl version [^>]+ -->/, :offset=>1 },

# hidden input
{ :regexp=>/<INPUT TYPE="hidden" NAME="check_code" VALUE="[^"^>]+">/ },

# Server is currently unavailable
{ :text=>'<html><h3>This Lyris ListManager Server is currently unavailable.<br>' },

# Menu HTML
{ :text=>'<font face="Arial, Helvetica, sans-serif" color="#000000"><b><i>Main Menu</i></b></font><br>' },

]

end


