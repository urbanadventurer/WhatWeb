##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "YAF.NET"
authors [
  "Eugene Amirov",
]
version "0.1"
description "YAF is a .NET forum engine."

matches [
{
    :name=>"Copyright for version 1",
    :regexp=>/Copyright &copy; 2\d{3}-2\d{3} Yet Another Forum.net/
}, {
    :name=>"Copyright for version 2",
    :regexp=>/YAF.NET &copy; 2\d{3}-2\d{3}, Yet Another Forum.NET/
},
]

end
