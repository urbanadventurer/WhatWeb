##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetArtMedia-Real-Estate-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.1"
description "NetArtMedia Real Estate Portal allows you to launch powerful and professional looking real estate portals with rich functionalities for the private sellers, buyers and real estate agents to list properties for sale or rent, search in the database, show featured ads and many others."
website "http://www.netartmedia.net/realestate/"

# 32 results for "powered by Real Estate Portal" @ 2010-09-03


matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.netartmedia.net/realestate" target="_blank">Real Estate Portal</a>' },
{ :text=>'Powered by <a href="http://www.netartmedia.net/realestate">Real Estate Portal</a>' },

# Javascript
{ :text=>'			document.form1.property_type.options[i] = new Option(CurrentModels[i], CurrentModels[i], 0, 0);' },

]

end

