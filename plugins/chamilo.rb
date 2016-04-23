##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Chamilo" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-16
version "0.1"
description "Chamilo is a fully-fledged e-learning system. Chamilo can be connected to any open-specification system."
website "http://www.chamilo.org/"

# ShodanHQ results as at 2011-08-16 #
# 2 for X-Powered-By Chamilo

# Google results as at 2011-08-16 #
# 709 for ("Plattform Chamilo"|"Portal Chamilo"|"Plataforma Chamilo") inurl:index.php?language=
# 111 for "Congratulations! You have successfully installed your e-learning portal!" +Chamilo

# Dorks #
dorks [
'("Plattform Chamilo"|"Portal Chamilo"|"Plataforma Chamilo") inurl:index.php?language=',
'"Congratulations! You have successfully installed your e-learning portal!" "Chamilo"'
]



# Matches #
matches [

# Major Version Detection # X-Powered-By Header
{ :search=>"headers[x-powered-by]", :version=>/^Chamilo ([\d\.]+)/ },

# Help Link
{ :text=>'<link href="http://www.chamilo.org/documentation.php" rel="Help" />' },

# Major Version Detection # Meta Generator
{ :regexp=>/<meta name="Generator" content="Chamilo ([\d\.]+)">/ },

# HTML Comment
{ :text=>'<!-- end of #main" started at the end of banner.inc.php -->' },

# Full Version Detection # Footer
{ :version=>/<\/div>(Portal|Plattform|Platform|Plataforma) <a href="http:\/\/www\.chamilo\.org\/?" target="_blank">Chamilo ([^<^\s]+)<\/a> &copy;/, :offset=>1 },
{ :version=>/<div class="copyright">(Portal|Plattform|Platform|Plataforma) <a href="http:\/\/www\.chamilo\.org\/?" target="_blank">Chamilo ([^<^\s]+)<\/a> &copy;/, :offset=>1 },

]

end

