##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-18 #
# Updated version detection
##
Plugin.define "PHP-Layers" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.2"
description 'PHP Layers Menu is a hierarchical menu system to prepare "on the fly" DHTML menus relying on the PHP scripting engine for the processing of data items.  - homepage: http://phplayersmenu.sourceforge.net'

# Google results as at 2010-06-13 #
# 33 for "Powered by PHP Layers"

# Examples #
examples %w|
phplayersmenu.sourceforge.net/demo.php
www.marcopratesi.it
www.dardensystems.com/menu/
hs.stantonysonline.com/
www.iq-institut-sh.de/phpgroupware/folders/phplayersmenu/
telug.it
kevinatkins.com/kswiki/lib/phplayers/example-hormenu_and_vermenu.php
rbl.interserver.net
www.brasscrest.com
www.cs.cas.cz/krylov/
rbl.interserver.net
grasstreegallery.com
amsit.ca/account/
rmohseni.de
www.sv-leipzig-ost-1858.de
grvc.us.es/staff/imaza/treemenu.php
www.flightdeck.pl
|

# Matches #
matches [

# GHDB: "Powered by PHP Layers"
{ :certainty=>75, :ghdb=>'"Powered by PHP Layers"' },

# Default JavaScript Comment
{ :text=>"// because Konqueror 3 sets IE = 1 ... AAAAAAAAAARGHHH!!!" },

# Default logo HTML
{ :text=>'.png" alt="Powered by PHP Layers Menu" height="31" width="88" /></a>' },

# Version Detection # HTML Comment
{ :version=>/<!-- end of menu header - PHP Layers Menu ([\d\.\-a-z]+) \(C\) [0-9]{4}-[0-9]{4} Marco Pratesi/ },

# Version Detection # JavaScript Comment
{ :version=>/\/\/ PHP Layers Menu ([\d\.\-a-z]+) \(C\) [0-9]{4}-[0-9]{4} Marco Pratesi/ },

]

end

