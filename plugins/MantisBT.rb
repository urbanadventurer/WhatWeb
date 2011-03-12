##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MantisBT" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-12
version "0.1"
description "MantisBT is a popular free web-based bug tracking system. It is written in PHP works with MySQL, MS SQL, and PostgreSQL databases. - Homepage: http://www.mantisbt.org/"

# Google results as at 2011-03-12 #
# 246 for "Powered by Mantis Bugtracker"
# 11  for intitle:"MantisBT Administration" "Checking Installation"
# 4   for intitle:"MantisBT Administration - Installation" ext:php "Checking Installation"

# Examples #
examples %w|
www.defianceinteractive.com/projects/admin/install.php
mantis.madpowah.org/admin/install.php
www.pursun.net/bugTrace/admin/install.php
mp05.de/admin/install.php
szlsz.hu
www.meecc.org
www.dentalservice.ru
www.mantisbt.org/demo/
www.talendforge.org/bugs/
caml.inria.fr/mantis/
www.web-cp.net/mantis/
www.raudus.com/bugtracker/
inworldz.com/mantis/
www.euroscope.hu/Mantis/my_view_page.php
www.hastymail.org/mantis/
62.166.198.202
bugs.orfeo-toolbox.org
gm4mac.yoyogames.com
dev.omnetpp.org/bugs/
bugtraq.steamcore.se
bugs.intellegit.com
bugs.neonascent.com
www.packetfence.org/bugs/
opensimulator.org/mantis/
bugtracking.just-works.de/login_page.php
www.clevercomponents.com/bugtracker/
mybeehome.com/mantis/
gaggle.systemsbiology.net/mantis/
www.specknet.org/mantis/
www.maconnect.ch/mantisbt/
www.eda.org/svdb/
bugs.qtmoko.org
www.wowraidmanager.net/mantis/
springrts.com/mantis/
bugs.centos.org
demandas.pbh.gov.br
www.vet.minpolj.gov.rs/pm/
servicios.vuce.gov.co/mantis/
mantis.serpro.gov.br
https://projects.lbl.gov/mantis/signup_page.php
https://metrics1.jpl.nasa.gov/mantis/
|

# Matches #
matches [

# Logo Link # >= 1.1.x
{ :regexp=>/<div align="right"><a href="http:\/\/www.mantisbt.org" title="Free Web Based Bug Tracker"><img src="[^"]*images\/mantis_logo_button.gif" width="88" height="35" alt="Powered by Mantis Bugtracker" border="0" \/><\/a><\/div>/ },

# Logo Link # <= 1.0.x
{ :regexp=>/<div align="right"><a href="http:\/\/www.mantis(bugtracker.com|bt.org)" title="Powered by Mantis Bugtracker"><img src="[^"]*images\/mantis_logo_button.gif" width="88" height="35" alt="Powered by Mantis Bugtracker" border="0" \/><\/a><\/div>/ },

# Version Detection # >= 1.1.x
{ :version=>/<span class="timer"><a href="http:\/\/www.mantisbt.org\/" title="Free Web Based Bug Tracker">Mantis(BT)? ([\d\.]+)<\/a>\[<a href="http:\/\/www.mantisbt.org\/"  title="Free Web Based Bug Tracker" target="_blank">\^<\/a>\]<\/span>/, :offset=>1 },

# Version Detection # <= 1.0.x
{ :version=>/<span class="timer"><a href="http:\/\/www.mantis(bugtracker.com|bt.org)\/">Mantis ([\d\.]+)<\/a>\[<a href="http:\/\/www.mantis(bugtracker.com|bt.org)\/" target="_blank">\^<\/a>\]<\/span>/, :offset=>1 },

# Install Page # Default Title
{ :string=>"Install", :text=>"<title> MantisBT Administration - Installation  </title>" },

]

end


