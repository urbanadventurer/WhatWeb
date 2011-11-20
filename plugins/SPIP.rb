##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-11-20 #
# Replaced passive[] with matches
# Added google dork and module detection
##
Plugin.define "SPIP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-12
version "0.2"
description "SPIP is a publishing system for the Internet in which great importance is attached to collaborative working, to multilingual environments, and to simplicity of use for web authors. - Homepage: http://www.spip.net/"

# ShodanHQ results as at 2011-11-20 #
# 1,825 for Composed-By spip # 1,321 in France
# 1,531 for x-spip-cache # 1,116 in France
#    48 for spip.php

# Google results as at 2011-11-20 #
# 505 for inurl:"spip.php" "Login (identifiant de connexion au site)"

# Dorks #
dorks [
'inurl:"spip.php" "Login (identifiant de connexion au site)"'
]

# Examples #
examples %w|
69.70.33.3
81.201.178.225
82.151.64.2
91.207.254.82
62.58.108.110
147.210.232.193
195.220.70.6
194.199.99.4
213.139.127.54
213.251.187.134
217.70.191.175
www.glpi-project.org
creamaster.free.fr
p.arvers.free.fr
volontaires.ain.free.fr
www.productivix.com
printempspoetique.free.fr/spip.php
|

# Matches #
matches [

# div class="formulaire_spip formulaire_recherche"
{ :text=>'<div class="formulaire_spip formulaire_recherche"' },

# Meta Generator # Version Detection
#{:version=>/<meta name="generator" content="SPIP ([^\s]+ \[[\d]+\])"( \/)?>/ },
{ :version=>/<meta name="generator" content="SPIP ([^\s]+) \[[\d]+\]"( \/)?>/ },

# HTTP Header # Composed-By # Version Detection
{ :search=>"headers[composed-by]", :version=>/SPIP ([^@]{1,10}) @ www\.spip\.net/ },

# HTTP Header # Composed-By # Module Detection
{ :search=>"headers[composed-by]", :module=>/SPIP [^@]{1,10} @ www\.spip\.net \+ (.+)/ },

# HTTP Header # Composed-By
{ :search=>"headers[composed-by]", :regexp=>/SPIP @ www\.spip\.net/ },

# HTTP Header # x-spip-cache
{ :search=>"headers[x-spip-cache]", :regexp=>/^.+$/ },

]

end

