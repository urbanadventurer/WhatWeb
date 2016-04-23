##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Pro-Bid" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "PHP Pro Bid - Auction software"
website "http://www.phpprobid.com/"

# Google results as at 2011-02-27 #
# 33 for "PLEASE LOGIN TO THE ADMIN AREA" "Current Version"

# Dorks #
dorks [
'"PLEASE LOGIN TO THE ADMIN AREA" "Current Version"'
]



# Matches #
matches [

# Version Detection # Copyright text
{ :version=>/            <div class="version">Current Version:[\r\n]+               ([\d\.]{1,5})            <\/div>[\r\n]+/ },

# Admin Page # Login text
{ :regexp=>/<td colspan="2" bgcolor="#[^"]{3,6}" style="color: #ffffff; font-weight: bold;">PLEASE LOGIN TO THE ADMIN AREA<\/td>/ },

]

end


