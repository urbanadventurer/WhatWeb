##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Meta-City" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-20
version "0.1"
description "This plugin retrieves the city from the meta city tag. This tag is used by the Gigablast search engine."

examples %w|
http://www.gigablast.com/tagsdemo.html
|

matches [

# Extract city
{ :version=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?city[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i, :offset=>0 },
{ :version=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?city/i, :offset=>0 },

]

end

