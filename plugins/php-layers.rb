##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Layers" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.1"
description 'PHP Layers Menu is a hierarchical menu system to prepare "on the fly" DHTML menus relying on the PHP scripting engine for the processing of data items.  - homepage: http://phplayersmenu.sourceforge.net'
examples %w|
phplayersmenu.sourceforge.net/demo.php
www.marcopratesi.it
www.dardensystems.com/menu/
hs.stantonysonline.com/
wowgatheringbot.com/_lib/prod/third/phplayersmenu/
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
grvc.us.es/staff/imaza/
www.flightdeck.pl
|

matches [

# About 33 result @ 2010-06-13
{:name=>'GHDB: "Powered by PHP Layers"',
:certainty=>75,
:ghdb=>'"Powered by PHP Layers"'
},

{:name=>'default javascript comment',
:text=>"// because Konqueror 3 sets IE = 1 ... AAAAAAAAAARGHHH!!!"
}

]

# // PHP Layers Menu 3.2.0-rc (C) 2001-2004 Marco Pratesi - http://www.marcopratesi.it/
# // PHP Layers Menu 3.1.5 (C) 2001-2004 Marco Pratesi - http://www.marcopratesi.it/
# // PHP Layers Menu 3.1.1 (C) 2001-2003 Marco Pratesi (marco at telug dot it)
def passive
        m=[]

	# html comment version
        if @body =~ /<!-- end of menu header - PHP Layers Menu [\d\.\-a-z]+ \(C\) [0-9]{4}-[0-9]{4} Marco Pratesi/
		v=@body.scan(/<!-- end of menu header - PHP Layers Menu ([\d\.\-a-z]+) \(C\) [0-9]{4}-[0-9]{4} Marco Pratesi/)[0].to_s
		m << {:name=>"html comment version", :version=>v }
        end

	# javascript comment version
        if @body =~ /\/\/ PHP Layers Menu [\d\.\-a-z]+ \(C\) [0-9]{4}-[0-9]{4} Marco Pratesi/
                v=@body.scan(/\/\/ PHP Layers Menu ([\d\.\-a-z]+) \(C\) [0-9]{4}-[0-9]{4} Marco Pratesi/)[0].to_s
                m << {:name=>"javascript comment version", :version=>v }
        end

	m

end

end

