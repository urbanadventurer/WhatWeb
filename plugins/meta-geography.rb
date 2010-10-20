##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Meta-Geography" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-20
version "0.1"
description "This plugin retrieves the geography from the meta geography, geo.position, geo.placename and geo.region tags."

examples %w|
www.wasab.dk/morten/blog/archives/category/linux/
www.larsolofsson.se
lars.nocrew.org
|

matches [

# Get geography
{ :version=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?geography[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i, :version_regexp_offset=>0 },
{ :version=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?geography/i, :version_regexp_offset=>0 },

# Get geo.position
{ :version=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?geo.position[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i, :version_regexp_offset=>0 },
{ :version=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?geo.position/i, :version_regexp_offset=>0 },

# Get geo.placename
{ :version=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?geo.placename[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i, :version_regexp_offset=>0 },
{ :version=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?geo.placename/i, :version_regexp_offset=>0 },

# Get geo.region
{ :version=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?geo.region[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i, :version_regexp_offset=>0 },
{ :version=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?geo.region/i, :version_regexp_offset=>0 },

]

end

