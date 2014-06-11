##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 #
# Updated model detection
##
# Version 0.2 #
# Updated version detection
##
Plugin.define "IQeye-Netcam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.3"
description "IQeye netcam web interface"

# Google rsults as at 2010-07-11 #
# 5 for intitle:"IQeye302 | IQeye303 | IQeye601 | IQeye602 | IQeye603" intitle:"Live Images"



# Matches #
matches [

# Model detection # Default title
{ :model=>/<title>IQeye([^:]+): Live Images[^<]*<\/title>/i },

]

end

