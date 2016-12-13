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
description "Opensource CMS written in PHP. Frog CMS is a PHP version of Radiant CMS, a well known Ruby on Rails application. This CMS is not easily identified, expect some false-negatives"
website "http://www.madebyfrog.com/"

 

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

