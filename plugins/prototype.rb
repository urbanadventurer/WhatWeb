##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty

Plugin.define "Prototype" do
author "Andrew Horton"
version "0.2"
description "Javascript library"
# identifying strings
# <script src="http://www.20x200.com/js/prototype.js" type="text/javascript" charset="utf-8" >
# <script type="text/javascript" src="http://www.contre-feux.com/static/js/prototype1.6.0.js"></script>
# <script src="http://www.portentinteractive.com/js/prototype.js" type="text/javascript"></script>
# <script type="text/javascript" src="http://www.blogsmithmedia.com/www.bloggingstocks.com/b-c/prototype.js"></script>

matches [
{:name=>"js tag", :regexp=>/<script [^>]*(prototype[^>]*.js)[^>]*/}
]


end


