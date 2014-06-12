##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Object" do
author "Andrew Horton"
version "0.1"
description "HTML object tag. This can be audio, video, Flash, ActiveX, Python, etc. More info: http://www.w3schools.com/tags/tag_object.asp"

# Exmples #


# Matches #
matches [

{:regexp=>/<object/i},

# object tag # classid
{:module=>/<object [^>]*classid\s*=\s*['"]([^"']+)['"]/i, :offset=>0, :name=>"classid" },
{:module=>/<object [^>]*classid\s*=\s*([^\s>'"]+)/i, :offset=>0, :name=>"classid" },

# object tag
{:string=>/<object [^>]*(codebase|codetype|type)\s*=\s*['"]([^"']+)['"]/i, :offset=>1 },
{:string=>/<object [^>]*(codebase|codetype|type)\s*=\s*([^\s>'"]+)/i, :offset=>1 },

]

end

