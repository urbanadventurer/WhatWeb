##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ECShop" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "Ecshop is an Open Source Ecommerce Platform"
website "http://www.ecshop.org/"

# Google results as at 2011-03-18 #
# 485 for "powered by ECSHOP"

# Dorks #
dorks [
'"powered by ECSHOP"'
]



# Matches #
matches [

# Title
{ :certainty=>25, :regexp=>/<title>[^<]+ - Powered by ECShop<\/title>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="Generator" content="ECSHOP v([\d\.]+)" \/>/ },

]

end


