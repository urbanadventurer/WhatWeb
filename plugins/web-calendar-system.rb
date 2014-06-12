##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Web-Calendar-System" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-15
version "0.2"
description "web calendar system"

# Google results as at 2010-06-15 #
# 18,000,000 for +intitle:"Web Calendar system v" inurl:.asp



# Matches #
matches [

# GHDB Match
{ :certainty=>25, :ghdb=>'+intitle:"Web Calendar system v" inurl:.asp' },

# Version Detection # Default Title
{ :version=>/<TITLE>Web Calendar system v ([\.\d]+)<\/TITLE>/ },

]

end

