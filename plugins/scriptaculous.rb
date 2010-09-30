##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name & :certainty=>100

Plugin.define "Scriptaculous" do
author "Andrew Horton"
version "0.2"
description "Javascript library"

# identifying strings
# <script src="http://www.portentinteractive.com/js/scriptaculous.js" type="text/javascript"></script>
# <script type="text/javascript" src="http://www.contre-feux.com/static/js/scriptaculous/scriptaculous.js?load=effects"></script>
# <script src="http://www.20x200.com/js/scriptaculous.js" type="text/javascript" ></script>
matches [
{:regexp=>/<script [^>]*(scriptaculous[^>]*.js)[^>]*/}
]


end


