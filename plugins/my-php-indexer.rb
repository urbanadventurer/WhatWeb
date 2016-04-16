##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-18 #
# Updated version detection
##
Plugin.define "My-PHP-Indexer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.2"
description "PHP file indexer"
website "http://www.mafiatic.com"

# Google results as at 2010-08-01 #
# 34 for "powered by My PHP Indexer"

# Dorks #
dorks [
'"powered by My PHP Indexer"'
]



# Matches #
matches [

# Version Detectioon # Powered by text
{ :version=>/<!--Copyright--><a target="_blank" class="l" href="http:\/\/www.mafiatic.com">Powered by My PHP Indexer ([\d\.]+) \| Copyright &copy; [0-9]{4}\-[0-9]{4} Mafiatic Inc.<\/a><!--Copyright-->/ },

]

end

