##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zylone-IT" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "homepage: http://www.zylone.com/"

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

