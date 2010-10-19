##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Fixed regex and ghdb matches
##
Plugin.define "JAMM-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.2"
description "JAMM CMS - homepage: http://www.branchen-plz.de/"

# 6 results for "powered by JAMM CMS" @ 2010-08-08 
examples %w|
www.branchen-plz.de/de/cms/index.php?id=1
www.optik-stockhausen.de/de/cms/
www.naaimachinetotaal.nl/cms/index.php
www.miko-heizungsbau.de/cms/index.php?id=1
www.mondzorgvaals.nl/cms/
|

matches [

# Powered by text
{ :ghdb=>'"powered by JAMM CMS"', :certainty=>75 },
{ :regexp=>/<a[^>]*href="http:\/\/jammcms.jamm-media.de?ref=[0-9]*"[^>]*>powered by JAMM CMS/i },

# Meta author
{ :text=>"<META NAME='Author' CONTENT='JAMM MEDIA Technologies Team 2005'>" },
{ :text=>"<META NAME=   'author' CONTENT='JAMM MEDIA Team 2001'>" },

# HTML comment
{ :text=>'<!--- Content Management System JAMM CMS OWEN - Visit www.jamm-media.de for more informations -->' },

]

end

