##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pressflow" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "Pressflow is a distribution of Drupal with integrated performance, scalability, availability, and testing enhancements. - homepage: http://pressflow.org/"

# 67 results for +"powered by Pressflow" +"an open source content management system" @ 2010-07-18
examples %w|
patprzybilla.me
gotdrupal.com/videos/
newleafdigital.com
www.orved.org
agtoday.info
api.lullabot.com
deglos.com
www.dogolympicgames.eu
nnewton.org
www.ronnbot.com
davidseth.net
www.outlandishjosh.com/blogs/
frequencygrease.com
openlearninglabs.org
www.universalizer.com
webkenny.com
www.stealthip.com
www.caktux.ca/blog/
www.ecoforestry.ca
www.ontogrator.com
www.2tmsviluppo.com/pressflow/
zoraweb.com
joestewartjr.com
www.613commandments.com
drupalwebdesign.com.au
www.mascellaro.it
drupaldanmark.dk
www.widescreenbabes.com
www.fastdrupalthemes.com/install.php
osuosl.org/install.php
|

matches [

{ :regexp=>/<a href="http:\/\/drupal.org"><img src="[\/a-zA-Z0-9\-\_+]*\/misc\/powered-blue-80x15.png" alt="Powered by Pressflow, an open source content management system" title="Powered by Pressflow, an open source content management system" width="80" height="15" \/><\/a>/ },

{ :text=>'<title>Drupal already installed | Pressflow</title>', :version=>"Install Page" },

]

end

