##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-21 #
# Updated version detection
##
Plugin.define "Traidnt-UP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-26
version "0.2"
description "Traidnt UP - homepage: http://www.traidnt.net"

# Google results as at 2010-09-26 #
# 470 for "powered by Traidnt UP Version"

# Examples #
examples %w|
shjoonalhajri.net
moon-14.net
iraqeon.net
slayl-abs.net
up.sa-l.com
3eeb.alkrsan.net
iraqiyat.net/up/
up.sitamol.net
up.klgcol.net
ebnelqady.com
alfdol.net
ll1ll.com
a5fe.net
hanasa-up.ueuo.com
up-zazlux.co.cc
up.esgmarkets.com
www.not-world.com
www.baghdadyat.com
www.7fz.net
www.mishooo.org
www.sabagate.com
www.z3lanh.net
www.3adany.net
www.2upl.com
www.silence-gate.org
www.14nooor.net
www.noor-alyaqeen.com/up/
www.sada9.com
www.m1111.net
www.up.up-alswalf.com
www.kber-g.co.cc
www.iqpic.com
www.turaif.me/upload/
www.vb-k.com/up/
www.1rmad.com/up/
|

# Matches #
matches [

# HTML comment
{ :text=>'<!-- # START HEDARE -->' },

# Powered by link HTML
{ :text=>"<font color='#000080'><a href='http://traidnt.net' target='_blank'>" },
# Powered by text
{ :text=>"			<span style='text-decoration: none'><font color='#000000'>Traidnt&nbsp;UP</font></span></a></font></span></b>" },

# Version Detection # Powered by text
{ :version=>/<p align='center' dir='ltr'>Powered by Traidnt UP Version ([\d\.]+)<\/p>/ },

# Version Detection # Powered by text
{ :version=>/<div class="footer">Powered by <a href="http:\/\/traidnt.net" target="_blank">TRAIDNT UP<\/a> Version ([\d\.]+)[\s]*<\/div>/ },

# Version Detection # Default HTML + whitespate format
{:version=>/			<span style='text-decoration: none'><font color='#000000'>Traidnt&nbsp;UP<\/font><\/span><\/a><\/font><\/span><\/b>[\r\n]{2}			Version ([\d\.]+)<\/p>/ },

]

end

