##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Added description. Added website parameter
##

Plugin.define "Zylone-IT" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.2"
description "Zylone IT is an IT company in Singapore providing web design, web solutions and internet marketing."
website "http://www.zylone.com/"

# Google results as at 2010-10-12 $
# 50 for "powered by Zylone IT" -Vulnerability

# Dorks #
dorks [
'"powered by Zylone IT" -Vulnerability'
]

matches [

# Powered by text
{ :regexp=>/Powered by[:]? <a href="http:\/\/www.zylone.com[\/]*[^>]+>Zylone IT/ },

]

end

