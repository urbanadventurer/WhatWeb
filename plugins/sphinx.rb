##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Sphinx"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-07-04
]
version "0.1"
description "Sphinx is a tool that makes it easy to create intelligent and beautiful documentation"
website "http://sphinx.pocoo.org/"

# Google results as at 2011-07-04 #
# 363 for "Created using Sphinx" +Copyright

# Dorks #
dorks [
'"Created using Sphinx" "Copyright"'
]



# Matches #
matches [

# Version Detection # Created using link
{ :version=>/Created using <a href="http:\/\/sphinx\.pocoo\.org\/">Sphinx<\/a> ([^\s]+)\./ },

# div class="sphinxsidebar" and div class="sphinxsidebarwrapper"
{ :regexp=>/<div class="sphinxsidebar">[\s]+<div class="sphinxsidebarwrapper">/ },

]

end

