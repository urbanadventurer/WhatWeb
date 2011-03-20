##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Edito-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-20
version "0.1"
description "Edito CMS [Polish] - Homepage: http://www.edito.pl/"

# Examples #
examples %w|
www.prezydent.pl
www.mnw.art.pl
www.mpk.krakow.pl
www.projektcollege.pl
www.api.polpharma.com
www.dolinalotnicza.pl
www.ideo.pl
portalprocesowy.pl
dispute.wardynski.com.pl
www.zelmer.com
www.leczna.pl
www.furniture.eu
www.hutmen.pl
www.czystosc.splast.com.pl
www.egmont.pl
www.wb.com.pl
www.komfortbase.eu
www.pracodawcyrp.pl
www.zelmer.hu
www.gotfryd.pl
www.centurion.com.pl
www.europark.com.pl
www.jwconstruction.com.pl
www.zak.edu.pl
www.plastinvent.pl
|

# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta name="(g|G)enerator" content="(E|e)dito( CMS)? - www\.edito\.pl"[\s]*\/?>/ },

# Powered by link
{ :regexp=>/Powered by[\s]*:?[\s]+<a[^>]+href="http:\/\/www.edito.pl[\/]?"[^>]+title="Edito CMS"[^>]*>/i },

]

end


