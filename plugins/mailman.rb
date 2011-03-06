##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-05 # Brendan Coles <bcoles@gmail.com>
# Updated version detection
##
Plugin.define "Mailman" do
author "Tonmoy Saikia"
version "0.2"
description "Mailman is free software for managing electronic mail discussion and e-newsletter lists. WEB:http://www.gnu.org/software/mailman/index.html"

# Google results as at 2011-03-05 #
# 443 for inurl:mailman "Delivered by Mailman"
# 300 for inurl:mailman "Delivered by Mailman" inurl:edu
# 205 for inurl:mailman "Delivered by Mailman" inurl:gov
# 25  for inurl:mailman "Delivered by Mailman" inurl:mil

# Examples #
examples %w|
http://mail.opensolaris.org/mailman/listinfo
https://dev.eclipse.org/mailman/listinfo/
http://lists.hosef.org/listinfo.cgi
http://lists.apple.com/mailman/
http://mailman.metu.edu.tr/mailman/listinfo/
http://lists.natureserve.org/mailman/listinfo
http://mail.gnome.org/mailman/listinfo
http://ncsi.iisc.ernet.in/mailman/listinfo/
http://www.daa.com.au/mailman/listinfo/
http://www.itk.org/mailman/listinfo/
http://lists.macosforge.org/mailman/listinfo.cgi
http://listas.datasus.gov.br/cgi-bin/mailman/listinfo
https://correo.ingeominas.gov.co/mailman/listinfo/
http://lists.cendoj.ramajudicial.gov.co/mailman/listinfo/
http://lists.lsc.gov/mailman/listinfo/
http://gov.gov1.us/mailman/listinfo
http://mailman.pge.rs.gov.br/mailman/listinfo
|

# Matches #
matches [

# GHDB Match
{ :certainty=>25, :ghdb=>'inurl:mailman "Delivered by Mailman"'},

# Mailing list listinfo links
{ :regexp=>/<td><a[^>]+href="[^"]+\/listinfo\/[^"]+"><strong>[^<]+<\/strong><\/a><\/td>/ },

# Version Detection # Delivered by logo
{ :version=>/<td><img src="[^"]+\/mailman.jpg" alt="Delivered by Mailman"[^>]+><br>version (\d.\d.[0-9a-z]+)/ },

# Version Detection # Delivered by text
{ :version=>/<td><a href="http:\/\/www.gnu.org\/software\/mailman\/index.html">Delivered by Mailman<br>version (\d.\d.[0-9a-z]+)<\/a>/ },

]

end

