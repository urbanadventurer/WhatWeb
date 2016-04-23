##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPShop" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-26
version "0.1"
description "PHPShop - A shopping cart application. Documentation, download, demo, and forums are provided. (PHP,MySQL)"
website "http://code.google.com/p/phpshop/"

# Google results as at 2011-02-26 #
# 243 for "powered by PHPShop"

# Dorks #
dorks [
'"powered by PHPShop"'
]



# Matches #
matches [

# GHDB Match
{ :certainty=>25, :regexp=>/Powered by phpShop/i },

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.phpshop.org"[^>]*>phpShop<\/a>/i },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.phpshop.org"[^>]*>phpShop<\/a>[\r\n\s]+([\d\.]+) / },

]

end


