##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eXtreme-Message-Board" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "XMB is a lightweight PHP forum software with all the features you need to support a growing community. - homepage: http://www.xmbforum.com/"

# 304 results for "powered by XMB" @ 2010-10-12
examples %w|
blissmb.net
forum.julnowrimo.com
forum.simdynasty.com
forum.thegardenfestival.eu/xmb/
forums.tagbilaran.gov.ph
forums.xmbforum.com
scalehobby.com
www.airgroup51.com/forums/
www.cemeterydrive.net
www.chemuserworld.com/forum/index.php
www.deuxmb.net
www.dfreload.com
www.ironwindmetals.com/agora/
www.lasereyeforum.com
www.lighttek.com/forum/
www.netvasco.com.br/forum/
www.nswcorvettes.com.au/forum/
www.ozhiphop.com/forum/
www.rossica.org/Samovar/
www.thecultweb.com/forum/
www.ventanasystems.co.uk/forum/
www.xmbgarage.com
|

matches [

# Default HTML comments
{ :text=>'<!-- Powered by XMB  -->' },
{ :text=>'<!-- Aventure Media & The XMB Group -->' },
{ :text=>'<!-- www.aventure-media.co.uk  :  www.xmbforum.com -->' },

# Version detection # Powered by text
{ :version=>/^Powered by XMB ([^<]+)<br \/>/ },

# Version detection # Default title
{ :version=>/<title>[^\-]+- Powered by XMB ([^<]+)<\/title>/ },

# Version detection # HTML comments
{ :version=>/^<!-- Powered by XMB ([^\ \ ]+)/ },

]

end

