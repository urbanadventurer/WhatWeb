##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Plogger" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Plogger is the next generation in open-source photo gallery systems."
website "http://www.plogger.org/"

# 328 results for "powered by Plogger" @ 2010-09-18

# Dorks #
dorks [
'"powered by Plogger"'
]



matches [

# Default title
{ :regexp=>/<title>[^powered]+powered by Plogger Gallery<\/title>/ },

# Powered by text
{ :regexp=>/<a[\ title="Powered by Plogger"]* href="http:\/\/www.plogger.org\/">Powered by Plogger[!]*<\/a>/ },

]

end

