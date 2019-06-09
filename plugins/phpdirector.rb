##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "PHPDirector"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-07-24
  # v0.2 # 2011-02-19 # Updated version detection. 
]
version "0.2"
description "PHPDirector is a content management system that allows users to create there own video sharing websites."
website "http://www.phpdirector.co.uk/"

# Google results as at 2010-07-24 #
# 181 for "powered by PHP Director"

# Dorks #
dorks [
'"powered by PHP Director"'
]



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/<a href="http:\/\/www.phpdirector.co.uk\/">Powered by PHP Director ([\d\.]+)<\/a>/ },

]

end

