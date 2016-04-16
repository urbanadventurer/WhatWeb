##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CreateLive-Cms" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-22
version "0.1"
description "CreateLive Cms"
website "http://www.aspoo.cn/"

# ShodanHQ results as at 2012-07-22 #
# 143 for Kill=kill
# 126 for Aspoo=GuestSID

# Google results as at 2012-07-22 #
# 449 for intext:"Powered by CreateLive CMS Version"

# Dorks #
dorks [
'intext:"Powered by CreateLive CMS Version"'
]



# Matches #
matches [

# Powered by text # Version Detection
{ :version=>/Powered by:(<a href="http:\/\/www.aspoo.cn\/" target="_blank">)?CreateLive CMS Version ([\d\.]+)/i },

# HTML Comment # The major version is correct # the minor version is a lie
{ :version=>/<!--By CreateLiveCms (\d)\.00-->/ },

# Set-Cookie # Kill=kill=(Yes|No)
{ :search=>"headers[set-cookie]", :regexp=>/Kill=kill=(Yes|No)/ },

]

end

