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
#known bug - will output ' or " - why don't the (?:re) work? http://www.ruby-doc.org/docs/ProgrammingRuby/html/language.html
examples %w| 58.152.54.87 www.morebankusa.com|

matches [
{:regexp=>/<object/i},
{:module=>/<object [^>]*classid=((?:')([^']+)|(?:")([^"]+)|([^\s>]+))/i, :offset=>0, :name=>"classid" }, #"

{:string=>/<object [^>]*codebase=('[^']+|"[^"]+|[^\s>]+)/i, :name=>"codebase" }, #"
{:string=>/<object [^>]*codetype=('[^']+|"[^"]+|[^\s>]+)/i, :name=>"codetype" }, #"
{:string=>/<object [^>]*type=('[^']+|"[^"]+|[^\s>]+)/i, :name=>"type" }, #"

]


end

