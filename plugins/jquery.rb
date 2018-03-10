##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# removed :probability
##
# Version 0.3
# rewrite
##
# Version 0.4
# added another match line from Eric Sesterhenn

Plugin.define "JQuery" do
author "Andrew Horton"
version "0.4"
description "A fast, concise, JavaScript that simplifies how to traverse HTML documents, handle events, perform animations, and add AJAX."
website "http://jquery.com/"



# Matches #
matches [

# JavaScript
{ :regexp=>/<script [^>]*jquery/ },

# JavaScript # Version Detection
{ :version=>/jquery(\.min)?\.js\?ver=([0-9\.]+)['"]/, :offset=>1 },
{ :version=>/jquery-([0-9\.]+)(\.min)?\.js/, :offset=>0 }

]

end

