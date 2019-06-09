##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "DUclassified"
authors [
  "Tonmoy Saikia",
  "Andrew Horton", # v0.2 # 2019-07-10 # Fix warning: character class has duplicated range
]
version "0.2"
description "DUclassified is a free Classified Ad Management system."
website "http://www.duware.com/"

# Dorks #
dorks [
'"powered by DUclassified" intitle:DUclassified'
]

matches [
{:certainty=>75, :ghdb=>'"powered by DUclassified" intitle:DUclassified' },
{:name=>"default title", :regexp=>/<title>DUclassified[\s\d\.]*<\/title>/},
{:name=>"assets/DUclassified.css", :regexp=>/<link[^>]href="[^"]*assets\/DUclassified.css"[^>]+>/ }

]

end

