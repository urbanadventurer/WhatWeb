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
description "SPIP is a publishing system for the Internet in which great importance is attached to collaborative working, to multilingual environments, and to simplicity of use for web authors."
website "http://www.spip.net/"

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

# a href="spip.php
{ :text=>'<a href="spip.php' },

# img src='/spip
{ :text=>'<img src=\'/spip' },

]

end

