##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ReOS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-04
version "0.1"
description "REOS is hi-end software solution designed to help real estate agents, brokers and offices to easily present their properties on the internet."
website "http://www.reosonline.com/"

# Google results as at 2011-02-04 #
# 125 for "powered by reos"



# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://reos.elazos.com">ReOS</a>' },

# 2.x, 3.x # Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/reos.elazos.com">ReOS ([\d\.]+)<\/a> and released under the <a href="http:\/\/www.fsf.org\/licensing\/licenses\/agpl\-3\.0\.html">GNU\/AGPLv3 License.<\/a>/ },

# 1.x #  Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/reos.elazos.com">ReOS ([\d\.]+)<\/a> and released under the <a href="http:\/\/creativecommons.org\/licenses\/GPL\/2.0\/">GNU\/GPL License.<\/a>/ },

]

end


