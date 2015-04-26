##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DUclassified" do
author "Tonmoy Saikia"
version "0.1"
description "DUclassified is a free Classified Ad Management system."
website "http://www.duware.com/"

# Dorks #
dorks [
'"powered by DUclassified" intitle:DUclassified'
]



#<title>DUclassified</title>
#:<title>DUclassified 4.0</title>
# <link href="assets/DUclassified.css" rel="stylesheet" type="text/css"> 


matches [
{:certainty=>75, :ghdb=>'"powered by DUclassified" intitle:DUclassified' },
{:name=>"default title", :regexp=>/<title>DUclassified[\s\d\.\d]*<\/title>/},
{:name=>"assets/DUclassified.css", :regexp=>/<link[^>]href="[^"]*assets\/DUclassified.css"[^>]+>/ }#"

]

end

