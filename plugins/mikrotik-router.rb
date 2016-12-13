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
# Version 0.4
# Added md5 match for 401 page
##
Plugin.define "MikroTik" do
author "Andrew Horton"
version "0.4"
description "MikroTik router"
website "http://www.mikrotik.com"

# identifying strings
# <title>mikrotik routeros > administration</title>
# <div class="top">mikrotik routeros 3.20 configuration page</div>
# <div class="top">mikrotik routeros 2.9.27 configuration page</div>

# Dorks #
dorks [
'intitle:"mikrotik routeros > administration" "Winbox is the graphical configuration application for RouterOS."'
]



# Matches #
matches [

{:text=>"<title>mikrotik routeros > administration</title>"},
{:version=>/<div class="top">mikrotik routeros ([^ ]+) configuration page</,  :name=>"mikrotik routeros ([^ ]+) configuration page" },
{:md5=>"bacf8a0c6f3e702db9be393989b2a0b5", :name=>"401 page"}

]



end


