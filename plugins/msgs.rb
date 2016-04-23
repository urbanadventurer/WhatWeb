##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MSGS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "Mercury Satellite Ground Station is a software system for commanding and controlling a satellite ground station. It's goal is to help enable ubiquitous access to satellite resources via the Internet."
website "Homepage: http://mgsn.sourceforge.net/"

# Google results as at 2011-05-20 #
# 2 for intitle:"Mercury Satellite Ground Station"

# Dorks #
dorks [
'intitle:"Mercury Satellite Ground Station"'
]



# Matches #
matches [

# Version Detection # Default Title
{ :version=>/<title> Mercury Satellite Ground Station: Version ([\d\.]+)<\/title>/ },

]

end

