##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenConf" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-03
version "0.1"
description "OpenConf is an abstract and peer-review management system that greatly facilitates the submission and review processes for conferences, workshops, and symposia. - Homepage: http://www.openconf.com/"

# ShodanHQ results as at 2012-05-03 #
# 25 for OPENCONF

# Google results as at 2012-05-03 #
# 377 for "Powered by OpenConf"
#  63 for inurl:"chair/signin.php?OPENCONF="

# Dorks #
dorks [
'"Powered by OpenConf"'
]

# Examples #
examples %w|
www.en4en.org/openconf/
2012.ncss.org/conversations/author/submit.php
www.groupes.polymtl.ca/cirta/Colloque2009/openconf/author/reset.php
www.afaanz.org/openconf/2011/modules/request.php
www.inflibnet.ac.in/planner2010/ocs/chair/signin.php
webapps.fep.up.pt/compstat08/chair/
www.africasexuality.org/abstract/openconf.php
www.trjfas.sumae.gov.tr/oc/author/upload.php
icdim.org/jdim/
www.socialstudies.org/dc2011proposals/modules/request.php
www.gatedcommunities.istanbul2011.itu.edu.tr/openconf/chair/signin.php
iem.pub.ro/openconf/chair/signin.php
ncis-cmsp2012.shiep.edu.cn/openconf/author/paper.php
www.dasconference.ro/openconf/review/reset.php
www.pedometrics.org/dsm_oz/openconf/author/reset.php
www.dynamicpublishers.com/icnpsc4/
www.papers2010.imcsit.org/author/list_papers.php
|

# Matches #
matches [

# Footer # Powered by link
{ :text=>'Powered by <a href="http://www.OpenConf.org" target="_blank">OpenConf</a>' },

# Footer # Powered by link # Version Detection
{ :version=>/<div class="powered">Powered by <a href="http:\/\/www\.OpenConf\.com" target="_blank">OpenConf<\/a>(<sup>&reg;<\/sup>)?<!--([^\s]+)-->/, :offset=>1 },

# JavaScript # Version Detection
{ :version=>/<script type="text\/javascript" src="openconf\.js\?v=([^\s^"]+)"><\/script>/ },

# Set-Cookie # OPENCONF
{ :search=>"headers[set-cookie]", :regexp=>/OPENCONF=[^;]+;/ },

]

end

