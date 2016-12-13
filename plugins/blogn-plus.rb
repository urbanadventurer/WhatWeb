##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex matches and version detection
##
Plugin.define "BlognPlus" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-15
version "0.2"
description "BlognPlus"
website "http://www.blogn.org/"

# 106 results for "powered by BlognPlus" @ 2010-06-15

# Dorks #
dorks [
'"powered by BlognPlus"'
]



matches [

# Default powered by text
{ :regexp=>/Powered by[\s]*<a href="http:\/\/www.blogn.org[^>]*>BlognPlus/i },

# Version detection # Meta generator
{ :version=>/<meta name="generator"[^>]*content="BlognPlus ([0-9\.]+)/ },

]

end

# It may be possible to guess the version depending on the copyright dates:
# <META name="copyright" content="Copyright 2000-2006 CMScontrol-GervaWeb">
# <META NAME='copyright' CONTENT='Copyright © Gerva Srl'>

