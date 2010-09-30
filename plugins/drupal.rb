##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name and :certainty=>100

Plugin.define "Drupal" do
author "Andrew Horton"
version "0.2"
description "Drupal is an opensource CMS written in PHP. Homepage: http://www.drupal.org"

# hard to identify
#<a href="http://drupal.org"><img src="/dagboek/misc/powered-black-80x15.png" alt="Powered by Drupal, an open source content management system" title="Powered by Drupal, an open source content management system" width="80" height="15" /></a>  </div>
#  <script type="text/javascript" src="/misc/drupal.js"></script>
#  <script type="text/javascript" src="/main/misc/drupal.js"></script>
# @import "/misc/drupal.css";

# Set-Cookie: SESS6bdd09d4debccdc3a0f49becc449e8d5=2sq674vjn6vig48e3podh3j8e2; expires=Fri, 11 Dec 2009 15:37:52 GMT; path=/; domain=.moby.com
# Set-Cookie: SESS9795bcd4ea70e3f846e84f29f9491636=57eafcca6400d894772a136fb5889b92; expires=Fri, 11-Dec-2009 15:38:25 GMT; path=/; domain=.save-your-future.com


examples %w| amnesty.org/ appel.nasa.gov/ beta.worldbank.org/ entergy.pewclimate.org/ labs.divx.com/ lindenlab.com/ littlestarprints.com moby.com/ myplay.com/ sequelnaturals.com/ teen.secondlife.com/ www.artwaves.de www.asys.com.br/ www.atomicbop.net www.cristal.com.pe/?adulto=si www.dutchbutnotfromholland.eu/ www.elespectador.com/ www.ensembles.com.ph/ www.foxsearchlight.com/index.php www.freshbrain.org/ www.icsalabs.com/ www.johnnycashonline.com/ www.journalismcenter.org/ www.jovenscriativos.com.br/ www.koalafoundation.org.au/ www.la2day.com/ www.moove.be www.mtv.co.uk/channel/flux www.mulinobianco.it/ www.multiways.com/ www.nowpublic.com/ www.pravda.lt/ www.realismssoftware.com/ www.save-your-future.com www.shock.com.co/ www.sosojuicy.com/ www.spreadfirefox.com/ www.tidningenresultat.se www.ubuntu.com/ www.universitytowers.net/ www.warnerbrosrecords.com |

matches [
{:regexp=>/<script type="text\/javascript" src="[^\"]*\/misc\/drupal.js[^\"]*"><\/script>/},
{:regexp=>/<[^>]+alt="Powered by Drupal, an open source content management system"/},
{:regexp=>/@import "[^\"]*\/misc\/drupal.css"/},
{:text=>'jQuery.extend(Drupal.settings,'},
{:text=>'Drupal.extend('}
]

def passive
	m=[]
	#SESS 9795bcd4ea70e3f846e84f29f9491636 =6b74f8aff4bf7d34d181a6a380d1ec7b; expires=Tue, 15-Dec-2009 15:21:24 GMT; path=/; domain=.save-your-future.com
	m << {:name=>"SESS Drupal Cookie", :certainty=>75 } if @meta["set-cookie"] =~ /^SESS[a-z0-9]{32}=[a-z0-9]{32}/
	m
end


end



