##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "QuickerSite" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.1"
description "QuickerSite is a Content Management System for Windows Servers. It is written in ASP/VBScript with an optional pinch of ASP.NET for true image-resizing capabilities."
website "http://www.quickersite.com/"

# Google results as at 2011-03-04 #
# 111 for "Powered by QuickerSite"

# Dorks #
dorks [
'"Powered by QuickerSite"'
]



# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta content="QuickerSite CMS - visit www.quickersite.com" name="generator" \/>/i },

{ :regexp=>/<meta name="generator" content="QuickerSite CMS - visit www.quickersite.com">/i },

]

end


