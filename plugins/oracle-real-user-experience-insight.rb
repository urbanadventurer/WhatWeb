##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Real-User-Experience-Insight" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-03-30
version "0.1"
description "Oracle Real User Experience Insight - passive network performance analysis and usage analysis"
website "http://www.oracle.com/technetwork/oem/uxinsight/"

# Google results as at 2013-03-30 #
# 1 for intitle:"Oracle Real User Experience Insight" inurl:ruei "Please login"

# Dorks #
dorks [
'intitle:"Oracle Real User Experience Insight" inurl:ruei "Please login"'
]



# Matches #
matches [

# /ruei/main.php # Hostname
{ :string=>/<title>Oracle Real User Experience Insight \-\[ ([^\s]+@[^\s]+) \]\-<\/title>/ },

# /ruei/main.php # Version Detection
{ :version=>/<title>Oracle Real User Experience Insight \-\[ ([\d\.a-z]+) \]\-<\/title>/ },
{ :version=>/<div class="windowWatermark">Version: ([^\s]+)/ },

# /ruei/rpc.php
{ :url=>"/ruei/rpc.php", :text=>'{"retval":false,"error_' },

]

end

