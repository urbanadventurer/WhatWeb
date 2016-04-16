##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Vimeo" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-22
version "0.1"
description "Vimeo.com video player"
website "http://vimeo.com/"



# Matches #
matches [

# param|embed|object Source
{ :regexp=>/<(param|object|embed) [^>]+vimeo\.com\/moogaloop/i },

# iframe
{ :regexp=>/<iframe [^>]*src=['"]https?:\/\/player\.vimeo\.com\/video\// },

]

end


