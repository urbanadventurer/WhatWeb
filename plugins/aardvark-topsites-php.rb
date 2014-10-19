##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex and version detection
##
Plugin.define "Aardvark-Topsites-PHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-26
version "0.2"
description "Aardvark Topsites PHP is a free topsites script built on PHP and MySQL."
website "http://www.aardvarktopsitesphp.com/topsites/"

# Dorks #
dorks [
'"Powered by Aardvark Topsites PHP"'
]

# About 330,000 results for "Powered by Aardvark Topsites PHP" @ 2010-06-26


matches [

# GHDB Match
{ :ghdb=>'"Powered by Aardvark Topsites PHP"' },

# Default powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.aardvarktopsitesphp.com[^>]*>[^A]*Aardvark Topsites PHP/i },

# Version detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.aardvarktopsitesphp.com\/"><b>Aardvark Topsites PHP<\/b><\/a> ([\d\.]+)/ },
{ :version=>/Powered by <a href="http:\/\/www.aardvarkind.com\/">Aardvark Topsites PHP<\/a> ([\d\.]+)/ },

]

end

