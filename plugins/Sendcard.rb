##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sendcard" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Sendcard is a multi-database (It currently supports 9 different databases!) ecards script or virtual postcard program written in PHP. Suitable for large or small sites, it is very easy to setup, and comes with an installation wizard."
website "http://www.sendcard.org/"

# Google results as at 2011-03-15 #
# 255 for scscsc320
# 141 for "Powered by sendcard - an advanced PHP e-card program" -dork

# Dorks #
dorks [
'"scscsc320"',
'"Powered by sendcard - an advanced PHP e-card program" -dork'
]



# Matches #
matches [

# Powered by logo link
{ :regexp=>/<a href="http:\/\/(sendcard.sf.net|www.sendcard.org)\/"( title="download your own PHP e-card script")?><img src="poweredbysendcard102x47.gif"[^>]+alt="Powered by sendcard - an advanced PHP e-card program"[^>]*><\/a>/ },

# Powered by logo
{ :certainty=>25, :regexp=>/<img src="poweredbysendcard102x47.gif"[^>]+alt="Powered by sendcard - an advanced PHP e-card program">/ },

# HTML Comment
{ :text=>"<!-- The following line should allow me to search on google and find sendcard installations -->" },

# "scscsc320" string provided for Google hackers as per HTML comment:
# <!-- The following line should allow me to search on google and find sendcard installations -->
{ :text=>'<div style="display: none; color: White;">scscsc320</div>' },

]

end


