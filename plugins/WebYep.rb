##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebYep" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "WebYep is a compact Web Content Management System, making editable Websites extremely easy to create and maintain. Different to bigger WebCMS tools, WebYep offers a low priced alternative for small Websites. Requires: PHP - Homepage: http://www.obdev.at/products/webyep/index.html"

# Google results as at 2011-03-03 #
# 36 for intitle:"WebYep Logon"

# Examples #
examples %w|
www.obdev.at/webyep_demo/demoslot_en1111111111111111/webyep-system/programm/webyep-logon-en.php
www.obdev.at/webyep_demo/demoslot_en1111111111111111/webyep-system/programm/logon.php
www.cleonegardensinn.com/webyep-system/program/webyep-logon-en.php
mossadvertising.com.au/c234/webyep-system/program/logon.php
www.habotrailer.se/webyep-system/program/logon.php
www.cottontailwines.com.au/~cottonta/webyep-system/program/logon.php
www.restorient.com/webyep-system/program/logon.php
laerklaver.dk/webyep-system/program/l-save.php
www.schools.nt.edu.au/ntmusic/webyep-system/program/logon.php
www.beststeakinmiami.com/webyep-system/program/logon.php
www.elkhart.org/webyep-system/program/webyep-logon-en.php
www.dmrotary.org/webyep-system/program/webyep-logon-pl.php
www.webcamplaza.net/susan/child/webyep-system/program/logon.php
www.eventuate.com.au/cdn2009/webyep-system/program/logon.php
vhost10.netpresence.com.au/~chaadmin/webyep-system/program/logon.php
www.fruiton.no/webyep-system/program-alt/webyep-logon-en.php
www.turunkosmetologikoulu.fi/webyep-system/program/logon.php
www.michelswarrenmunday.com.au/community-speaks-out/webyep-system/program/logon.php
www.summerlandglass.com/webyep-system/program/webyep-logon-en.php
www.imp.no/skjult/webyep-system/program/logon.php
www.nutcrackerdesign.co.uk/Giffords/webyep-system/program/logon.php
www.ihrconsult.com/webyep-system/program/logon.php
www.horevin.gr/webyep-system/program/webyep-logon-en.php
www.sjena.de/silcc/webyep-system/programm_alt/webyep-logon-en.php
www.youngfocus.nl/webyep-system/program/logon.php
www.intrinsiqmaterials.com/webyep-system/program/webyep-logon-en.php
www.leosmitstichting.nl/webyep-system/program/webyep-logon-en.php
trackdaymagazine.com/webyep-system/program/logon.php
|

# Matches #
matches [

# webyep-logon-en.php # Warning text
{ :text=>'<p class="warning">To edit these pages with WebYep you need to <strong>enable JavaScript</strong> in your Web' },

# Default HTML Comment
{ :text=>'<html><!-- InstanceBegin template="/Templates/panels.dwt.php" codeOutsideHTMLIsLocked="false" -->' },

]

end


