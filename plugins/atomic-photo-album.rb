##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Updated version detection
##
Plugin.define "Atomic-Photo-Album" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.2"
description "Photo album software"
website "http://atomicpa.sourceforge.net/"

# Google results as at 2010-09-18 #
# 12 for "powered by Atomic Photo Album" -Vulnerabilities inurl:apa_album_ID
# 31 for "powered by Atomic Photo Album" -Vulnerabilities -inurl

# Dorks #
dorks [
'"powered by Atomic Photo Album" -Vulnerabilities -inurl inurl:apa_album_ID'
]



# Matches #
matches [

	# Version Detection # Powered by text
	{ :version=>/Powered by <a href="http:\/\/atomicpa.sourceforge.net\/" target="_blank">Atomic Photo Album ([\d\.a-z]+)<\/a>/ },

]

end

