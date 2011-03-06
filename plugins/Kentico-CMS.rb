##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kentico-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.1"
description "Kentico CMS for ASP.NET - flexible, all-in-one solution for web developers - Homepage: http://www.kentico.com/"

# Examples #
examples %w|
www.kentico.com
www.groupsuaptrujillo.com
|

# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<\/title><meta name="generator" content="Kentico CMS [^\(^>]{1,5} \(build ([\d\.]{1,10})\) [^"^>]*" \/>/ },

]

end


