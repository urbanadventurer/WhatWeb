##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "AWStats" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-04
version "0.1"
description "AWStats - Free log file analyzer for advanced statistics (GNU GPL). - homepage:http://awstats.sourceforge.net/"
examples %w|
alfven.princeton.edu/cgi-bin/awstats.pl
www.2server.amazound.com.ar/awstats/cgi-bin/awstats.pl
first-cis.com/awstats/cgi-bin/awstats.pl
graciaaudio.com/awstats/cgi-bin/awstats.pl/awstats.pl
artdebois.com/awstats/cgi-bin/awstats.pl
http://pres4.thefungallink.com/awstats/cgi-bin/awstats.pl
endless-referrals.com/awstats/cgi-bin/awstats.pl
brementravelguide.com/awstats/cgi-bin/awstats.pl
drupal.playart.org/awstats/cgi-bin/awstats.pl
westernwarner.com/awstats/cgi-bin/awstats.pl
sky-venture.org/awstats/cgi-bin/awstats.pl
cleaningfx.ca/awstats/cgi-bin/awstats.pl
173.83.42.254/awstats.old/cgi-bin/awstats.pl
flaub.com.ar/awstats/cgi-bin/awstats.pl
cupidoclub.net/awstats/cgi-bin/awstats.pl
abujafaralmonsor.com/awstats/cgi-bin/awstats.pl/awstats.pl
www.spiriteye.com/webstats/awstats.pl
hbg.dhcook.net/awstats/cgi-bin/awstats.pl
penninckx.com/awstats/cgi-bin/awstats.pl
download.haibei.net/cgi-bin/awstat/awstats.pl
bestbrospc.com/awstats/cgi-bin/awstats.pl
ddr.treasurechestsolutions.com/awstats/cgi-bin/awstats.pl
|

matches [

# About 676,000 results @ 2010-6-04
{:certainty=>75, :ghdb=>'inurl:awstats ext:pl +intitle:"Statistics for"'},
{:text=>'<a href="http://awstats.sourceforge.net" target="_newawstats">Created by awstats</a><br>'},
{:text=>'<meta http-equiv="description" content="Awstats - Advanced Web Statistics for'},
{:name=>"default logo", :text=>'<a href="http://awstats.sourceforge.net" target="_newawstats"><img src="/icon/other/awstats_logo1.png" border=0 alt="awstats Official Web Site" title="awstats Official Web Site"></a>'}


]

end

