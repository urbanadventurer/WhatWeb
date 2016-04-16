##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iTalkBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-19
version "0.1"
description "iTalkBB is a local and long distance calling service provided by iTalk Broadband Corporation. It combines voice and internet networks to provide inbound and outbound long distance and local calling solutions."
website "http://www.italkbb.com/"
# Default Login: 12345678 or 87654321

# 10 for intitle:"V1" "welcome to phone settings" password -intitle

# Dorks #
dorks [
'intitle:"V1" "welcome to phone settings" password -intitle'
]



# Matches #
matches [

# Version Detection
{ :version=>/<HTML><HEAD><TITLE>[^>]+ V([\d\.]+)[\s]+<\/TITLE><STYLE type=text\/css>TD \{FONT-SIZE: 12px; LINE-HEIGHT: normal; TEXT-ALIGN: center\}<\/STYLE>/ },

# welcome to phone settings + form tag
{ :regexp=>/<P align=center><FONT size=5>welcome to phone settings<\/FONT><\/P><FORM action=\/a /i },

]

end


