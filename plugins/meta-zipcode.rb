##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Meta-Zipcode" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-20
version "0.1"
description "This plugin retrieves the zipcode from the meta zipcode tag. This tag is used by the Gigablast search engine."

examples %w|
http://www.gigablast.com/tagsdemo.html
|

matches [

# Extract zipcode
{ :string=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?zipcode[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i },
{ :string=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?zipcode/i },

]

end

