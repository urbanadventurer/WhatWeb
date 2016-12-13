##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Inout-Article-Base" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "Inout Article Base is a powerful, feature rich, fully customizable article script from inoutscripts.com. This is a highly Search Engine Optimized script which helps you to publish unlimited number of articles."
website "http://www.inoutscripts.com/products/inout_article_base/"

# 154 results for "Powered by Inoutscripts" @ 2010-10-12

# Dorks #
dorks [
'"Powered by Inoutscripts"'
]



matches [

# Default Javascript # Certainty=>75 as this is used by other Inout scripts
{ :text=>'function trim(stringValue){return stringValue.replace(/(^\s*|\s*$)/, "");}', :certainty=>75 },

# Admin page # Default title
{ :text=>'<title>Inout Article Base - Admin Area</title>' },

# Login page # Default title
{ :text=>'<title>Inout ArticleBase - Login</title>' },

# Powered by text # Certainty=>75 as this is used by other Inout scripts
{ :text=>' href="http://www.inoutscripts.com/?r=0">Powered by Inoutscripts</a>', :certainty=>75 },

]

end

