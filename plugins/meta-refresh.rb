##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-01-31 #
# Updated regex
##
# Version 0.2
# renamed from Meta-Refresh to Meta-Refresh-Redirect
# Expanded description
##
Plugin.define "Meta-Refresh-Redirect" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-26
version "0.3"
description "Meta refresh tag is a deprecated URL element that can be
used to optionally wait x seconds before reloading the current page or loading a
new page. More info: https://secure.wikimedia.org/wikipedia/en/wiki/Meta_refresh"

# Google results as at 2011-01-31 #
# 2,510,000 for "you will be redirected in * seconds"

# Examples #
examples %w|
www.google.com/mobile/gmail/
ubi.com/US/
skilibertyskipatrol.org
www.eplrs.com
www.nga-earth.org
www.maxim.com
www.cms.il.gov/iisradio/
|

# Matches #
matches [

# Extract URL from Meta Tag
{ :string=>/<meta[\s]+http\-equiv[\s]*=[\s]*['"]?refresh['"]?[^>]+content[\s]*=[^>]*[0-9]+;[\s]*url=['"]?([^"^'^>]+)['"]?[^>]*>/i },

]

end

