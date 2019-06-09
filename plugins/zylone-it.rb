##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Zylone-IT"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-12
  "Andrew Horton", # v0.2 # 2016-04-17 # Added description. Added website parameter. 
]
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

