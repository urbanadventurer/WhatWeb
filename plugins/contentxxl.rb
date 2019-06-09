##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ContentXXL"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-03
]
version "0.1"
description "ContentXXL - CMS [German] - Requires: .NET"
website "http://www.contentxxl.de/"



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="contentXXL Business Content Management System  ([^\(]+)\([^\)]+\) \/ contentXXL International GmbH \/ www.contentxxl.de" [\/]?>/ },

# .NET Version Detection # Meta Generator
{ :string=>/<meta name="generator" content="contentXXL Business Content Management System  [^\(]+\(([^\)]+), [^,^>]+, (Release|Debug)\) \/ contentXXL International GmbH \/ www.contentxxl.de" [\/]?>/ },


]

end


