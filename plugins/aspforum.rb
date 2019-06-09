##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ASPForum"
authors [
  "Mateusz Golewski",
]
version "0.1"
description "Kind of ASP forum."

matches [

{:version=>/<div[^>]+id="FORUMS_FORUM_GROUP_V([\d_]+)/,  :name=>"version" },

]

end
