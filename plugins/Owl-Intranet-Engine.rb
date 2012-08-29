##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Owl-Intranet-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-30
version "0.1"
description "Owl is a multi user document repository (knowledge base) system written in PHP for publishing files/documents onto the web. - Homepage: http://owl.anytimecomm.com"

# ShodanHQ results as at 2012-08-30 #
# 87 for owl_sessid

# Google results as at 2012-08-30 #
# 143 for "Owl Intranet Engine, Version Owl" "Username" "Password"

# Dorks #
dorks [
'"Owl Intranet Engine, Version Owl" "Username" "Password"'
]

# Examples #
examples %w|
216.226.17.58
200.251.41.147
200.76.54.33
87.106.187.164
208.79.212.25
212.9.179.171
88.217.240.10
122.166.13.166
189.210.155.69
owl.anytimecomm.com/demo-owl/demo-owl-ul
www.caribrm.com/caribreports/
doc.steelpencil.com
www.societyofscholastics.org/library/
www.nordgen.org/documents/
web.eu-egi.eu/internal/document-server/
www.gips.unisi.it/intune_intranet/index.php?login=1&currentdb=0
ligne2-douai.com
www.sdt-owl.com
ingerop-tcsp.com
www.rerc-wts.org
dms.dhmtx.com
dda9.com
www.sirithorn.ch/Owl/index.php?login=1
www.noehk.at/raum/index.php
www.smartmedla.com/owl/
https://www.neugrid.eu/owl-0.90/index.php?login=1
https://semiramis.atosresearch.eu/owl1.0/index.php
|

# Matches #
matches [

# Cookie # owl_sessid
{ :search=>"headers[set-cookie]", :regexp=>/owl_sessid=/ },

# Footer # Version Detection
{ :version=>/<a class="version2" href="http:\/\/owl\.sourceforge\.net\/" target="_blank">Owl Intranet Engine, Version Owl ([^<]+)<\/a>/ },

# Title # # Version Detection
{ :version=>/<title>[^<]+ Owl ([\d\.]+ [\d]{8})<\/title>/ },

]

end

