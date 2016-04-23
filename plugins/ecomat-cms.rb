##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ecomat-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "Ecomat CMS"
website "http://www.ecomat.ch/"



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="Generator" content="ECOMAT CMS ([\d\.]{1,5})">/ },

]

end


