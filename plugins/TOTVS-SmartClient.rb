##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TOTVS-SmartClient" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-24
version "0.1"
description "TOTVS SmartClient MacOS TOTVS Application Server. - Homepage: http://www.totvs.com/"

# ShodanHQ results as at 2012-04-24 #
# 17 for TotvsSmartClient

# Google results as at 2012-04-24 #
# 12 for intitle:"TOTVSSMARTCLIENT" "URL do Totvs Server"

# Dorks #
dorks [
'intitle:"TOTVSSMARTCLIENT" "URL do Totvs Server"'
]

# Examples #
examples %w|
189.112.219.236
200.169.9.135
189.3.92.130
189.42.119.18
189.42.119.21
200.175.6.110
|

# Matches #
matches [

# TotvsSmartClientax.cab # Version Detection
{ :version=>/<object\s+classid="clsid:[a-f\d\-]+"\s+codebase="TotvsSmartClientax\.cab#version=([^"]+)"/ },

# param name # StartProgram
{ :string=>/<param name="StartProgram" value="([^"]+)"> <<= Programa/ },

# param name # Environment
{ :string=>/<param name="Environment" value="([^"]+)"> <<= Ambiente/ },

# HTTP Header
{ :search=>"headers[TotvsSmartClient]", :regexp=>/^TotvsSmartClient$/ },

]

end

