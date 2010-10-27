##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Meta-Description" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-20
version "0.1"
description "This plugin retrieves the description from the meta description tag."

examples %w|
itsecuritysolutions.org
yehg.net
www.backtrack-linux.org
|

matches [

# Get description
{ :version=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?description[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i, :version_regexp_offset=>0 },
{ :version=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?description/i, :version_regexp_offset=>0 },

]

end

