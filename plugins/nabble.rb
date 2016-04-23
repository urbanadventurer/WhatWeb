##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nabble" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-16
version "0.1"
description "Freed embeddable web apps"
website "http://www.nabble.com/"

# Google results as at 2011-05-16 #
# 480 for "powered by Nabble"

# Dorks #
dorks [
'"powered by Nabble"'
]



# Matches #
matches [

# Error Page # div class "nabble"
{ :text=>'<div class="nabble" id="nabble">' },

# Error Page # Powered by link
{ :text=>'Powered by <a href="http://www.nabble.com/" target="_top" title="Free forum and other embeddable web apps">Nabble</a>' },

# table class "footer-table shaded-bg-color"
{ :text=>'<table class="footer-table shaded-bg-color">' },

]

end


