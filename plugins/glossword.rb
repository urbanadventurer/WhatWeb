##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-29 #
# Updated version detection
##
Plugin.define "Glossword" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.2"
description "Glossword helps you to create and publish online multilingual dictionary, glossary, or reference."
website "http://glossword.biz/"

# Google results as at 2013-02-06 #
# 458 for "Powered by Glossword"

# Dorks #
dorks [
'"Powered by Glossword"'
]



# Matches #
matches [

	# Version Detection # Meta generator
	{ :version=>/<meta name="generator" content="Glossword version ([\d\.\-a-z]+)" \/>/ },
	{ :version=>/<meta content="Glossword version ([\d\.\-a-z]+)" name="generator" \/>/ },

	# Version Detection # Powered by text
	{ :version=>/<p>Powered by <a href="http:\/\/glossword.info\/" style="text-decoration:underline">Glossword<\/a> ([\d\.]+)<\/p>/ },

]

end

