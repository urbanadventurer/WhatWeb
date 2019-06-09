##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ISPConfig"
authors [
  "Andrew Horton",
  # v0.2 # removed :probability
  # v0.3 # make powered by case insensitive, added 2nd example
]
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

