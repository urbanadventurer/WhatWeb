##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "bitweaver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Bitweaver is a free and open source web application framework and content management system. Its speed and power are ideal for large-scale community websites and corporate applications, but it is simple enough for non-technical small site users to set up and administrate. It comes fully featured on install but is modular and easy to extend."
website "http://www.bitweaver.org/"

# Google results as at 2011-02-24 #
# 151 for "powered by bitweaver"

# Dorks #
dorks [
'"powered by bitweaver"'
]



# Matches #
matches [

# Powered By HTML
{ :text=>'<a id="poweredby" class="external" href="http://www.bitweaver.org">Powered by bitweaver</a>' },

# Meta Generator
{ :text=>'<meta name="generator" content="bitweaver - http://www.bitweaver.org" />' },

]

end


