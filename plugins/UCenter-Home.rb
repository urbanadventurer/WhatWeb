##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "UCenter-Home" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "homepage: http://u.discuz.net"

# 431 results for "powered by UCenter Home" @ 2010-10-12
# 89 results "powered by UCenter Home" inurl:.gov @ 2010-10-12

# Dorks #
dorks [
'"powered by UCenter Home"'
]



matches [

# Default title
{ :text=>'Powered by UCenter Home</title>' },

# Version detection # Powered by text
{ :version=>/Powered by <a  href="http:\/\/u.discuz.net" target="_blank"><strong>UCenter Home<\/strong><\/a> <span title="[0-9]{8}">([\d\.]+)<\/span>/ },

]

end

