##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :probability
# Version 0.3
# make powered by case insensitive, added 2nd example

Plugin.define "ISPConfig" do
author "Andrew Horton"
version "0.3"
description "ISPConfig is a free, opensource hosting control panel"
website "http://www.ispconfig.org/"



# Dorks #
dorks [
'powered by ISPConfig'
]

# Matches #
matches [

{:regexp=>/powered by <a HREF="http:\/\/www.ispconfig.org">ISPConfig<\/a>/i },
{:certainty=>75, :text=>'This IP address is shared. For access to the web site which you look for, enter its address instead of its IP.' }

]

end

