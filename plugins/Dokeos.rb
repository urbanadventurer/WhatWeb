##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dokeos" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "Dokeos is an open source online learning suite. It provides all the features needed for e-learning and blended learning management : From Authoring to Reporting. - Homepage: http://www.dokeos.com/"

# Google results as at 2011-03-24 #
# 3   for intitle:"Dokeos has not been installed"
# 578 for "Portal Dokeos"

# Examples #
examples %w|
demo.dokeos.com
campus.dokeos.com
www.messianicondemand.co.cc
demo.opensourcecms.com/dokeos/
apelos.squareserve.com
ponce.inter.edu/nhp/contents/webct2/chamilo/
easyjetfact.com
dokeos.uaa.edu
tatsujin-web.com/main/install/index.php
www.advance365.org
www.uacqb-guerrero.org.mx/dokeos/
elearning.ecac-ceac.org/
www.advance365.me.uk
www.ksjoma.be/dokeos/
elearning.mspas.gob.gt
lms.godevzone.com
mylearningspot.org
edu.pfri.hr/dokeos/
www.u.edu.gt/dokeos/
82.114.92.139/dokeos/
dokeos.isboweb.be
fad-pascal.net/dokeos/
www.vithoulkas.edu.gr
www.ozarkempirecft.com
aulavirtual.usac.edu.gt/cursospsicologia/
www.cunoroc.edu.gt/virtual/
fcvirtual.uni.edu.pe
www.esar.edu.pt/gestaodocumental/
www.istrfa.edu.pe/aula/
e-learning.asys.edu.co
www.podologiaepm.edu.mx/campus/
ecourse.chandraonline.info
www.cesuver.edu.mx/plataforma/virtual.s1/
www.cesuver.edu.mx/plataforma/virtual.s2/
www.cesuver.edu.mx/plataforma/virtual.s3/
www.cesuver.edu.mx/plataforma/virtual.s4/
www.cesuver.edu.mx/plataforma/virtual.s5/
www.cesuver.edu.mx/plataforma/virtual.s6/
www.cesuver.edu.mx/plataforma/virtual.s7/
www.cesuver.edu.mx/plataforma/virtual.s8/
|

# Matches #
matches [

# ul id
{ :certainty=>25, :text=>'<ul id="dokeostabs">' },

# HTML Comment
{ :text=>'<!-- start of #main wrapper for #content and #menu divs -->' },

# link tags
{ :certainty=>75, :text=>'<link href="http://www.dokeos.com/documentation.php" rel="Help" />' },
{ :certainty=>75, :text=>'<link href="http://www.dokeos.com/team.php" rel="Author" />' },
{ :certainty=>75, :text=>'<link href="http://www.dokeos.com" rel="Copyright" />' },

# Meta Generator
{ :text=>'<meta name="Generator" content="Dokeos">' },

# Install Page # Title
{ :certainty=>75, :text=>'<title>Dokeos has not been installed</title>' },

# Install Page # Click to Install
{ :regexp=>/<form action="main\/install\/index\.php" method="get"><button class="save" type="submit"[^>]+value="&nbsp;&nbsp; Click to INSTALL (Dokeos|DOKEOS)[\s]+&nbsp;&nbsp;" >Click to INSTALL (Dokeos|DOKEOS)[\s]*<\/button><\/form><br \/>/, :string=>"Install Page" },

# Year Detection # Copyright
{ :string=>/<div class="copyright">[^<]+<a href="http:\/\/www\.dokeos\.com" target="_blank">[\s]*Dokeos [\d\.]*<\/a> &copy; (20[\d]{2})[\s]*<\/div>/ },

# Version Detection # Copyright
{ :version=>/<div class="copyright">[^<]+<a href="http:\/\/www\.dokeos\.com" target="_blank">[\s]*Dokeos ([\d\.]+)<\/a>/ },

# Version Detection # Install Page # Title
{ :version=>/<title>&mdash; Dokeos Installation &mdash; Version ([\d\.]+)<\/title>/, :string=>"Install Page" },

]

end


