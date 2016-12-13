##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Seagate-GoFlex" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-03
version "0.1"
description "Seagate-GoFlex - centralized file storage with remote access via seagateshare.com"
website "http://www.seagate.com/home-entertainment/media-sharing-devices/goflex-home/"

# ShodanHQ results as at 2011-03-13 #
# 26,995 for HOMEBASEID seagateshare.com



# Matches #
matches [

# Location Header # Device Name Detection
{ :search=>"headers[location]", :string=>/^https:\/\/www\.seagateshare\.com\/\?hipname=([^\s^&]+)/ },

# seagateshare.com # input id="inSubdomain" # Device Name Detection
{ :string=>/<input id="inSubdomain" name="inSubdomain" type="text" maxlength="30" size="23" value="([^\s^"^>]*)"><br><br>/ },

]

end

