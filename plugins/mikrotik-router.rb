##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# remove :certainty & :name 
# Version 0.3
# Uses :version=>//

Plugin.define "MikroTik" do
author "Andrew Horton"
version "0.3"
description "MikroTik router. Homepage: http://www.mikrotik.com"

# identifying strings
# <title>mikrotik routeros > administration</title>
# <div class="top">mikrotik routeros 3.20 configuration page</div>
# <div class="top">mikrotik routeros 2.9.27 configuration page</div>


matches [
{:text=>"<title>mikrotik routeros > administration</title>"},
{:version=>/<div class="top">mikrotik routeros ([^ ]+) configuration page</,  :name=>"mikrotik routeros ([^ ]+) configuration page" } 
]



end


