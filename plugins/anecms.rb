##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex
##
Plugin.define "ANECMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-15
version "0.2"
description "ANECMS - homepage: http://anecms.com/"

# 11 results for "powered by anecms" @ 2010-06-15
examples %w|
anecms.com
demo.anecms.com
devalien.com
87.252.187.245/ane/
girolaghiamo.delta-support.ch
|

matches [

# Default meta author
{ :text=>'<meta name="Author" content="Erwin Aligam - ealigam@gmail.com" />' },

# Powered by text
{ :ghdb=>'"powered by anecms"', :certainty=>75 },
{ :regexp=>/&copy; [\d]{4} <strong><a href="http:\/\/anecms.com[^\>]*>anecms.com<\/a><\/strong>/ },

# Default title
{ :regexp=>/<title>[^<^\-]+- Powered By ANECMS<\/title>/ },

]

end

