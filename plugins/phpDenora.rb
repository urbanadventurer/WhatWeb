##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpDenora" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "phpDenora is the Web Frontend to the Denora Stats Server and provides a complete, nice looking and solid Interface featuring detailed network, channel and user statistics, graphical outputs, multilanguage and template systems, all by following modern web standards. Requires PHP 4.3.1+ and PHP MySQL module"
website "http://denorastats.org/"

# Google results as at 2011-03-13 #
# 253 for "powered by phpDenora" intitle:"phpDenora"

# Dorks #
dorks [
'"powered by phpDenora" intitle:"phpDenora"'
]



# Matches #
matches [

# GHDB
{ :certainty=>25, :ghdb=>'"powered by phpDenora" intitle:"phpDenora"' },

# Network Detection # Meta Description
{ :string=>/<meta name="Description" content="IRC Statistics for (.+) powered by phpDenora" \/>/ },

# Version Detection # Powered by link
{ :version=>/<td><h6 class="right">Powered by <a href="http:\/\/(phpdenora.pimpmylinux.org|denorastats.org)\/">phpDenora<\/a> v([^<]+)<\/h6><\/td>/, :offset=>1 },

]

end


