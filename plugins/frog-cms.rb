##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :name & :probability
# Version 0.3
# changed Propulsé  to Propuls.{2}

Plugin.define "FrogCMS" do
author "Andrew Horton"
version "0.3"
description "Opensource CMS written in PHP. Frog CMS is a PHP version of Radiant CMS, a well known Ruby on Rails application. This CMS is not easily identified, expect some false-negatives. Homepage: http://www.madebyfrog.com/"

examples %w|
http://www.mysterytin.com/
http://www.trefethen.com/
http://whatididlastsummer.com/
http://www.corbettchiropractic.ca/
http://www.chihuahua-fassie.pl/EN/home
http://www.silviassib.pl/EN/home
http://www.vanderkleijn.net/
http://www.interfacesmontreal.org/
http://www.avfestival.co.uk
http://ajcates.com
http://websiteninjas.com
http://salettaimports.com/
http://pondsidekitchens.com/
http://www.2catdesigns.com
http://www.loosecannonec4.co.uk
http://www.oasisfororphans.org/
http://www.nphsbookclub.com/
http://www.rusnacdesignlab.com/
http://www.ropenti.com/
http://www.biblezoo.org/
http://www.nwsummerevent.com/
http://www.claritymediagroup.net/
http://www.guysbiblemeeting.com/
http://www.tokuriders.com/
http://saa.dyndns.org/
http://www.aarrowfires.com/
http://www.amicidiportopollo.it/
http://www.alimenservice.it/
http://www.lmchampagne.co.uk/
http://www.threecastlesproperty.co.uk/
http://www.rwhitespace.com/
http://ltvalda.lt/
http://www.ptites-biloutes.com/
http://www.face-id.be/
http://www.sourcehoops.com/
http://lokal54.com/
http://zouzounokosmos.gr/
| 

# /admin/ redirects to /admin/login
# which is always consistent and contains:
#      <div style="margin-top: 6px">
#        <input id="login-remember-me" type="checkbox" class="checkbox" name="login[remember]" value="checked" />
#        <input id="login-redirect" type="hidden" name="login[redirect]" value="" />
#        <label class="checkbox" for="login-remember-me">Remember me for 14 days</label>
#      </div>


#/frog/plugins/bd_contact/js/formcheck/formcheck.css" type="text/css" media="screen" /
# src="http://www.ptites-biloutes.com/frog/plugins/lytebox/lytebox.js
#<link rel="alternate" type="application/rss+xml" title="Frog Default RSS Feed"


#Propulsé par <a href="http://www.madebyfrog.com/" target="_blank">Frog CMS</a
#Powered by <a href="http://madebyfrog.com/">Frog CMS</a>
#Powered by: <a href="http://www.madebyfrog.com/" title="Frog CMS">Frog CMS</a>
#Powered by <a href="http://www.madebyfrog.com/" title="Frog CMS" target="new">Frog CMS</a>
#Powered by <a href="http://www.madebyfrog.com/" title="Frog CMS">Frog CMS</a>
#Running <a href="http://www.madebyfrog.com">Frog CMS</a>

matches [
#{:name=>"poweredBy", :regexp=>/(Powered by|Running|Propulsé par)[^<]*<a href="http:\/\/www.madebyfrog.com\/"[^>]*>Frog CMS/},
{:name=>"poweredBy", :regexp=>/(Powered by|Running|Propuls.{2} par)[^<]*<a href="http:\/\/www.madebyfrog.com\/"[^>]*>Frog CMS/},
{:name=>"default rss feed", :text=>'<link rel="alternate" type="application/rss+xml" title="Frog Default RSS Feed"'},
{:certainty=>75, :regexp=>/<[^>]+"\/frog\/plugins\//} #"
]

end

